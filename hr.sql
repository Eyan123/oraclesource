select * from employees;

select first_name, last_name, job_id from employees;

select last_name, department_id from employees where employee_id = 176;

select last_name, salary from employees where salary >= 12000;

-- salary가 5000에서 12000 범위 이외인 사람들의 last-anme 및 salary를 조회한다.
select last_name, salary from employees 
where 5000 > salary or 12000 < salary;

-- 20번 , 50번 부서에서 근무하는 모든 사원들의 last_name 및 부서번호를 알파벳 순으로 조회
select * from employees;

select last_name, department_id from employees 
where department_id in (20,50) order by first_name;

-- 커미션을 버는 모든 사원들의 last_name,salary,commission_pct를 조회
-- salary,commission_pct 내림차순으로 정렬
select last_name, salary, commission_pct from employees
where commission_pct > 0
order by salary desc, commission_pct desc;



-- salary가 2500,3500,7000이 아니며 직업이 sa_rep 혹은 st_clerk인 사원 조회
select * from employees 
where salary not in(2500,3500,7000) and job_id in('AS_REP', 'ST_CLERK'); 


-- 고용일자가 2008-02-20 ~ 2008-05-01 사이에 고용된 사원들의 last_name,employee_id, hire_date를 조회한후
-- 고용일자 내림차순으로 정렬(날짜 데이터는 ''사이에 넣어서 처리)
select last_name, employee_id, hire_date from employees 
where hire_date >= '2008-02-20' and hire_date <='2008-05-01' order by hire_date desc;


-- 2004년도에 고용된 사람들의 last_name, hire_date를 조회한 후 입사일 기준으로 오름차순 정렬
select last_name, hire_date from employees
where hire_date >= '2004-01-01' and hire_date <='2004-12-31' order by hire_date;
 




