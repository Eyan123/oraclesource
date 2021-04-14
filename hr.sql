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
 




