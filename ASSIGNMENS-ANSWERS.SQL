1. Write a query to fetch employee whose last name is same.

mysql> SELECT * FROM employee
    -> WHERE lname IN (SELECT lname FROM employee
    -> GROUP BY lname
    -> HAVING COUNT(*)>1);
+-----+----------+--------+-----------+-------+------+
| eid | fname    | lname  | city      | esal  | age  |
+-----+----------+--------+-----------+-------+------+
| 101 | Rahul    | Gandhi | Wayanad   | 45000 |   52 |
| 102 | Sonia    | Gandhi | New Delhi | 55000 |   75 |
| 103 | Priyanka | Gandhi | Nodia     | 65000 |   45 |
| 110 | Sonam    | Kapoor | Mumbai    | 30000 |   27 |
| 111 | Anil     | Kapoor | Mumbai    | 38000 |   40 |
| 112 | Raj      | Kapoor | Mumbai    | 18000 |   78 |
| 113 | Vishnu   | Manchu | Hyderabad | 20000 |   40 |
| 114 | Manoj    | Manchu | Hyderabad | 12000 |   35 |
| 115 | Mohan    | Manchu | Hyderabad |  NULL |   70 |
+-----+----------+--------+-----------+-------+------+
9 rows in set (0.00 sec)

2. Write a query to fetch whose age is grater then 70.

 mysql> SELECT * FROM employee
    -> WHERE age>70;
+-----+-------+--------+-----------+-------+------+
| eid | fname | lname  | city      | esal  | age  |
+-----+-------+--------+-----------+-------+------+
| 102 | Sonia | Gandhi | New Delhi | 55000 |   75 |
| 112 | Raj   | Kapoor | Mumbai    | 18000 |   78 |
+-----+-------+--------+-----------+-------+------+
2 rows in set (0.00 sec)

3. Write a query to fetch employee with same city.

mysql> SELECT * FROM employee
    -> WHERE city IN (SELECT city FROM employee
    -> GROUP BY city
    -> HAVING COUNT(*)>1);
+-----+--------+-----------+-----------+-------+------+
| eid | fname  | lname     | city      | esal  | age  |
+-----+--------+-----------+-----------+-------+------+
| 102 | Sonia  | Gandhi    | New Delhi | 55000 |   75 |
| 104 | Modi   | Narendra  | New Delhi | 75000 |   69 |
| 105 | Rajni  | Kanth     | Chennai   | 85000 |   65 |
| 106 | Vijay  | Setupathi | Chennai   | 95000 |   47 |
| 107 | Nayana | Tara      | Chennai   | 25000 |   40 |
| 108 | Alia   | Bhut      | Mumbai    | 45000 |   31 |
| 110 | Sonam  | Kapoor    | Mumbai    | 30000 |   27 |
| 111 | Anil   | Kapoor    | Mumbai    | 38000 |   40 |
| 112 | Raj    | Kapoor    | Mumbai    | 18000 |   78 |
| 113 | Vishnu | Manchu    | Hyderabad | 20000 |   40 |
| 114 | Manoj  | Manchu    | Hyderabad | 12000 |   35 |
| 115 | Mohan  | Manchu    | Hyderabad |  NULL |   70 |
+-----+--------+-----------+-----------+-------+------+
12 rows in set (0.00 sec)

4. Write a query to fetch whose name ends with 'h'.

mysql> SELECT * FROM employee
    -> WHERE fname LIKE '%h';
+-----+--------+-------+--------+-------+------+
| eid | fname  | lname | city   | esal  | age  |
+-----+--------+-------+--------+-------+------+
| 109 | Mahesh | Bhut  | Mumbai | 15000 |   68 |
+-----+--------+-------+--------+-------+------+
1 row in set (0.00 sec)

5. Write a query to count employee whose last name ends with 'i'.

mysql> SELECT COUNT(*) AS lname_ends_I FROM employee
    -> WHERE lname LIKE '%i';
