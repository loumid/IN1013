-- 1

SELECT DISTINCT first_name, surname, bill_date, COUNT(bill_date)
FROM restStaff S
INNER JOIN restBill B
ON S.staff_no = B.waiter_no
GROUP BY first_name, surname, bill_date
HAVING COUNT(*) >= 2;

-- 2

SELECT room_name, COUNT(*)
FROM restRest_table
WHERE no_of_seats >= 6
GROUP BY room_name;

-- 3

SELECT room_name, COUNT(bill_date)
FROM restBill B
INNER JOIN restRoom_management M
ON B.bill_date = M.room_date
GROUP BY room_name;

-- 4

SELECT S2.first_name, S2.surname, SUM(bill_total)
FROM restBill B
INNER JOIN restStaff S1
ON S1.staff_no = B.waiter_no
INNER JOIN restStaff S2
ON S1.headwaiter = S2.staff_no
GROUP BY S2.first_name, S2.surname
ORDER BY SUM(bill_total) DESC;

-- 5

SELECT cust_name, AVG(bill_total)
FROM restBill
WHERE AVG(bill_total) > 400
GROUP BY cust_name;

-- 6

SELECT first_name, surname, COUNT(B1.bill_date)
FROM restStaff S
INNER JOIN restBill B1
ON S.staff_no = B1.waiter_no
INNER JOIN restBill B2
ON B2.bill_date = B1.bill_date
GROUP BY first_name, surname
HAVING COUNT(B1.bill_date) >=3;


