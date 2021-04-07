SELECT * FROM cd.facilities;

SELECT name,membercost FROM cd.facilities;

SELECT name FROM cd.facilities
WHERE membercost > 0;

SELECT facid, name, membercost, monthlymaintenance FROM cd.facilities
WHERE membercost < monthlymaintenance/50 
AND membercost > 0;

SELECT name FROM cd.facilities
WHERE name LIKE('%Tennis%');

SELECT * FROM cd.facilities
WHERE facid IN (1,5);

SELECT memid, firstname, surname, joindate FROM cd.members
WHERE joindate >= '2012-09-01';

SELECT distinct(surname) FROM cd.members
ORDER BY surname
LIMIT 10;

SELECT joindate FROM cd.members
ORDER BY joindate desc
LIMIT 1;

SELECT COUNT(*) FROM cd.facilities
WHERE guestcost >= 10;

SELECT facid,SUM(slots) FROM cd.bookings
WHERE starttime BETWEEN '2012-09-01' AND '2012-10-01'
GROUP BY facid
ORDER BY SUM(slots);

SELECT facid, SUM(slots) AS total_slots FROM cd.bookings
GROUP BY facid
HAVING SUM(slots) > 1000
ORDER BY facid;

SELECT cd.facilities.name AS facility, cd.bookings.starttime AS booking_time
FROM cd.facilities INNER JOIN cd.bookings
ON cd.facilities.facid = cd.bookings.facid
WHERE cd.facilities.name LIKE ('%Tennis Court%')
AND cd.bookings.starttime >= '2012-09-21'
AND cd.bookings.starttime <= '2012-09-22'
ORDER BY cd.bookings.starttime;

SELECT cd.bookings.starttime FROM cd.bookings
INNER JOIN cd.members
ON cd.bookings.memid = cd.members.memid
WHERE cd.members.firstname || ' ' || cd.members.surname = 'David Farrell'
ORDER BY cd.bookings.starttime;

-----

SELECT customer_id,SUM(amount)
FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) > 110;

SELECT COUNT(*) FROM film
WHERE title LIKE 'J%';

SELECT first_name,last_name FROM customer
WHERE first_name LIKE 'E%'
AND address_id <500
ORDER BY customer_id DESC
LIMIT 1;

-----

Create TABLE students(
	student_id SERIAL PRIMARY KEY, 
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL, 
	homeroom_number SMALLINT, 
	phone VARCHAR(15) UNIQUE NOT NULL,
	email VARCHAR(100) UNIQUE, 
	graduation_year INTEGER);
	
CREATE TABLE teachers(
	teacher_id SERIAL PRIMARY KEY, 
	first_name VARCHAR(50) NOT NULL, 
	last_name VARCHAR(50) NOT NULL,
	homeroom_number SMALLINT, 
	department VARCHAR(200) NOT NULL, 
	email VARCHAR(100) UNIQUE NOT NULL, 
	phone VARCHAR(15));
	
INSERT INTO students(first_name,last_name, homeroom_number, phone, graduation_year)
VALUES
('Mark', 'Watney', '5', '777-555-1234', '2035');

INSERT INTO teachers(first_name, last_name, homeroom_number, department, email, phone)
VALUES
('Jonas', 'Salk', '5', 'Biology', 'jsalk@school.org', '777-555-4321');

SELECT * FROM students;

SELECT * FROM teachers;