+--------------+
| lname_ends_I |
+--------------+
|            4 |
+--------------+
1 row in set (0.00 sec)

6. Write a query to find employee with highest salary.
 
mysql> SELECT * FROM employee
    -> WHERE esal=(SELECT MAX(esal) FROM employee);
+-----+-------+-----------+---------+-------+------+
| eid | fname | lname     | city    | esal  | age  |
+-----+-------+-----------+---------+-------+------+
| 106 | Vijay | Setupathi | Chennai | 95000 |   47 |
+-----+-------+-----------+---------+-------+------+
1 row in set (0.00 sec)

7. Write a query to find employee with lowest salary.

mysql> SELECT * FROM employee
    -> WHERE fname LIKE '%h';
+-----+--------+-------+--------+-------+------+
| eid | fname  | lname | city   | esal  | age  |
+-----+--------+-------+--------+-------+------+
| 109 | Mahesh | Bhut  | Mumbai | 15000 |   68 |
+-----+--------+-------+--------+-------+------+
1 row in set (0.00 sec)

8. Write a query to change last name of employee whose id is 102.
mysql> UPDATE employee
    -> SET lname='Singh'
    -> WHERE eid=102;
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0
+-----+-------+-------+-----------+-------+------+
| eid | fname | lname | city      | esal  | age  |
+-----+-------+-------+-----------+-------+------+
| 102 | Sonia | Singh | New Delhi | 55000 |   75 |
+-----+-------+-------+-----------+-------+------+

9. Write a query to find name of employee whose name start's with 'A' and city name starts with 'B'.

mysql> SELECT * FROM employee
    -> WHERE fname LIKE 'A%' AND city LIKE 'B%';
Empty set (0.00 sec)

10. Write a query to find employee with highest salary in 'New Delhi'.
 
mysql>  SELECT * FROM employee
    ->  WHERE city= 'New Delhi' AND esal=(SELECT MAX(esal) FROM employee WHERE city = 'New Delhi');
+-----+-------+----------+-----------+-------+------+
| eid | fname | lname    | city      | esal  | age  |
+-----+-------+----------+-----------+-------+------+
| 104 | Modi  | Narendra | New Delhi | 75000 |   69 |
+-----+-------+----------+-----------+-------+------+
1 row in set (0.00 sec)

11. Write a query to find employee who live in 'New Delhi' with age above 70.

mysql> SELECT * FROM employee
    ->  WHERE city='New Delhi' AND age>70;
+-----+-------+--------+-----------+-------+------+
| eid | fname | lname  | city      | esal  | age  |
+-----+-------+--------+-----------+-------+------+
| 102 | Sonia | Gandhi | New Delhi | 55000 |   75 |
+-----+-------+--------+-----------+-------+------+
1 row in set (0.00 sec)

12. Write a query to find employee with salary below 50000.

mysql> SELECT * FROM employee
    -> WHERE esal<50000;
+-----+--------+--------+-----------+-------+------+
| eid | fname  | lname  | city      | esal  | age  |
+-----+--------+--------+-----------+-------+------+
| 101 | Rahul  | Gandhi | Wayanad   | 45000 |   52 |
| 107 | Nayana | Tara   | Chennai   | 25000 |   40 |
| 108 | Alia   | Bhut   | Mumbai    | 45000 |   31 |
| 109 | Mahesh | Bhut   | Mumbai    | 15000 |   68 |
| 110 | Sonam  | Kapoor | Mumbai    | 30000 |   27 |
| 111 | Anil   | Kapoor | Mumbai    | 38000 |   40 |
| 112 | Raj    | Kapoor | Mumbai    | 18000 |   78 |
| 113 | Vishnu | Manchu | Hyderabad | 10000 |   40 |
| 114 | Manoj  | Manchu | Hyderabad | 12000 |   35 |
+-----+--------+--------+-----------+-------+------+
9 rows in set (0.00 sec)

13. Write a query to find name of employee with salary range between 20000 to 40000.

mysql> SELECT * FROM employee
    ->  WHERE esal>20000 AND esal<40000;
