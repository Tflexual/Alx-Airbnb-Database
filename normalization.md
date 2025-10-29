# Database Normalization – AirBnB System

## 📘 Overview

Normalization is the process of organizing data in a database to reduce redundancy and improve data integrity.  
The AirBnB database was normalized up to **Third Normal Form (3NF)** to ensure efficient data organization, consistency, and scalability.

---

## 🧩 Step 1: Unnormalized Form (UNF)

In the unnormalized state, all information may be stored in a single table such as:

| user_id | name | email | property_name | property_location | booking_date | payment_amount | review_comment |
|----------|-------|--------|----------------|------------------|---------------|----------------|----------------|
| U001 | odelola oluwatobi | oluwatobiodelola@gmail.com | sweet Apartment | Lagos | 2025-10-01 | 300 | Great stay! |

**Issues:**
- Repetition of user and property information for every booking.
- Difficult to update or delete without anomalies.
- Lacks clear separation between entities (User, Property, Booking, etc.).

---

## 🧮 Step 2: First Normal Form (1NF)

**Rules applied:**
- Eliminate repeating groups.
- Ensure each field contains only atomic (indivisible) values.
- Assign a primary key.

**Transformation:**
We separate the mixed data into distinct tables:  
- `User(user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)`
- `Property(property_id, host_id, name, description, location, price_per_night, created_at, updated_at)`
- `Booking(booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)`
- `Payment(payment_id, booking_id, amount, payment_date, payment_method)`
- `Review(review_id, property_id, user_id, rating, comment, created_at)`
- `Message(message_id, sender_id, recipient_id, message_body, sent_at)`

**Result:**  
All attributes now hold atomic values and each table has a primary key.

---

## 🧭 Step 3: Second Normal Form (2NF)

**Rules applied:**
- Must be in 1NF.
- Remove partial dependencies (non-key attributes must depend on the whole primary key).

**Check for composite keys:**  
In our schema, none of the primary keys are composite — each table has a single-column key (`UUID`).  

Therefore:
- Each non-key attribute depends fully on its table’s primary key.
- Foreign keys (e.g., `host_id`, `user_id`, `property_id`) correctly define relationships instead of duplicating data.

**Result:**  
No partial dependencies remain.  
Each table now represents a single concept.

---

## 🧠 Step 4: Third Normal Form (3NF)

**Rules applied:**
- Must be in 2NF.
- Remove transitive dependencies (no non-key attribute depends on another non-key attribute).

**Validation:**
- In `User`, only `user_id` determines other fields — no dependencies between non-key fields.  
- In `Property`, attributes depend solely on `property_id`.  
- In `Booking`, `total_price` depends only on booking details (not on unrelated fields).  
- Payment, Review, and Message tables are free of indirect dependencies.

**Result:**  
All tables are in 3NF — no transitive dependencies, no redundancy.

---

## 🧩 Final Normalized Tables (3NF)

| Table | Description |
|-------|--------------|
| **User** | Stores guest, host, and admin details |
| **Property** | Contains property listings posted by hosts |
| **Booking** | Links users to booked properties |
| **Payment** | Tracks payments for each booking |
| **Review** | Manages feedback and ratings for properties |
| **Message** | Handles communication between users |

---

## ✅ Advantages of Normalization

| Benefit | Description |
|----------|--------------|
| **Data Integrity** | Each piece of data is stored only once, reducing inconsistencies |
| **Improved Performance** | Smaller, focused tables make queries faster |
| **Ease of Maintenance** | Isolated entities simplify updates and deletions |
| **Scalability** | Easy to extend schema (e.g., add amenities, property types) |
| **Reduced Redundancy** | Prevents data duplication across entities |

---

## 🏁 Summary

By applying normalization up to **3NF**, the AirBnB database achieves:
- Clear separation of entities and responsibilities  
- Elimination of redundant data  
- Reliable data integrity through foreign keys  
- A scalable and maintainable structure ready for production

---

**Author:** *Tobi Odelola*  


