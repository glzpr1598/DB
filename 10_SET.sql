-- ���տ���
-- [����1] [UNION | UNION ALL | INTERSECT | MINUS] [����2]

-- UNION(������, �ߺ� ����)
(SELECT dept_no FROM emp) UNION (SELECT dept_no FROM dept);

-- UNION ALL(������, �ߺ� ����)
(SELECT dept_no FROM emp) UNION ALL (SELECT dept_no FROM dept);

-- INTERSECT(������)
(SELECT dept_no FROM emp) INTERSECT (SELECT dept_no FROM dept);

-- MINUS(������)
(SELECT dept_no FROM emp) MINUS (SELECT dept_no FROM dept);
(SELECT dept_no FROM dept) MINUS (SELECT dept_no FROM emp);