+-----+--------+--------+---------+-------+------+
| eid | fname  | lname  | city    | esal  | age  |
+-----+--------+--------+---------+-------+------+
| 107 | Nayana | Tara   | Chennai | 25000 |   40 |
| 110 | Sonam  | Kapoor | Mumbai  | 30000 |   27 |
| 111 | Anil   | Kapoor | Mumbai  | 38000 |   40 |
+-----+--------+--------+---------+-------+------+
3 rows in set (0.00 sec)

15. Write a query to find employee whose first name third character is 'j'.
 
mysql> SELECT * FROM employee
    -> WHERE fname LIKE '__j%';
+-----+-------+-----------+---------+-------+------+
| eid | fname | lname     | city    | esal  | age  |
+-----+-------+-----------+---------+-------+------+
| 105 | Rajni | Kanth     | Chennai | 85000 |   65 |
| 106 | Vijay | Setupathi | Chennai | 95000 |   47 |
| 112 | Raj   | Kapoor    | Mumbai  | 18000 |   78 |
+-----+-------+-----------+---------+-------+------+
3 rows in set (0.00 sec)

16. Write a query to find employee whose first name third character is 'j' and live in 'New Delhi'.

mysql> SELECT * FROM employee
    -> WHERE fname LIKE '__j%' AND city='New Delhi';
Empty set (0.00 sec)

17. Write a query to count employees whose first name third character is 'j'.

mysql> SELECT COUNT(*) AS fname_3rd_j FROM employee
    -> WHERE fname LIKE '__j%';
+-------------+
| fname_3rd_j |
+-------------+
|           3 |
+-------------+
1 row in set (0.00 sec)

18. Write a query to fetch employee with lowest salary and add 10000 to its salary.

mysql> SET @min_salary = (SELECT MIN(esal) FROM employee);
Query OK, 0 rows affected (0.04 sec)

mysql> UPDATE employee
    -> SET esal = esal + 10000
    -> WHERE esal = @min_salary;
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0
+-----+--------+--------+-----------+-------+------+
| eid | fname  | lname  | city      | esal  | age  |
+-----+--------+--------+-----------+-------+------+
| 113 | Vishnu | Manchu | Hyderabad | 20000 |   40 |
+-----+--------+--------+-----------+-------+------+

19. Write a query to Sort the table by ascending BY age.

mysql> SELECT * FROM employee
    -> ORDER BY age ASC;
+-----+----------+-----------+-----------+-------+------+
| eid | fname    | lname     | city      | esal  | age  |
+-----+----------+-----------+-----------+-------+------+
| 110 | Sonam    | Kapoor    | Mumbai    | 30000 |   27 |
| 108 | Alia     | Bhut      | Mumbai    | 45000 |   31 |
| 114 | Manoj    | Manchu    | Hyderabad | 12000 |   35 |
| 107 | Nayana   | Tara      | Chennai   | 25000 |   40 |
| 111 | Anil     | Kapoor    | Mumbai    | 38000 |   40 |
| 113 | Vishnu   | Manchu    | Hyderabad | 20000 |   40 |
| 103 | Priyanka | Gandhi    | Nodia     | 65000 |   45 |
| 106 | Vijay    | Setupathi | Chennai   | 95000 |   47 |
| 101 | Rahul    | Gandhi    | Wayanad   | 45000 |   52 |
| 105 | Rajni    | Kanth     | Chennai   | 85000 |   65 |
| 109 | Mahesh   | Bhut      | Mumbai    | 15000 |   68 |
| 104 | Modi     | Narendra  | New Delhi | 75000 |   69 |
| 115 | Mohan    | Manchu    | Hyderabad |  NULL |   70 |
| 102 | Sonia    | Gandhi    | New Delhi | 55000 |   75 |
| 112 | Raj      | Kapoor    | Mumbai    | 18000 |   78 |
+-----+----------+-----------+-----------+-------+------+
15 rows in set (0.01 sec)

