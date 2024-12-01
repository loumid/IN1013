-- 1

SELECT cust_name
FROM restBill
WHERE waiter_no IN
(SELECT DISTINCT staff_no
FROM restStaff
WHERE headwaiter IN
(SELECT staff_no
FROM restStaff
WHERE first_name = "Charles"))
AND bill_total > 450;

-- 2

SELECT first_name, surname
FROM restStaff
WHERE staff_no IN
(SELECT DISTINCT headwaiter
FROM restStaff
WHERE headwaiter IN
(SELECT DISTINCT headwaiter
FROM restRoom_management
WHERE room_date IN
(SELECT DISTINCT bill_date
FROM restBill
WHERE cust_name IN
(SELECT DISTINCT cust_name
from restBill
WHERE cust_name = "Nerida"
AND bill_date = 160111))));

-- 3

SELECT cust_name
FROM restBill
WHERE bill_total IN
(SELECT MIN(bill_total)
FROM restBill);

-- 4

SELECT first_name, surname
FROM restStaff
WHERE staff_no NOT IN 
(SELECT waiter_no
FROM restBill);

-- 5

SELECT DISTINCT cust_name, S2.first_name, S2.surname, room_name
FROM restStaff S1
INNER JOIN restStaff S2
ON S1.headwaiter = S2.staff_no
INNER JOIN restRoom_management M
ON M.headwaiter = S2.staff_no
INNER JOIN restBill B
ON B.waiter_no = S1.staff_no
WHERE bill_total IN
(SELECT MAX(bill_total)
FROM restBill);
