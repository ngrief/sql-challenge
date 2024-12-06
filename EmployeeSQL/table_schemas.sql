-- Create the titles table
CREATE TABLE titles (
    title_id VARCHAR(10) NOT NULL PRIMARY KEY,
    title VARCHAR(100) NOT NULL
);

-- Create the departments table
CREATE TABLE departments (
    dept_no CHAR(4) NOT NULL PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

-- Create the employees table
CREATE TABLE employees (
    emp_no INT NOT NULL PRIMARY KEY,               -- Employee number
    emp_title_id VARCHAR(10),                      -- Foreign key for title
    birth_date DATE NOT NULL,                      -- Employee's birth date
    first_name VARCHAR(50) NOT NULL,               -- Employee's first name
    last_name VARCHAR(50) NOT NULL,                -- Employee's last name
    sex CHAR(1) NOT NULL,                          -- Gender
    hire_date DATE NOT NULL,                       -- Hire date
    CONSTRAINT fk_emp_title_id FOREIGN KEY (emp_title_id) REFERENCES titles (title_id)
);

-- Create the salaries table
CREATE TABLE salaries (
    emp_no INT NOT NULL,                           -- Foreign key for employee number
    salary INT NOT NULL,                           -- Salary amount
    PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

-- Create the dept_emp table
CREATE TABLE dept_emp (
    emp_no INT NOT NULL,                           -- Foreign key for employee number
    dept_no CHAR(4) NOT NULL,                      -- Foreign key for department number
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

-- Create the dept_manager table
CREATE TABLE dept_manager (
    dept_no CHAR(4) NOT NULL,                      -- Foreign key for department number
    emp_no INT NOT NULL,                           -- Foreign key for employee number
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);
