-- V2: Indexes for StudyRoom

-- Speeds up finding rooms by their building
CREATE INDEX idx_building_campus ON Building(campus_id);

-- Speeds up finding rooms inside a building
CREATE INDEX idx_room_building ON Room(building_id);

-- Speeds up finding bookings for a specific room and time
CREATE INDEX idx_booking_room_time ON Booking(room_id, start_time);

-- Speeds up finding all bookings made by a specific student
CREATE INDEX idx_booking_student ON Booking(student_id);

-- Speeds up finding a student by email (used during login)
CREATE INDEX idx_student_email ON Student(email);