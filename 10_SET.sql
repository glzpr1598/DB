-- 집합연산
-- [쿼리1] [UNION | UNION ALL | INTERSECT | MINUS] [쿼리2]

-- UNION(합집합, 중복 제거)
(SELECT dept_no FROM emp) UNION (SELECT dept_no FROM dept);

-- UNION ALL(합집합, 중복 무시)
(SELECT dept_no FROM emp) UNION ALL (SELECT dept_no FROM dept);

-- INTERSECT(교집합)
(SELECT dept_no FROM emp) INTERSECT (SELECT dept_no FROM dept);

-- MINUS(차집합)
(SELECT dept_no FROM emp) MINUS (SELECT dept_no FROM dept);
(SELECT dept_no FROM dept) MINUS (SELECT dept_no FROM emp);