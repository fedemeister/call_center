CREATE TABLE departments(
   id   VARCHAR(12) NOT NULL PRIMARY KEY
  ,name VARCHAR(18) NOT NULL
);
INSERT INTO departments(dept_id,dept_name) VALUES ('DEPT_SALES','Sales');
INSERT INTO departments(dept_id,dept_name) VALUES ('DEPT_MAIN','Maintenance');
INSERT INTO departments(dept_id,dept_name) VALUES ('DEPT_SUPPORT','Support');
INSERT INTO departments(dept_id,dept_name) VALUES ('DEPT_CANCEL','Anti-Cancellation');
