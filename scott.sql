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

--부서번호의 오름차순과 급여의 내림차순 정렬하기
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

-- where : 조건에 맞춰서 조회

select * from emp where deptno = 30;

select * from emp where empno = 7782;

select * from emp where deptno = 30 and job = 'SALESMAN';

select * from emp where deptno = 30 or job = 'CLERK';


-- 산술연산자 : * / + - 

-- 연봉이 36000인 사원 조회
select * from emp where sal*12 = 36000;

-- 비교연산자 : >, <, >=, <=

-- sal의 값이 3000이상인 사원 조회
select * from emp where sal >= 3000;

-- 급여가 2500이고, 직업이 analyst인 사원 조회
select * from emp where sal >= 2500 and job = 'ANALYST';

-- 사원 이름의 첫문자가 f와 같거나 뒤쪽인 것만 조회
select * from emp where ename >= 'F';

-- 직무가 MANAGER, SALESMAN, CLERK 인 사원 조회
select * from emp where job = 'MANAGER' or job = 'SALESMAN' or job = 'CLERK';

-- 등가 비교 연산자( =(동등), !=,<>,^=(동등하지 않음))

-- sal이 3000이 아닌 사원 정보를 출력
select * from emp where sal != 3000;

-- 논리 부정 연산자 : not

select * from emp where not sal=3000;

-- in : = 

select * from emp where job = 'MANAGER' or job = 'SALESMAN' or job = 'CLERK';
select * from emp where job in('MANAGER', 'SALESMAN', 'CLERK');

-- not in (코드가 짧아지고 직관적이다)
select * from emp where job!='MANAGER' and job!='SALESMAN' and job !='CLERK';
select * from emp where job not in('MANAGER', 'SALESMAN', 'CLERK');

-- 부서번호가 10,20 사원 조회
select * from emp where deptno in(10,20);

-- sal 2000이상 ~ 3000이하 
select * from emp where sal between 2000 and 3000;

-- sal 2000이상 3000이하가 아닌 사원 조회
select * from emp where sal not between 2000 and 3000;