20. Write a query to Sort the table by descending by age.

mysql> SELECT * FROM employee
    -> ORDER BY age DESC;
+-----+----------+-----------+-----------+-------+------+
| eid | fname    | lname     | city      | esal  | age  |
+-----+----------+-----------+-----------+-------+------+
| 112 | Raj      | Kapoor    | Mumbai    | 18000 |   78 |
| 102 | Sonia    | Gandhi    | New Delhi | 55000 |   75 |
| 115 | Mohan    | Manchu    | Hyderabad |  NULL |   70 |
| 104 | Modi     | Narendra  | New Delhi | 75000 |   69 |
| 109 | Mahesh   | Bhut      | Mumbai    | 15000 |   68 |
| 105 | Rajni    | Kanth     | Chennai   | 85000 |   65 |
| 101 | Rahul    | Gandhi    | Wayanad   | 45000 |   52 |
| 106 | Vijay    | Setupathi | Chennai   | 95000 |   47 |
| 103 | Priyanka | Gandhi    | Nodia     | 65000 |   45 |
| 107 | Nayana   | Tara      | Chennai   | 25000 |   40 |
| 111 | Anil     | Kapoor    | Mumbai    | 38000 |   40 |
| 113 | Vishnu   | Manchu    | Hyderabad | 20000 |   40 |
| 114 | Manoj    | Manchu    | Hyderabad | 12000 |   35 |
| 108 | Alia     | Bhut      | Mumbai    | 45000 |   31 |
| 110 | Sonam    | Kapoor    | Mumbai    | 30000 |   27 |
+-----+----------+-----------+-----------+-------+------+
15 rows in set (0.00 sec)

21. Write a query to show employee whose name's last third word is 'j' and salary is more then 30000. 
mysql>
mysql> SELECT * FROM employee
    -> WHERE lname LIKE '%J__' AND esal>30000;
Empty set (0.02 sec)

22. Write a query to show all employee who live in 'Bangalore' and 'Wayanad'.

mysql> SELECT * FROM employee
    -> WHERE city='Bangalore' OR city='Wayanad';
+-----+-------+--------+---------+-------+------+
| eid | fname | lname  | city    | esal  | age  |
+-----+-------+--------+---------+-------+------+
| 101 | Rahul | Gandhi | Wayanad | 45000 |   52 |
+-----+-------+--------+---------+-------+------+
1 row in set (0.00 sec)

23. Write a query to fetch employee with last name count is 3.

mysql> SELECT lname, COUNT(lname) AS name_count
    -> FROM employee
    -> GROUP BY lname
    -> HAVING COUNT(lname) = 3;
+--------+------------+
| lname  | name_count |
+--------+------------+
| Gandhi |          3 |
| Kapoor |          3 |
| Manchu |          3 |
+--------+------------+
3 rows in set (0.00 sec)

24. Write a query to group by employee with their age.

mysql> SELECT age, COUNT(*) AS employee_count
    -> FROM employee
    -> GROUP BY age;
+------+----------------+
| age  | employee_count |
+------+----------------+
|   52 |              1 |
|   75 |              1 |
|   45 |              1 |
|   69 |              1 |
|   65 |              1 |
|   47 |              1 |
|   40 |              3 |
|   31 |              1 |
|   68 |              1 |
|   27 |              1 |
|   78 |              1 |
|   35 |              1 |
|   70 |              1 |
+------+----------------+
13 rows in set (0.00 sec)

26. Write a query to find employee with null salary.

mysql> SELECT * FROM employee
    -> WHERE esal IS NULL ;
+-----+-------+--------+-----------+------+------+
| eid | fname | lname  | city      | esal | age  |
+-----+-------+--------+-----------+------+------+
| 115 | Mohan | Manchu | Hyderabad | NULL |   70 |
+-----+-------+--------+-----------+------+------+
1 row in set (0.00 sec)

27. Write a query to find employee whose cities are not null.

mysql>  SELECT * FROM employee
    ->  WHERE city IS NOT NULL ;
