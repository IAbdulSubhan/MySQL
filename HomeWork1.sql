
create database organization;
use organization;


create TABLE employees(
    emp_no INT PRIMARY KEY,
    birth_date DATE,
    first_name VARCHAR(14),
    last_name VARCHAR(16),
    sex ENUM('M','F'),
    hire_date DATE
);

create TABLE dept_manager(
    dept_no CHAR(4),
    emp_no INT,
    from_date DATE,
    to_date DATE,
    CONSTRAINT pk_dept_manager PRIMARY KEY (dept_no,emp_no),
    CONSTRAINT fk_dept_manager_employees FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);


create TABLE departments(
    dept_no CHAR(4) PRIMARY KEY,
    dept_name VARCHAR(40),
    CONSTRAINT fk_departments_dept_manager FOREIGN KEY (dept_no) REFERENCES dept_manager (dept_no)

);


create TABLE dept_emp(
    emp_no INT,
    dept_no CHAR(4),
    from_date DATE,
    to_date DATE,
    CONSTRAINT pk_dept_emp PRIMARY KEY (emp_no,dept_no),
    CONSTRAINT fk_dept_emp_departments FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    CONSTRAINT fk_dept_emp_employees FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);



create TABLE salaries(
    emp_no INT,
    salary INT,
    from_date DATE,
    to_date DATE,
    CONSTRAINT pk_salaries PRIMARY KEY (emp_no,from_date,to_date),
    CONSTRAINT fk_salaries_employees FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);