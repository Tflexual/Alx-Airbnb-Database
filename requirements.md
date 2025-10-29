# AirBnB Database Design

## 📘 Task 1: Database Specification and ERD

This document defines the database schema and entity relationships for the AirBnB system.  
The goal is to model core entities — **Users, Properties, Bookings, Payments, Reviews, and Messages** — and how they interact within the system.

---

## 🧩 Entities and Attributes

### 1. **User**
| Field | Type | Constraints |
|-------|------|--------------|
| user_id | UUID | Primary Key, Indexed |
| first_name | VARCHAR | NOT NULL |
| last_name | VARCHAR | NOT NULL |
| email | VARCHAR | UNIQUE, NOT NULL |
| password_hash | VARCHAR | NOT NULL |
| phone_number | VARCHAR | NULL |
| role | ENUM ('guest', 'host', 'admin') | NOT NULL |
| created_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP |

---

### 2. **Property**
| Field | Type | Constraints |
|-------|------|--------------|
| property_id | UUID | Primary Key, Indexed |
| host_id | UUID | Foreign Key → User(user_id) |
| name | VARCHAR | NOT NULL |
| description | TEXT | NOT NULL |
| location | VARCHAR | NOT NULL |
| price_per_night | DECIMAL | NOT NULL |
| created_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP |
| updated_at | TIMESTAMP | ON UPDATE CURRENT_TIMESTAMP |

---

### 3. **Booking**
| Field | Type | Constraints |
|-------|------|--------------|
| booking_id | UUID | Primary Key, Indexed |
| property_id | UUID | Foreign Key → Property(property_id) |
| user_id | UUID | Foreign Key → User(user_id) |
| start_date | DATE | NOT NULL |
| end_date | DATE | NOT NULL |
| total_price | DECIMAL | NOT NULL |
| status | ENUM ('pending', 'confirmed', 'canceled') | NOT NULL |
| created_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP |

---

### 4. **Payment**
| Field | Type | Constraints |
|-------|------|--------------|
| payment_id | UUID | Primary Key, Indexed |
| booking_id | UUID | Foreign Key → Booking(booking_id) |
| amount | DECIMAL | NOT NULL |
| payment_date | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP |
| payment_method | ENUM ('credit_card', 'paypal', 'stripe') | NOT NULL |

---

### 5. **Review**
| Field | Type | Constraints |
|-------|------|--------------|
| review_id | UUID | Primary Key, Indexed |
| property_id | UUID | Foreign Key → Property(property_id) |
| user_id | UUID | Foreign Key → User(user_id) |
| rating | INTEGER | CHECK (rating BETWEEN 1 AND 5), NOT NULL |
| comment | TEXT | NOT NULL |
| created_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP |

---

### 6. **Message**
| Field | Type | Constraints |
|-------|------|--------------|
| message_id | UUID | Primary Key, Indexed |
| sender_id | UUID | Foreign Key → User(user_id) |
| recipient_id | UUID | Foreign Key → User(user_id) |
| message_body | TEXT | NOT NULL |
| sent_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP |

---

## 🔐 Constraints Summary

- **User**
  - Unique email
  - Non-null required fields  
- **Property**
  - Foreign key: `host_id → User(user_id)`
- **Booking**
  - Foreign keys: `property_id → Property(property_id)`, `user_id → User(user_id)`
- **Payment**
  - Foreign key: `booking_id → Booking(booking_id)`
- **Review**
  - Foreign keys: `property_id → Property(property_id)`, `user_id → User(user_id)`
- **Message**
  - Foreign keys: `sender_id` and `recipient_id` → `User(user_id)`

---

## ⚙️ Indexing

| Table | Indexed Columns |
|--------|----------------|
| User | user_id, email |
| Property | property_id, host_id |
| Booking | booking_id, property_id, user_id |
| Payment | payment_id, booking_id |
| Review | review_id, property_id |
| Message | message_id, sender_id, recipient_id |

---