+-----+----------+-----------+-----------+-------+------+
| eid | fname    | lname     | city      | esal  | age  |
+-----+----------+-----------+-----------+-------+------+
| 101 | Rahul    | Gandhi    | Wayanad   | 45000 |   52 |
| 102 | Sonia    | Gandhi    | New Delhi | 55000 |   75 |
| 103 | Priyanka | Gandhi    | Nodia     | 65000 |   45 |
| 104 | Modi     | Narendra  | New Delhi | 75000 |   69 |
| 105 | Rajni    | Kanth     | Chennai   | 85000 |   65 |
| 106 | Vijay    | Setupathi | Chennai   | 95000 |   47 |
| 107 | Nayana   | Tara      | Chennai   | 25000 |   40 |
| 108 | Alia     | Bhut      | Mumbai    | 45000 |   31 |
| 109 | Mahesh   | Bhut      | Mumbai    | 15000 |   68 |
| 110 | Sonam    | Kapoor    | Mumbai    | 30000 |   27 |
| 111 | Anil     | Kapoor    | Mumbai    | 38000 |   40 |
| 112 | Raj      | Kapoor    | Mumbai    | 18000 |   78 |
| 113 | Vishnu   | Manchu    | Hyderabad | 20000 |   40 |
| 114 | Manoj    | Manchu    | Hyderabad | 12000 |   35 |
| 115 | Mohan    | Manchu    | Hyderabad |  NULL |   70 |
+-----+----------+-----------+-----------+-------+------+
15 rows in set (0.00 sec)

28. Write a query to delete data of employee whose id is 109.

mysql>  DELETE FROM employee
    ->  WHERE eid=109;
Query OK, 1 row affected (0.01 sec)
+-----+----------+-----------+-----------+-------+------+
| eid | fname    | lname     | city      | esal  | age  |
+-----+----------+-----------+-----------+-------+------+
| 101 | Rahul    | Gandhi    | Wayanad   | 45000 |   52 |
| 102 | Sonia    | Gandhi    | New Delhi | 55000 |   75 |
| 103 | Priyanka | Gandhi    | Nodia     | 65000 |   45 |
| 104 | Modi     | Narendra  | New Delhi | 75000 |   69 |
| 105 | Rajni    | Kanth     | Chennai   | 85000 |   65 |
| 106 | Vijay    | Setupathi | Chennai   | 95000 |   47 |
| 107 | Nayana   | Tara      | Chennai   | 25000 |   40 |
| 108 | Alia     | Bhut      | Mumbai    | 45000 |   31 |
| 110 | Sonam    | Kapoor    | Mumbai    | 30000 |   27 |
| 111 | Anil     | Kapoor    | Mumbai    | 38000 |   40 |
| 112 | Raj      | Kapoor    | Mumbai    | 18000 |   78 |
| 113 | Vishnu   | Manchu    | Hyderabad | 20000 |   40 |
| 114 | Manoj    | Manchu    | Hyderabad | 12000 |   35 |
| 115 | Mohan    | Manchu    | Hyderabad |  NULL |   70 |
+-----+----------+-----------+-----------+-------+------+
14 rows in set (0.00 sec)

29. Write a query to group by employee with their age and show first three rows of data.

mysql> SELECT age, COUNT(*) AS employee_count
    -> FROM employee
    -> GROUP BY age
    -> LIMIT 3;
+------+----------------+
| age  | employee_count |
+------+----------------+
|   52 |              1 |
|   75 |              1 |
|   45 |              1 |
+------+----------------+
3 rows in set (0.00 sec)

30. Write a query to group by employee of 'New Delhi' by their last name.

mysql> SELECT lname, COUNT(*) AS employee_count
    -> FROM employee
    -> WHERE city = 'New Delhi'
    -> GROUP BY lname;
+----------+----------------+
| lname    | employee_count |
+----------+----------------+
| Gandhi   |              1 |
| Narendra |              1 |
+----------+----------------+
2 rows in set (0.00 sec)