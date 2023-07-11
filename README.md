# MySQL Command-line Application

This is a command-line application that interacts with a MySQL database. It allows users to perform various actions such as viewing departments, roles, and employees, as well as adding departments, roles, employees, and updating employee roles.

## Installation

To use this application, please ensure that you have the following software installed:

- MySQL Server: Install and configure MySQL Server on your machine.
- MySQL Client: Install the MySQL Client to interact with the database from the command-line.

Once you have installed the necessary software, follow the steps below to set up the application:

1. Clone the repository or download the source code.
2. Open a terminal or command prompt and navigate to the project directory.
3. Create a new MySQL database using the provided SQL script:

mysql -u your_username -p < database.sql


Replace `your_username` with your MySQL username, and you will be prompted to enter your MySQL password.
4. Update the database connection details in the application's configuration file (`config.js` or `config.json`). Set the host, port, username, password, and database name according to your MySQL configuration.

## Usage

To run the application, execute the main script from the command-line:

node app.js



The application will start and present you with the following options:

1. View all departments
2. View all roles
3. View all employees
4. Add a department
5. Add a role
6. Add an employee
7. Update an employee role

Select the desired option by entering the corresponding number and press Enter.

### View all departments

Choosing this option will display a formatted table showing all department names and their respective IDs.

### View all roles

Choosing this option will display a formatted table showing the job titles, role IDs, departments, and salaries for each role.

### View all employees

Selecting this option will show a formatted table with employee data, including employee IDs, first names, last names, job titles, departments, salaries, and the managers they report to.

### Add a department

This option allows you to add a new department to the database. You will be prompted to enter the name of the department, and it will be added to the database.

### Add a role

When selecting this option, you will be prompted to enter the name, salary, and department for the new role. Upon providing the required information, the role will be added to the database.

### Add an employee

Choosing this option will prompt you to enter the employee's first name, last name, role, and manager. After entering the necessary details, the employee will be added to the database.

### Update an employee role

Selecting this option will prompt you to select an employee from a list and provide their new role. Once you have made the selection, the employee's role will be updated in the database.

## Conclusion

This command-line application provides a convenient interface for managing departments, roles, and employees in a MySQL database. You can view existing data, add new records, and update employee roles easily. Feel free to explore the application and utilize its features to interact with your MySQL database efficiently.
