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

-- like �����ڿ� ���ϵ� ī��

-- ����̸��� S�� �����ϴ� ��� ��ȸ

select * from emp where ename like 'S%';

-- ��� �̸��� �ι�° ���ڰ� L�� ��� ��ȸ

select * from emp where ename like '_L%';

-- ��� �̸��� AM�� ���ԵǾ� �ִ� ��� ��ȸ

select * from emp where ename like '%AM%';

-- ��� �̸��� AM�� ���ԵǾ� ���� ���� ��� ��ȸ

select * from emp where ename not like '%AM%';

-- is null 

select * from emp where comm is null;

select * from emp where mgr is null;

select * from emp where not mgr is null;

select * from emp where mgr is not null;

-- ���� ������ : ������ - UNION(�ߺ��� ����), UNION ALL, ������ - MINUS, ������ - INTERSECT

-- 10���μ��� 20�� �μ� ��ȸ

select * from emp where deptno = 10
union
select * from emp where deptno = 20;

select * from emp
minus
select * from emp where deptno = 10;

select * from emp
INTERSECT
select * from emp where deptno = 10;

-- 20��, 30�� �μ��� �ٹ��ϰ� �ִ� ����� �޿��� 2000 �ʰ��� ����� ���տ����� ����ؼ� ��ȸ

select * from emp 
intersect
select * from emp where sal > 2000;

-- �Լ�

-- ���� �Լ� 1) ��ҹ���
select ename, upper(ename), lower(ename), initcap(ename) from emp;

-- ���� �Լ� 2) ���� 
select length('�ѱ�'), LENGTHb('�ѱ�') from dual;

-- Ename ����
select ename, length(ename) from emp;

-- Ename ���̰� 5 �̻��� ��� ��ȸ
select ename from emp where length(ename) >= 5;

-- �����Լ� 3) ���ڿ� ����
select job, substr(job,1,2), substr(job,3,2), substr(job,5)
from emp;

-- ���ڿ� �Լ� 4) Ư�� ���� ��ġ ã��
select instr('HELLO, ORACLE!' ,'L') AS ù��°, INSTR('HELLO, ORACLE!','L',5) AS �ι�°,
INSTR('HELLO, ORACLE!', 'L',2,2)  AS ����° FROM DUAL;

-- ��� �̸��� S�� �ִ� ��� ��ȸ
select * from emp where instr(ename, 'S') >0;

-- ���ڿ� �Լ� 5) ���ڿ� ��ü
select replace('�̰��� Oracle�̴�', '�̰���', 'this is') from dual;

-- 010-1234-5678, 010 1234 5678, 01012345678
select replace('010-1234-5678', '-', ' ') from dual
union
select replace('010-1234-5678', '-', '') from dual;

-- ���ڿ� �Լ� : 6) ���ڿ� ����
select empno || ename, empno || ':' || ename
from emp where ename='SMITH';

-- ���ڿ� �Լ� : 7) Ư�� ���� ���� - TRIM, LTRIM, RTRIM
SELECT '          �̰���       ' , trim ('   �̰���     ') from dual;

select '[' || trim('  __oracle__ ') || ']' as trim,
'[' || ltrim('  __oracle__ ') || ']' as ltrim,
'[' || rtrim('  __oracle__ ') || ']' as rtrim
from dual;

-- ���ڿ� �Լ� : 8) ���ڿ� �ݴ�� ó�� 

select reverse('ORACLE') from dual;

-- ���� �Լ� : �ݿø� / �ø� / ���� / ������ �� 

select round(1234.5678) as round, round(1234.5678,0) as round0,
       round(1234.5678,1) as round1, round(1234.5678,2 ) as round2,
       round(1234.567,-1) as round_Minus1, round(1234.5678,-2) as round_minus2
       from dual;

-- ���� 

select trunc(1234.5678) as round, trunc(1234.5678,0) as round0,
       trunc(1234.5678,1) as round1, trunc(1234.5678,2 ) as round2,
       trunc(1234.567,-1) as round_Minus1, trunc(1234.5678,-2) as round_minus2
       from dual;
       
-- ������ ���ڿ� ���� ����� ������ ã�� ceil(ū����), floor(���� ����)
select ceil(3.14), floor(3.14), ceil(-3.14), floor(-3.14)
from dual;
       
-- ������
select mod(15,6), mod(10,2), mod(11,2)
from dual;

-- ��¥ �Լ� : SYSDATE(����Ŭ ������ ��ġ�� os ���� ��¥�� �ð� 
select sysdate from dual;

select sysdate as now, sysdate-1 as yesterday, sysdate+1 as tomorrow from dual;

-- ��� ������ ��¥ ���ϱ� : add_months
select sysdate, add_months(sysdate,3) from dual;

-- �Ի� 10�ֳ��� �Ǵ� ��¥ ���ϱ�
select empno, ename, hiredate,add_months(hiredate,120) from emp;

-- ���� ��¥�� �������� �Ի� 45�� �̸��� ����� ��ȸ
select * from emp
where sysdate < add_months(hiredate,540);


