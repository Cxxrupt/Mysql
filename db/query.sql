SELECT roles.id, roles.title, roles.salary, departments.name AS department_name
FROM roles
INNER JOIN departments ON roles.department_id = departments.id;

SELECT employees.id, employees.first_name, employees.last_name, roles.title AS role_title
FROM employees
INNER JOIN roles ON employees.role_id = roles.id;

SELECT employees.id, employees.first_name, employees.last_name, roles.title AS role_title, departments.name AS department_name
FROM employees
INNER JOIN roles ON employees.role_id = roles.id
INNER JOIN departments ON roles.department_id = departments.id;

SELECT employees.id, employees.first_name, employees.last_name, roles.title AS role_title, departments.name AS department_name, CONCAT(manager.first_name, ' ', manager.last_name) AS manager_name
FROM employees
INNER JOIN roles ON employees.role_id = roles.id
INNER JOIN departments ON roles.department_id = departments.id
LEFT JOIN employees manager ON employees.manager_id = manager.id;

SELECT employees.id, employees.first_name, employees.last_name, roles.title AS role_title, departments.name AS department_name, CONCAT(manager.first_name, ' ', manager.last_name) AS manager_name
FROM employees
INNER JOIN roles ON employees.role_id = roles.id
INNER JOIN departments ON roles.department_id = departments.id
LEFT JOIN employees manager ON employees.manager_id = manager.id
WHERE employees.manager_id IS NULL;

SELECT employees.id, employees.first_name, employees.last_name, roles.title AS role_title, departments.name AS department_name, CONCAT(manager.first_name, ' ', manager.last_name) AS manager_name
FROM employees
INNER JOIN roles ON employees.role_id = roles.id
INNER JOIN departments ON roles.department_id = departments.id
LEFT JOIN employees manager ON employees.manager_id = manager.id
WHERE employees.manager_id IS NOT NULL;

SELECT employees.id, employees.first_name, employees.last_name, roles.title AS role_title, departments.name AS department_name, CONCAT(manager.first_name, ' ', manager.last_name) AS manager_name
FROM employees
INNER JOIN roles ON employees.role_id = roles.id
INNER JOIN departments ON roles.department_id = departments.id
LEFT JOIN employees manager ON employees.manager_id = manager.id
WHERE departments.name = 'Sales';

SELECT employees.id, employees.first_name, employees.last_name, roles.title AS role_title, departments.name AS department_name, CONCAT(manager.first_name, ' ', manager.last_name) AS manager_name
FROM employees
INNER JOIN roles ON employees.role_id = roles.id
INNER JOIN departments ON roles.department_id = departments.id
LEFT JOIN employees manager ON employees.manager_id = manager.id
WHERE departments.name = 'Sales' AND employees.manager_id IS NOT NULL;

SELECT employees.id, employees.first_name, employees.last_name, roles.title AS role_title, departments.name AS department_name, CONCAT(manager.first_name, ' ', manager.last_name) AS manager_name
FROM employees
INNER JOIN roles ON employees.role_id = roles.id
INNER JOIN departments ON roles.department_id = departments.id
LEFT JOIN employees manager ON employees.manager_id = manager.id
WHERE departments.name = 'Sales' AND employees.manager_id IS NULL;

// Engineering
SELECT employees.id, employees.first_name, employees.last_name, roles.title AS role_title, departments.name AS department_name, CONCAT(manager.first_name, ' ', manager.last_name) AS manager_name
FROM employees
INNER JOIN roles ON employees.role_id = roles.id
INNER JOIN departments ON roles.department_id = departments.id
LEFT JOIN employees manager ON employees.manager_id = manager.id
WHERE departments.name = 'Engineering' AND employees.manager_id IS NOT NULL;

// Engineering
SELECT employees.id, employees.first_name, employees.last_name, roles.title AS role_title, departments.name AS department_name, CONCAT(manager.first_name, ' ', manager.last_name) AS manager_name
FROM employees
INNER JOIN roles ON employees.role_id = roles.id
INNER JOIN departments ON roles.department_id = departments.id
LEFT JOIN employees manager ON employees.manager_id = manager.id
WHERE departments.name = 'Engineering' AND employees.manager_id IS NULL;

// Finance
SELECT employees.id, employees.first_name, employees.last_name, roles.title AS role_title, departments.name AS department_name, CONCAT(manager.first_name, ' ', manager.last_name) AS manager_name
FROM employees
INNER JOIN roles ON employees.role_id = roles.id
INNER JOIN departments ON roles.department_id = departments.id
LEFT JOIN employees manager ON employees.manager_id = manager.id
WHERE departments.name = 'Finance' AND employees.manager_id IS NOT NULL;

// Finance
SELECT employees.id, employees.first_name, employees.last_name, roles.title AS role_title, departments.name AS department_name, CONCAT(manager.first_name, ' ', manager.last_name) AS manager_name
FROM employees
INNER JOIN roles ON employees.role_id = roles.id
INNER JOIN departments ON roles.department_id = departments.id
LEFT JOIN employees manager ON employees.manager_id = manager.id
WHERE departments.name = 'Finance' AND employees.manager_id IS NULL;

// Legal
SELECT employees.id, employees.first_name, employees.last_name, roles.title AS role_title, departments.name AS department_name, CONCAT(manager.first_name, ' ', manager.last_name) AS manager_name
FROM employees
INNER JOIN roles ON employees.role_id = roles.id
INNER JOIN departments ON roles.department_id = departments.id
LEFT JOIN employees manager ON employees.manager_id = manager.id
WHERE departments.name = 'Legal' AND employees.manager_id IS NOT NULL;

// Legal
SELECT employees.id, employees.first_name, employees.last_name, roles.title AS role_title, departments.name AS department_name, CONCAT(manager.first_name, ' ', manager.last_name) AS manager_name
FROM employees
INNER JOIN roles ON employees.role_id = roles.id
INNER JOIN departments ON roles.department_id = departments.id
LEFT JOIN employees manager ON employees.manager_id = manager.id
WHERE departments.name = 'Legal' AND employees.manager_id IS NULL;

