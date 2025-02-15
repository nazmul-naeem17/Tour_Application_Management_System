-- Tour Application Management System

-- Insert Data into Employee Table
INSERT INTO Employee (E_ID, C_ID, E_NAME, ADDRESS, MOBILE, DESIGNATION)
VALUES ('E101', 'C001', 'Alice Brown', '123 Maple St', '1234567890', 'Manager');

INSERT INTO Employee (E_ID, C_ID, E_NAME, ADDRESS, MOBILE, DESIGNATION)
VALUES ('E102', 'C002', 'John Smith', '456 Oak St', '9876543210', 'Operator');

-- Insert Data into Customer Table
INSERT INTO Customer (C_ID, E_ID, C_NAME, GENDER, EMAIL, ADDRESS, MOBILE)
VALUES ('C001', 'E101', 'Charlie Adams', 'Male', 'charlie@example.com', '789 Pine St', '4561237890');

INSERT INTO Customer (C_ID, E_ID, C_NAME, GENDER, EMAIL, ADDRESS, MOBILE)
VALUES ('C002', 'E102', 'Diana Ross', 'Female', 'diana@example.com', '321 Cedar St', '7891234560');

-- Insert Data into Tour Table
INSERT INTO Tour (TOUR_ID, B_ID, DESCRIPTION, LOCATION, COST, AVAILABLE_SLOT)
VALUES ('T001', 'B001', 'Beach Tour', 'Miami', 1500.00, 30);

INSERT INTO Tour (TOUR_ID, B_ID, DESCRIPTION, LOCATION, COST, AVAILABLE_SLOT)
VALUES ('T002', 'B002', 'Mountain Adventure', 'Rockies', 2000.00, 20);

-- Insert Data into Booking Table
INSERT INTO Booking (B_ID, C_ID, TOUR_ID, B_DATE, STATUS, LOCATION)
VALUES ('B001', 'C001', 'T001', TO_DATE('2023-06-01', 'YYYY-MM-DD'), 'Confirmed', 'Miami');

INSERT INTO Booking (B_ID, C_ID, TOUR_ID, B_DATE, STATUS, LOCATION)
VALUES ('B002', 'C002', 'T002', TO_DATE('2023-07-15', 'YYYY-MM-DD'), 'Pending', 'Rockies');

-- Insert Data into Payment Table
INSERT INTO Payment (P_ID, B_ID, P_DATE, AMOUNT)
VALUES ('P001', 'B001', TO_DATE('2023-06-02', 'YYYY-MM-DD'), 1500.00);

INSERT INTO Payment (P_ID, B_ID, P_DATE, AMOUNT)
VALUES ('P002', 'B002', TO_DATE('2023-07-16', 'YYYY-MM-DD'), 2000.00);

-- Insert Data into Feedback Table
INSERT INTO Feedback (F_ID, P_ID, RATING, F_DATE, COMMENTS)
VALUES ('F001', 'P001', 9, TO_DATE('2023-06-03', 'YYYY-MM-DD'), 'Amazing trip!');

INSERT INTO Feedback (F_ID, P_ID, RATING, F_DATE, COMMENTS)
VALUES ('F002', 'P002', 8, TO_DATE('2023-07-17', 'YYYY-MM-DD'), 'Very good experience.');

-- Queries for retrieving data from tables
-- Search all Tour details
SELECT * FROM Tour;

-- Search for Tour details for 2 days
SELECT * FROM Tour WHERE Description LIKE '%2days%';

-- Retrieve "Operators" from the Employee table ordered by E_ID descending
SELECT * FROM Employee WHERE Designation = 'Operator' ORDER BY E_ID DESC;

-- Search the P_ID, Ratings, and Comments of Feedback with a rating >= 6
SELECT P_ID, Rating, Comments FROM Feedback WHERE Rating >= 6;

-- Retrieve "Locations" from the Tour table ordered by cost in ascending order between 5000 and 20000
SELECT Location, Cost FROM Tour WHERE Cost BETWEEN 5000 AND 20000 ORDER BY Cost ASC;

-- Search the B_ID and Locations of completed bookings from 2022 to 2023
SELECT B_ID, Location FROM Booking WHERE EXTRACT(YEAR FROM B_DATE) BETWEEN 2022 AND 2023 AND Status = 'Completed';

-- Search names and addresses of customers from the Customer table
SELECT C_ID, C_NAME, Address FROM Customer;

-- Search Locations with at least 20 available slots in descending order
SELECT Location, Available_slot FROM Tour WHERE Available_slot >= 20 ORDER BY Available_slot DESC;

-- Search Payment details for June 2023
SELECT P_ID, P_DATE, B_ID FROM Payment WHERE EXTRACT(MONTH FROM P_DATE) = 6 AND EXTRACT(YEAR FROM P_DATE) = 2023;

-- Find details of Managers and IT Officers from the Employee table
SELECT E_NAME, Address, Designation FROM Employee WHERE Designation IN ('Manager', 'IT officer');

-- Find the difference between MAX and MIN and average tour costs
SELECT MAX(Cost) - MIN(Cost) AS Cost_Difference, ROUND(AVG(Cost)) AS Average_Cost FROM Tour;
