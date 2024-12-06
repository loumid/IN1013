-- 1

CREATE VIEW samsBills
AS SELECT first_name, surname, bill_date, cust_name, bill_total
FROM restStaff S
INNER JOIN restBill B
ON S.staff_no = B.waiter_no
WHERE first_name = "Sam"
AND surname = "Pitt";

-- 2

SELECT * FROM samsBills
WHERE bill_total > 400;

-- 3

CREATE VIEW roomTotals
AS SELECT room_name,
SUM(bill_total) AS total_sum
FROM restRest_table T
INNER JOIN restBill B
ON T.table_no = B.table_no
GROUP BY room_name;

-- 4

CREATE VIEW teamTotals
AS SELECT CONCAT(S2.first_name, ' ', S2.surname) AS headwaiter_name,
SUM(bill_total) AS total_sum
FROM restStaff S1
INNER JOIN restStaff S2
ON S1.headwaiter = S2.staff_no
INNER JOIN restBill B
ON S1.staff_no = B.waiter_no
GROUP BY headwaiter_name;