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



