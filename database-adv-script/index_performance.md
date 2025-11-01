# 🧩 Database Index Optimization

## 🎯 Objective
Identify and create indexes to improve SQL query performance.

## 🧠 Understanding Indexes
Indexes speed up data retrieval by allowing the database to quickly locate rows 
without scanning the entire table.

---

## ⚙️ High-Usage Columns Identified
| Table       | Column(s) Used Frequently | Usage Context |
|--------------|---------------------------|----------------|
| `users`      | `id`                      | JOIN with `bookings` |
| `bookings`   | `user_id`, `property_id`, `created_at` | WHERE, JOIN, ORDER BY |
| `properties` | `id`                      | JOIN with `bookings` or `reviews` |
| `reviews`    | `property_id`             | WHERE, GROUP BY |

---

## 🧱 Indexes Created
See `database_index.sql` for all `CREATE INDEX` commands.

Examples:
```sql
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_reviews_property_id ON reviews(property_id);
