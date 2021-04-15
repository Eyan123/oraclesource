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
 
-- 20번, 50번 부서에서 근무하는 모든 사원들의 LAST_NAME, SALARY를 조회
-- 급여는 5000~12000 사이의 사원만 조회

select last_name, salary from employees 
where salary between 5000 and 12000;

-- 연봉이 5000~12000 범위 이외의 사람들의 last_name, salary 조회

select last_name, salary from employees
where salary not between 5000 and 12000;

-- 고용일자가 2008-02-20 ~ 2008-05-01 사이에 고용된 사원들의 last_name,e,h
-- 조회후 고용일자 내림차순으로 정렬(날짜데이터는 '' 넣어서 처리)

select last_name, employee_id, hire_date from employees
where hire_date between '2008-02-20' and '2008-05-01' order by hire_date desc;

-- 2004년도에 고용된 사람들의 ln, hd 조회후 입사일 기준으로 오름차순

select last_name, hire_date from employees
where hire_date between '2004-01-01' and '2004-12-31' order by hire_date asc;

-- like 
-- 2004년도에 고용된 모든 사람들의 last_name 및 hire_date를 조회하여 입사일 기준으로 오름차순

select * from employees;

select last_name, hire_date from employees
where hire_date like '04%' order by hire_date asc;

-- LAST_NAME에 u가 포함되는 사원들의 eid, lname 조회
select employee_id , last_name from employees
where last_name like '%u%';

-- LAST_NAME에 네 번째 글자가 a인 사원들의 LAST_NAME 조회
select last_name from employees
where last_name like '___a%';

-- LAST_NAME에 a 혹은 e 글자가 있는 사원들의 LAST_NAME을 조회하여 LAST_NAME으로 오름차순
select last_name from employees
where last_name like '%a%' or last_name like 'e' order by last_name asc;

-- LAST_NAME에 a 와 e 글자가 있는 사원들의 LAST_NAME을 조회하여 LAST_NAME으로 내림차순

select last_name from employees 
where last_name like '%a%e%' or last_name like '%e%a%' order by last_name desc;

-- IS NULL

-- 매니저가 없는 사람들의 LAST_NAME, JOB_ID 조회
select last_name, job_id from employees
where manager_id is null;

-- ST_CLERK인 JOB_ID를 가진 사원이 없는 부서ID 조회, 단 부서번호가 NULL인 값은 제외
select DISTINCT department_id from employees 
where job_id not in('ST_CLERK') and department_id is not null;

-- COMMISIION_PCT가 NULL이 아닌 사원들 중에서 COMMISSION = SALARY * CAMMISSION_PCT
-- 를 구하여 EMPLOYEE_DI, FIRST_NAME, JOB_ID 출력
select employee_id, first_name, job_id, 
salary * cammission_pct as 
from employees
where commission_pct is not null;

select * from employees;

-- 집합 연산자 : 합집합 - UNION, UNION ALL, 차집합 - MINUS, 교집합 - INTERSECT

-- 10번부서와 20번 부서 조회

select * from emp;

-- 문자열 함수

-- FIRST_NAME이 Curtis인 사람의 first_name, last_name, phone_number, job_id 조회
-- 단, job_id 결과는 소문자로 출력
select first_name, last_name, phone_number, lower(job_id) from employees
where first_name = 'Curtis'; 

-- 부서번호가 60,70,80,90인 사원들의 employee_id, first_name, hire_date, job_id 조회
-- 단 job_id가 IT_PROG 인 사원의 경우 프로그래머로 변경해서 출력
select employee_id, first_name, hire_date, 
replace(job_id, 'IT_PROG', '프로그래머')
from employees
where department_id in(60,70,80,90);

-- job_id가 AD_PRES, PU_CLERK인 사원들의 EMPLOYEE_ID, FIRST_NAME, LAST_NAME,
-- DEPARTMENT_ID, JOB_ID 조회, 단 사원명은 FIRST_NAME과 LAST_NAME을 연결하여 출력

select EMPLOYEE_ID, FIRST_NAME || ' ' || LAST_NAME,
DEPARTMENT_ID, JOB_ID
from employees
where job_id in('AD_PRES', 'PU_CLERK');




