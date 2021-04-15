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

-- like 연산자와 와일드 카드

-- 사원이름이 S로 시작하는 사원 조회

select * from emp where ename like 'S%';

-- 사원 이름의 두번째 글자가 L인 사원 조회

select * from emp where ename like '_L%';

-- 사원 이름에 AM이 포함되어 있는 사원 조회

select * from emp where ename like '%AM%';

-- 사원 이름에 AM이 포함되어 있지 않은 사원 조회

select * from emp where ename not like '%AM%';

-- is null 

select * from emp where comm is null;

select * from emp where mgr is null;

select * from emp where not mgr is null;

select * from emp where mgr is not null;

-- 집합 연산자 : 합집합 - UNION(중복값 제거), UNION ALL, 차집합 - MINUS, 교집합 - INTERSECT

-- 10번부서와 20번 부서 조회

select * from emp where deptno = 10
union
select * from emp where deptno = 20;

select * from emp
minus
select * from emp where deptno = 10;

select * from emp
INTERSECT
select * from emp where deptno = 10;

-- 20번, 30번 부서에 근무하고 있는 사원중 급여가 2000 초과인 사원을 집합연산자 사용해서 조회

select * from emp 
intersect
select * from emp where sal > 2000;

-- 함수

-- 문자 함수 1) 대소문자
select ename, upper(ename), lower(ename), initcap(ename) from emp;

-- 문자 함수 2) 길이 
select length('한글'), LENGTHb('한글') from dual;

-- Ename 길이
select ename, length(ename) from emp;

-- Ename 길이가 5 이상인 사원 조회
select ename from emp where length(ename) >= 5;

-- 문자함수 3) 문자열 추출
select job, substr(job,1,2), substr(job,3,2), substr(job,5)
from emp;

-- 문자열 함수 4) 특정 문자 위치 찾기
select instr('HELLO, ORACLE!' ,'L') AS 첫번째, INSTR('HELLO, ORACLE!','L',5) AS 두번째,
INSTR('HELLO, ORACLE!', 'L',2,2)  AS 세번째 FROM DUAL;

-- 사원 이름에 S가 있는 사원 조회
select * from emp where instr(ename, 'S') >0;

-- 문자열 함수 5) 문자열 대체
select replace('이것이 Oracle이다', '이것이', 'this is') from dual;

-- 010-1234-5678, 010 1234 5678, 01012345678
select replace('010-1234-5678', '-', ' ') from dual
union
select replace('010-1234-5678', '-', '') from dual;

-- 문자열 함수 : 6) 문자열 연결
select empno || ename, empno || ':' || ename
from emp where ename='SMITH';

-- 문자열 함수 : 7) 특정 문자 제거 - TRIM, LTRIM, RTRIM
SELECT '          이것이       ' , trim ('   이것이     ') from dual;

select '[' || trim('  __oracle__ ') || ']' as trim,
'[' || ltrim('  __oracle__ ') || ']' as ltrim,
'[' || rtrim('  __oracle__ ') || ']' as rtrim
from dual;

-- 문자열 함수 : 8) 문자열 반대로 처리 

select reverse('ORACLE') from dual;

-- 숫자 함수 : 반올림 / 올림 / 버림 / 나머지 값 

select round(1234.5678) as round, round(1234.5678,0) as round0,
       round(1234.5678,1) as round1, round(1234.5678,2 ) as round2,
       round(1234.567,-1) as round_Minus1, round(1234.5678,-2) as round_minus2
       from dual;

-- 버림 

select trunc(1234.5678) as round, trunc(1234.5678,0) as round0,
       trunc(1234.5678,1) as round1, trunc(1234.5678,2 ) as round2,
       trunc(1234.567,-1) as round_Minus1, trunc(1234.5678,-2) as round_minus2
       from dual;
       
-- 지정한 숫자와 가장 가까운 정수를 찾는 ceil(큰정수), floor(작은 정수)
select ceil(3.14), floor(3.14), ceil(-3.14), floor(-3.14)
from dual;
       
-- 나머지
select mod(15,6), mod(10,2), mod(11,2)
from dual;

-- 날짜 함수 : SYSDATE(오라클 서버가 설치된 os 현재 날짜와 시간 
select sysdate from dual;

select sysdate as now, sysdate-1 as yesterday, sysdate+1 as tomorrow from dual;

-- 몇개월 이후의 날짜 구하기 : add_months
select sysdate, add_months(sysdate,3) from dual;

-- 입사 10주년이 되는 날짜 구하기
select empno, ename, hiredate,add_months(hiredate,120) from emp;

-- 현재 날짜를 기준으로 입사 45년 미만인 사원을 조회
select * from emp
where sysdate < add_months(hiredate,540);


