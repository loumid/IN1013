-- 1

SELECT DISTINCT first_name, surname, bill_date, COUNT(bill_date)
FROM restStaff S
INNER JOIN restBill B
ON S.staff_no = B.waiter_no
GROUP BY first_name, surname, bill_date
HAVING COUNT(*) >= 2;

-- 2

SELECT room_name

