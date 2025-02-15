# Tour Application Management System
The **Tour Application Management System** is a database-driven system designed to manage tours, bookings, payments, and customer interactions. It provides an efficient way to handle operations in the tourism industry, allowing for streamlined scheduling, secure payment processing, and better customer experiences.

---

## Features
### Core Functionalities
- **Employee Management**: Maintain employee details such as ID, name, address, designation, and mobile number.
- **Customer Management**: Store and manage customer information including contact details and associated employees.
- **Tour Management**: Create and manage tours with attributes like description, location, cost, and available slots.
- **Booking Management**: Manage booking details, including the associated customer, tour, and booking status.
- **Payment Processing**: Track payments made by customers with information on payment date and amount.
- **Feedback Handling**: Collect feedback from customers on their experiences, including ratings and comments.
- **Reporting**: Retrieve data such as employee details, tour information, and feedback ratings through SQL queries.
---
## Database Schema

*The database schema includes the following tables:*

- **Employee**: Stores employee details.
- **Customer**: Stores customer details.
- **Tour**: Manages tour information.
- **Booking**: Tracks customer bookings.
- **Payment**: Handles payment transactions.
- **Feedback**: Collects customer feedback.

### Key Relationships
- Each **employee** may serve multiple **customers**.
- Each **customer** may book multiple **tours**.
- Each **tour** can have multiple **bookings**.
- Each **booking** is associated with one **payment**.
- Each **payment** may receive **feedback** from customers.

---

## SQL Files

- **`ddl.sql`**: Defines the database schema with CREATE TABLE statements for all entities and relationships.
- **`dml.sql`**: Contains sample data insertion queries and SQL statements for data retrieval and manipulation.

---

## How to Use

### Prerequisites
- Ensure you have a working SQL environment (e.g., Oracle, MySQL, or PostgreSQL).

### Steps
1. **Setup the Database**:
   - Execute the `ddl.sql` file to create the required tables.
   - Execute the `dml.sql` file to populate the database with sample data.

2. **Run Queries**:
   - Use the SQL queries in `dml.sql` to retrieve and manipulate data.

---

## Example Queries

Here are some example queries from the system:

- Retrieve all tour details:
  ```sql
  SELECT * FROM Tour;
  ```

- Find customers who provided feedback with a rating of 8 or higher:
  ```sql
  SELECT C_ID, COMMENTS FROM Feedback WHERE RATING >= 8;
  ```

- Retrieve completed bookings from 2022 to 2023:
  ```sql
  SELECT B_ID, LOCATION FROM Booking WHERE EXTRACT(YEAR FROM B_DATE) BETWEEN 2022 AND 2023 AND STATUS = 'Completed';
  ```

---

## Limitations

- Currently relies on manual SQL execution for operations.
- No GUI for user interactions.
- Data is not persisted beyond the SQL environment.

---

## Future Enhancements

- Implement a web-based GUI for better user interaction.
- Add dynamic features for managing real-time bookings and payments.
- Introduce robust error handling for data integrity.

---

## Contribution

Contributions are welcome! Fork the repository, make your changes, and submit a pull request.

