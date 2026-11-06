-- V5: Seed Demo Data

-- 1. Insert Campuses
INSERT INTO Campus (name, location) VALUES 
('Main Campus', 'Nairobi'),
('Town Campus', 'Mombasa');

-- 2. Insert Buildings
INSERT INTO Building (campus_id, name) VALUES 
(1, 'Main Library'),
(1, 'Science Block'),
(2, 'Coastal Library');

-- 3. Insert Rooms
INSERT INTO Room (building_id, name, capacity, has_projector, has_whiteboard) VALUES 
(1, 'Room 101', 4, TRUE, TRUE),
(1, 'Room 102', 2, FALSE, TRUE),
(2, 'Lab 201', 8, TRUE, FALSE),
(3, 'Sea View Room', 6, TRUE, TRUE);

-- 4. Insert Students (Passwords are just dummy hashes for now)
INSERT INTO Student (campus_id, name, email, password_hash) VALUES 
(1, 'Alice Wanjiku', 'alice@student.edu', 'hashed_password_1'),
(1, 'Brian Ochieng', 'brian@student.edu', 'hashed_password_2'),
(2, 'Charlie Mwangi', 'charlie@student.edu', 'hashed_password_3');

-- 5. Insert Admins
INSERT INTO Admin (campus_id, name, email, password_hash) VALUES 
(1, 'Admin Sarah', 'sarah@admin.edu', 'hashed_admin_1'),
(2, 'Admin John', 'john@admin.edu', 'hashed_admin_2');

-- 6. Insert Bookings
INSERT INTO Booking (room_id, student_id, start_time, end_time, status) VALUES 
(1, 1, '2026-11-06 10:00:00', '2026-11-06 12:00:00', 'confirmed'),
(2, 2, '2026-11-06 14:00:00', '2026-11-06 16:00:00', 'confirmed'),
(3, 3, '2026-11-07 09:00:00', '2026-11-07 11:00:00', 'confirmed');