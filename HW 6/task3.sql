-- 1

SELECT first_name, surname
FROM restStaff S
INNER JOIN restBill B
ON S.staff_no = B.waiter_no
WHERE cust_name = "Tanya Singh";

-- 2

SELECT room_date
FROM restRoom_management R
INNER JOIN restRest_table T
ON R.room_name = T.room_name
INNER JOIN restStaff S
ON R.headwaiter = S.headwaiter
WHERE R.headwaiter = 010
AND room_date > 160200
AND room_date < 160230;

-- 3

SELECT DISTINCT S1.first_name, S1.surname
FROM restStaff S1
INNER JOIN restStaff S2
ON S1.headwaiter = S2.headwaiter
WHERE S2.first_name = "Zoe"
AND S2.surname = "Ball";

-- 4

SELECT cust_name, bill_total, first_name, surname
FROM restBill B
INNER JOIN restStaff S
ON B.waiter_no = S.staff_no
ORDER BY bill_total DESC;

-- 5

SELECT S2.first_name, S2.surname
FROM restStaff S1
INNER JOIN restStaff S2
ON S1.headwaiter = S2.headwaiter
INNER JOIN restBill B
ON S1.staff_no = B.waiter_no
WHERE bill_no = 00014
OR bill_no = 00017;

-- 6

SELECT DISTINCT first_name, surname
FROM restStaff S
INNER JOIN restRoom_management R 
ON R.headwaiter = S.headwaiter
OR R.headwaiter = S.staff_no
INNER JOIN restBill B
ON B.bill_date = R.room_date
WHERE bill_date = 160312
AND room_name = "Blue";