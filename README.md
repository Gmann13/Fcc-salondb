
# Salon Shop Appointment Booking System

**Description:**  
This project is a command-line application for a salon appointment booking system. The app uses a shell script to interact with users, ask for their details, and schedule appointments in a PostgreSQL database. The application is designed to handle basic booking needs for a salon, offering services such as cutting, washing, and a complete service. The SQL script initializes the necessary database schema and tables for storing customer and appointment data.

---

## Features

- **Service Selection:** Users can choose between various salon services (Cutting, Washing, or Complete).
- **Customer Management:** The system checks for existing customers by phone number and prompts new users to enter their details.
- **Appointment Scheduling:** Users can select a time for their appointment, which is then saved in the PostgreSQL database.
- **Data Storage:** Customer and appointment data is stored in the PostgreSQL database for future reference.

---

## Installation

### Prerequisites

- **PostgreSQL:** Make sure you have PostgreSQL installed and running on your machine.
- **Shell:** This script requires a Unix-like shell environment to run.
  
1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-username/salon-shop.git
   ```

2. **Navigate to the project directory:**
   ```bash
   cd salon-shop
   ```

3. **Set up the PostgreSQL database:**

   - Connect to PostgreSQL and execute the SQL script to set up the necessary tables:
     ```bash
     psql -U postgres -f salon.sql
     ```

---

## Usage

1. **Run the Shell Script:**
   ```bash
   ./salon.sh
   ```

2. **Follow the prompts:**  
   The script will ask you to select a service, enter your phone number, name (if you’re a new customer), and choose an appointment time.

3. **Example Interaction:**
   - Choose a service (1 for cutting, 2 for washing, etc.).
   - Enter your phone number.
   - If you're a new customer, the system will ask for your name.
   - Enter your preferred appointment time.
   - The system will confirm your booking.

---

## Database Schema

- **Customers Table:** Stores customer information (ID, phone number, name).
- **Services Table:** Lists the available salon services (ID, name).
- **Appointments Table:** Stores the appointment data (appointment ID, customer ID, service ID, and time).

---

## Contributing

Contributions are welcome! If you'd like to improve this project:

1. **Fork the repository.**
2. **Create a new branch for your feature or fix:**
   ```bash
   git checkout -b feature-name
   ```
3. **Commit your changes:**
   ```bash
   git commit -m "Add new feature"
   ```
4. **Push to the branch:**
   ```bash
   git push origin feature-name
   ```
5. **Create a pull request.**

---
