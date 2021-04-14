-- 중복된 값 제거 : DISTINCT
select deptno from emp;
select DISTINCT deptno from emp;

-- 별칭
select empno from emp;
select empno as 사원번호 from emp;
select empno 사원번호 from emp;
select empno "사원번호" from emp;

select ename, sal, sal*12+comm,comm from emp;
select ename, sal, sal*12+comm as 연봉,comm from emp;

-- 공백을 넣고 싶다면 ""로 문자열 표시를 확실히 해줄것
select ename as 사원, job as "직 책" from emp;

-- 정렬 : order by 정렬대상 열 이름 정렬 옵션(asc, desc) 

-- ename, sal 조회(sal 내림차순)
select ename, sal from emp order by sal desc;

select * from emp order by sal desc;

--empno, ename, job 조회 empno 오름차순
select empno, ename, job from emp order by empno;



