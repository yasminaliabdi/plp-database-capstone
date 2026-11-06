# StudyRoom: Database Capstone Project

StudyRoom is a multi-campus platform where university students can find and book available study rooms in real-time.

## Project Structure
- `migrations/` - Flyway versioned schema (V1 to V5)
- `backup.sh` - Automated backup script using pg_dump
- `requirements_summary.txt` - Day 1 project requirements
- `nosql_notes.txt` - Day 3 Redis justification
- `optimization_evidence.txt` - Day 4 query optimization evidence
- `security_and_presentation.md` - Day 5 security checklist and walkthrough
- `screenshots/` - Visual proof of the database, migrations, Redis, and backups

## How to Run
1. Ensure PostgreSQL and Flyway are installed.
2. Create the database: `sudo -u postgres psql -c "CREATE DATABASE capstone;"`
3. Run migrations: `~/flyway-10.20.0/flyway -url=jdbc:postgresql://localhost/capstone -user=postgres -password=postgres -locations=filesystem:./migrations migrate`
4. Run the backup script: `./backup.sh`

## Architecture Summary
- **Relational DB (PostgreSQL):** Used for core data (Students, Rooms, Bookings).
- **Migrations (Flyway):** Versioned schema applied from scratch.
- **NoSQL (Redis):** Cached room availability to handle high traffic.
- **Optimization:** Proved the index on `student_id` reduced query time to ~3.4ms using Bitmap Index Scan.
- **Security:** Enforced Row-Level Security (RLS) and least-privilege roles (`app_read`, `app_write`).