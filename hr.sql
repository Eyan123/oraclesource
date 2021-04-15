select * from employees;

select first_name, last_name, job_id from employees;

select last_name, department_id from employees where employee_id = 176;

select last_name, salary from employees where salary >= 12000;

-- salary�� 5000���� 12000 ���� �̿��� ������� last-anme �� salary�� ��ȸ�Ѵ�.
select last_name, salary from employees 
where 5000 > salary or 12000 < salary;

-- 20�� , 50�� �μ����� �ٹ��ϴ� ��� ������� last_name �� �μ���ȣ�� ���ĺ� ������ ��ȸ
select * from employees;

select last_name, department_id from employees 
where department_id in (20,50) order by first_name;

-- Ŀ�̼��� ���� ��� ������� last_name,salary,commission_pct�� ��ȸ
-- salary,commission_pct ������������ ����
select last_name, salary, commission_pct from employees
where commission_pct > 0
order by salary desc, commission_pct desc;



-- salary�� 2500,3500,7000�� �ƴϸ� ������ sa_rep Ȥ�� st_clerk�� ��� ��ȸ
select * from employees 
where salary not in(2500,3500,7000) and job_id in('AS_REP', 'ST_CLERK'); 


-- ������ڰ� 2008-02-20 ~ 2008-05-01 ���̿� ���� ������� last_name,employee_id, hire_date�� ��ȸ����
-- ������� ������������ ����(��¥ �����ʹ� ''���̿� �־ ó��)
select last_name, employee_id, hire_date from employees 
where hire_date >= '2008-02-20' and hire_date <='2008-05-01' order by hire_date desc;


-- 2004�⵵�� ���� ������� last_name, hire_date�� ��ȸ�� �� �Ի��� �������� �������� ����
select last_name, hire_date from employees
where hire_date >= '2004-01-01' and hire_date <='2004-12-31' order by hire_date;
 
-- 20��, 50�� �μ����� �ٹ��ϴ� ��� ������� LAST_NAME, SALARY�� ��ȸ
-- �޿��� 5000~12000 ������ ����� ��ȸ

select last_name, salary from employees 
where salary between 5000 and 12000;

-- ������ 5000~12000 ���� �̿��� ������� last_name, salary ��ȸ

select last_name, salary from employees
where salary not between 5000 and 12000;

-- ������ڰ� 2008-02-20 ~ 2008-05-01 ���̿� ���� ������� last_name,e,h
-- ��ȸ�� ������� ������������ ����(��¥�����ʹ� '' �־ ó��)

select last_name, employee_id, hire_date from employees
where hire_date between '2008-02-20' and '2008-05-01' order by hire_date desc;

-- 2004�⵵�� ���� ������� ln, hd ��ȸ�� �Ի��� �������� ��������

select last_name, hire_date from employees
where hire_date between '2004-01-01' and '2004-12-31' order by hire_date asc;

-- like 
-- 2004�⵵�� ���� ��� ������� last_name �� hire_date�� ��ȸ�Ͽ� �Ի��� �������� ��������

select * from employees;

select last_name, hire_date from employees
where hire_date like '04%' order by hire_date asc;

-- LAST_NAME�� u�� ���ԵǴ� ������� eid, lname ��ȸ
select employee_id , last_name from employees
where last_name like '%u%';

-- LAST_NAME�� �� ��° ���ڰ� a�� ������� LAST_NAME ��ȸ
select last_name from employees
where last_name like '___a%';

-- LAST_NAME�� a Ȥ�� e ���ڰ� �ִ� ������� LAST_NAME�� ��ȸ�Ͽ� LAST_NAME���� ��������
select last_name from employees
where last_name like '%a%' or last_name like 'e' order by last_name asc;

-- LAST_NAME�� a �� e ���ڰ� �ִ� ������� LAST_NAME�� ��ȸ�Ͽ� LAST_NAME���� ��������

select last_name from employees 
where last_name like '%a%e%' or last_name like '%e%a%' order by last_name desc;

-- IS NULL

-- �Ŵ����� ���� ������� LAST_NAME, JOB_ID ��ȸ
select last_name, job_id from employees
where manager_id is null;

-- ST_CLERK�� JOB_ID�� ���� ����� ���� �μ�ID ��ȸ, �� �μ���ȣ�� NULL�� ���� ����
select DISTINCT department_id from employees 
where job_id not in('ST_CLERK') and department_id is not null;

-- COMMISIION_PCT�� NULL�� �ƴ� ����� �߿��� COMMISSION = SALARY * CAMMISSION_PCT
-- �� ���Ͽ� EMPLOYEE_DI, FIRST_NAME, JOB_ID ���
select employee_id, first_name, job_id, 
salary * cammission_pct as 
from employees
where commission_pct is not null;

select * from employees;

-- ���� ������ : ������ - UNION, UNION ALL, ������ - MINUS, ������ - INTERSECT

-- 10���μ��� 20�� �μ� ��ȸ

select * from emp;

-- ���ڿ� �Լ�

-- FIRST_NAME�� Curtis�� ����� first_name, last_name, phone_number, job_id ��ȸ
-- ��, job_id ����� �ҹ��ڷ� ���
select first_name, last_name, phone_number, lower(job_id) from employees
where first_name = 'Curtis'; 

-- �μ���ȣ�� 60,70,80,90�� ������� employee_id, first_name, hire_date, job_id ��ȸ
-- �� job_id�� IT_PROG �� ����� ��� ���α׷��ӷ� �����ؼ� ���
select employee_id, first_name, hire_date, 
replace(job_id, 'IT_PROG', '���α׷���')
from employees
where department_id in(60,70,80,90);

-- job_id�� AD_PRES, PU_CLERK�� ������� EMPLOYEE_ID, FIRST_NAME, LAST_NAME,
-- DEPARTMENT_ID, JOB_ID ��ȸ, �� ������� FIRST_NAME�� LAST_NAME�� �����Ͽ� ���

select EMPLOYEE_ID, FIRST_NAME || ' ' || LAST_NAME,
DEPARTMENT_ID, JOB_ID
from employees
where job_id in('AD_PRES', 'PU_CLERK');




