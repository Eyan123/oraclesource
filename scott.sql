-- �ߺ��� �� ���� : DISTINCT
select deptno from emp;
select DISTINCT deptno from emp;

-- ��Ī
select empno from emp;
select empno as �����ȣ from emp;
select empno �����ȣ from emp;
select empno "�����ȣ" from emp;

select ename, sal, sal*12+comm,comm from emp;
select ename, sal, sal*12+comm as ����,comm from emp;

-- ������ �ְ� �ʹٸ� ""�� ���ڿ� ǥ�ø� Ȯ���� ���ٰ�
select ename as ���, job as "�� å" from emp;

-- ���� : order by ���Ĵ�� �� �̸� ���� �ɼ�(asc, desc) 

-- ename, sal ��ȸ(sal ��������)
select ename, sal from emp order by sal desc;

select * from emp order by sal desc;

--empno, ename, job ��ȸ empno ��������
select empno, ename, job from emp order by empno;

--�μ���ȣ�� ���������� �޿��� �������� �����ϱ�
select * from emp order by deptno asc, sal desc;

select * from emp; 
    
select empno as EMPLOYEE_NO, 
       ename as EMPLOYEE_NAME,
       mgr as MANAGER,
       sal as SALARY,
       comm as COMMISSION,
       deptno as DEPARTMENT_NO
       from emp;
       
select * from emp order by deptno desc, ename asc;       

-- where : ���ǿ� ���缭 ��ȸ

select * from emp where deptno = 30;

select * from emp where empno = 7782;

select * from emp where deptno = 30 and job = 'SALESMAN';

select * from emp where deptno = 30 or job = 'CLERK';


-- ��������� : * / + - 

-- ������ 36000�� ��� ��ȸ
select * from emp where sal*12 = 36000;

-- �񱳿����� : >, <, >=, <=

-- sal�� ���� 3000�̻��� ��� ��ȸ
select * from emp where sal >= 3000;

-- �޿��� 2500�̰�, ������ analyst�� ��� ��ȸ
select * from emp where sal >= 2500 and job = 'ANALYST';

-- ��� �̸��� ù���ڰ� f�� ���ų� ������ �͸� ��ȸ
select * from emp where ename >= 'F';

-- ������ MANAGER, SALESMAN, CLERK �� ��� ��ȸ
select * from emp where job = 'MANAGER' or job = 'SALESMAN' or job = 'CLERK';

-- � �� ������( =(����), !=,<>,^=(�������� ����))

-- sal�� 3000�� �ƴ� ��� ������ ���
select * from emp where sal != 3000;

-- �� ���� ������ : not

select * from emp where not sal=3000;

-- in : = 

select * from emp where job = 'MANAGER' or job = 'SALESMAN' or job = 'CLERK';
select * from emp where job in('MANAGER', 'SALESMAN', 'CLERK');

-- not in (�ڵ尡 ª������ �������̴�)
select * from emp where job!='MANAGER' and job!='SALESMAN' and job !='CLERK';
select * from emp where job not in('MANAGER', 'SALESMAN', 'CLERK');

-- �μ���ȣ�� 10,20 ��� ��ȸ
select * from emp where deptno in(10,20);

-- sal 2000�̻� ~ 3000���� 
select * from emp where sal between 2000 and 3000;

-- sal 2000�̻� 3000���ϰ� �ƴ� ��� ��ȸ
select * from emp where sal not between 2000 and 3000;

