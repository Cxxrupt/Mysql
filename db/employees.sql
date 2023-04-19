USE employee_db;

INSERT INTO employees (first_name, last_name, role_id, manager_id)
VALUES
  ('John', 'Doe', 2, NULL),
  ('Jane', 'Smith', 1, 2),
  ('Mike', 'Johnson', 4, NULL),
  ('Bob', 'Williams', 3, 4),
  ('Alice', 'Brown', 6, NULL),
  ('Tom', 'Lee', 5, 6),
  ('Sarah', 'Davis', 8, NULL),
  ('David', 'Clark', 7, 8);
