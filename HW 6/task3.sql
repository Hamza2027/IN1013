-- 1
SELECT DISTINCT restStaff.first_name, restStaff.surname
FROM restBill
JOIN restStaff ON restBill.waiter_no = restStaff.staff_no
WHERE restBill.cust_name = 'Tanya Singh';

-- 2
SELECT room_date
FROM restRoom_management
JOIN restStaff ON restRoom_management.headwaiter = restStaff.staff_no
WHERE restStaff.first_name = 'Charles' 
  AND room_name = 'Green'
  AND room_date BETWEEN 160201 AND 160229;

-- 3
SELECT restStaff.first_name, restStaff.surname
FROM restStaff
WHERE headwaiter = (SELECT headwaiter 
                    FROM restStaff 
                    WHERE first_name = 'Zoe' AND surname = 'Ball');

-- 4
SELECT restBill.cust_name, restBill.bill_total, restStaff.first_name AS waiter_name
FROM restBill
JOIN restStaff ON restBill.waiter_no = restStaff.staff_no
ORDER BY restBill.bill_total DESC;

-- 5
SELECT DISTINCT rs.first_name, rs.surname
FROM restStaff rs
JOIN restBill rb1 ON rb1.waiter_no = rs.staff_no
WHERE rb1.table_no IN (
    SELECT DISTINCT table_no
    FROM restBill
    WHERE bill_no IN (00014, 00017)
);

-- 6
SELECT DISTINCT rs.first_name, rs.surname
FROM restStaff rs
WHERE rs.headwaiter = (
    SELECT headwaiter 
    FROM restRoom_management
    WHERE room_name = 'Blue' AND room_date = 160312
)
OR rs.staff_no = (
    SELECT headwaiter
    FROM restRoom_management
    WHERE room_name = 'Blue' AND room_date = 160312
);
