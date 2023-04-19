// Import dependencies
const inquirer = require('inquirer');
const mysql = require('mysql2');

// Create connection to database
const connection = mysql.createConnection({
  host: 'localhost',
  port: 3306,
  user: 'root',
  password: 'Yogbox123!',
  database: 'employee_db',
});

// Connect to database
connection.connect((err) => {
  if (err) throw err;
  console.log('Connected to database');
  start();
});

// Prompt user for action to take
function start() {
  inquirer
    .prompt({
      name: 'action',
      type: 'list',
      message: 'What would you like to do?',
      choices: [
        'View all departments',
        'View all roles',
        'View all employees',
        'Add a department',
        'Add a role',
        'Add an employee',
        'Update an employee role',
        'Exit',
      ],
    })
    .then((answer) => {
      switch (answer.action) {
        case 'View all departments':
          viewDepartments();
          break;
        case 'View all roles':
          viewRoles();
          break;
        case 'View all employees':
          viewEmployees();
          break;
        case 'Add a department':
          addDepartment();
          break;
        case 'Add a role':
          addRole();
          break;
        case 'Add an employee':
          addEmployee();
          break;
        case 'Update an employee role':
          updateEmployeeRole();
          break;
        case 'Exit':
          connection.end();
          break;
      }
    });
}

// Functions for each action

function viewDepartments() {
  connection.query('SELECT * FROM departments', (err, res) => {
    if (err) throw err;
    console.table(res);
    start();
  });
}

function viewRoles() {
  connection.query('SELECT * FROM roles', (err, res) => {
    if (err) throw err;
    console.table(res);
    start();
  });
}

function viewEmployees() {
  connection.query('SELECT * FROM employees', (err, res) => {
    if (err) throw err;
    console.table(res);
    start();
  });
}

function addDepartment() {
  inquirer
    .prompt({
      name: 'name',
      type: 'input',
      message: 'Enter the name of the department:',
    })
    .then((answer) => {
      connection.query(
        'INSERT INTO departments SET ?',
        {
          name: answer.name,
        },
        (err) => {
          if (err) throw err;
          console.log('Department added successfully');
          start();
        }
      );
    });
}

function addRole() {
  inquirer
    .prompt([
      {
        name: 'title',
        type: 'input',
        message: 'Enter the title of the role:',
      },
      {
        name: 'salary',
        type: 'input',
        message: 'Enter the salary for the role:',
      },
      {
        name: 'department_id',
        type: 'input',
        message: 'Enter the department ID for the role:',
      },
    ])
    .then((answer) => {
      connection.query(
        'INSERT INTO roles SET ?',
        {
          title: answer.title,
          salary: answer.salary,
          department_id: answer.department_id,
        },
        (err) => {
          if (err) throw err;
          console.log('Role added successfully');
          start();
        }
      );
    });
}

function addEmployee() {
        inquirer
        .prompt([
        {
        name: 'first_name',
        type: 'input',
        message: "Enter the employee's first name:",
        },
        {
        name: 'last_name',
        type: 'input',
        message: "Enter the employee's last name:",
        },
        {
        name: 'role_id',
        type: 'input',
        message: "Enter the employee's role ID:",
        },
        {
        name: 'manager_id',
        type: 'input',
        message: "Enter the employee's manager ID:",
        },
        ])
        .then((answer) => {
        connection.query(
        'INSERT INTO employees SET ?',
        {
        first_name: answer.first_name,
        last_name: answer.last_name,
        role_id: answer.role_id,
        manager_id: answer.manager_id,
        },
        (err) => {
        if (err) throw err;
        console.log('Employee added successfully');
        start();
        }
        );
        });
        }
        
        function updateEmployeeRole() {
        // Get list of employees
        connection.query('SELECT * FROM employees', (err, employees) => {
        if (err) throw err;

        // Convert list of employees to choices for inquirer prompt
const employeeChoices = employees.map((employee) => ({
    name: `${employee.first_name} ${employee.last_name}`,
    value: employee.id,
  }));
  
  // Prompt user to select employee to update
  inquirer
    .prompt({
      name: 'employee_id',
      type: 'list',
      message: 'Which employee would you like to update?',
      choices: employeeChoices,
    })
    .then((employeeAnswer) => {
      // Prompt user to select new role for employee
      connection.query('SELECT * FROM roles', (err, roles) => {
        if (err) throw err;
  
        // Convert list of roles to choices for inquirer prompt
        const roleChoices = roles.map((role) => ({
          name: role.title,
          value: role.id,
        }));
  
        inquirer
          .prompt({
            name: 'role_id',
            type: 'list',
            message: 'Which role would you like to assign?',
            choices: roleChoices,
          })
          .then((roleAnswer) => {
            // Update employee's role in database
            connection.query(
              'UPDATE employees SET role_id = ? WHERE id = ?',
              [roleAnswer.role_id, employeeAnswer.employee_id],
              (err) => {
                if (err) throw err;
                console.log('Employee role updated successfully');
                start();
              }
            );
          });
      });
    });
  });
  }