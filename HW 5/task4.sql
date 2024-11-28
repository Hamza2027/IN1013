-- 1
SELECT DISTINCT rb.cust_name
FROM restBill rb
JOIN restRest_table rt ON rb.table_no = rt.table_no
JOIN restRoom_management rm ON rt.room_name = rm.room_name AND rb.bill_date = rm.room_date
JOIN restStaff rs ON rm.headwaiter = rs.staff_no
WHERE rs.first_name = 'Charles'
  AND rb.bill_total > 450.00;

-- 2
SELECT rs.first_name, rs.surname
FROM restRoom_management rm
JOIN restStaff rs ON rm.headwaiter = rs.staff_no
WHERE rm.room_date = 160111
  AND rm.room_name = (
    SELECT rt.room_name
    FROM restBill rb
    JOIN restRest_table rt ON rb.table_no = rt.table_no
    WHERE rb.cust_name = 'Nerida Smith' AND rb.bill_date = 160111
  );

-- 3
SELECT cust_name
FROM restBill
WHERE bill_total = (SELECT MIN(bill_total) FROM restBill);

-- 4
SELECT rs.first_name, rs.surname
FROM restStaff rs
WHERE rs.staff_no NOT IN (SELECT waiter_no FROM restBill);

-- 5
SELECT rb.cust_name, hs.first_name AS headwaiter_name, hs.surname AS headwaiter_surname, rt.room_name
FROM restBill rb
JOIN restRest_table rt ON rb.table_no = rt.table_no
JOIN restRoom_management rm ON rt.room_name = rm.room_name AND rb.bill_date = rm.room_date
JOIN restStaff hs ON rm.headwaiter = hs.staff_no
WHERE rb.bill_total = (SELECT MAX(bill_total) FROM restBill);
