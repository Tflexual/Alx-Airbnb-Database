# Partition Performance Report

## Objective
Optimize queries on the large `Booking` table by partitioning based on `start_date`.

## Steps Taken
1. Dropped and recreated the `Booking` table using RANGE partitioning on `start_date`.
2. Created partitions for years 2023, 2024, and 2025.
3. Tested queries using `EXPLAIN ANALYZE` before and after partitioning.

## Before Partitioning
- Full table scan for all queries.
- Query execution time: ~250ms (example).

## After Partitioning
- PostgreSQL automatically pruned irrelevant partitions.
- Query scanned only relevant partitions.
- Execution time: ~40ms (example).

## Observation
Partitioning drastically improved performance for date-range queries.
It also simplified data maintenance (e.g., easy to drop old partitions).
