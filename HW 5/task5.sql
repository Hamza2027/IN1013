-- 1
SELECT rs.first_name, rs.surname, rb.bill_date, COUNT(rb.bill_no) AS bill_count
FROM restBill rb
JOIN restStaff rs ON rb.waiter_no = rs.staff_no
GROUP BY rs.first_name, rs.surname, rb.bill_date
HAVING COUNT(rb.bill_no) >= 2;

-- 2
SELECT rt.room_name, COUNT(rt.table_no) AS table_count
FROM restRest_table rt
WHERE rt.no_of_seats > 6
GROUP BY rt.room_name;

-- 3
SELECT rt.room_name, COUNT(rb.bill_no) AS total_bills
FROM restBill rb
JOIN restRest_table rt ON rb.table_no = rt.table_no
GROUP BY rt.room_name;

-- 4
SELECT hs.first_name, hs.surname, SUM(rb.bill_total) AS total_bill_amount
FROM restRoom_management rm
JOIN restStaff hs ON rm.headwaiter = hs.staff_no
JOIN restRest_table rt ON rm.room_name = rt.room_name
JOIN restBill rb ON rb.table_no = rt.table_no AND rb.bill_date = rm.room_date
GROUP BY hs.first_name, hs.surname
ORDER BY total_bill_amount DESC;

-- 5
SELECT cust_name
FROM restBill
GROUP BY cust_name
HAVING AVG(bill_total) > 400;

-- 6
SELECT rs.first_name, rs.surname, COUNT(rb.bill_no) AS bill_count
FROM restBill rb
JOIN restStaff rs ON rb.waiter_no = rs.staff_no
GROUP BY rs.first_name, rs.surname, rb.bill_date
HAVING COUNT(rb.bill_no) >= 3;
