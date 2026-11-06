CREATE TABLE Campus (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100)
);

CREATE TABLE Building (
    id SERIAL PRIMARY KEY,
    campus_id INT NOT NULL REFERENCES Campus(id) ON DELETE CASCADE,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE Room (
    id SERIAL PRIMARY KEY,
    building_id INT NOT NULL REFERENCES Building(id) ON DELETE CASCADE,
    name VARCHAR(50) NOT NULL,
    capacity INT NOT NULL,
    has_projector BOOLEAN DEFAULT FALSE,
    has_whiteboard BOOLEAN DEFAULT FALSE
);

CREATE TABLE Student (
    id SERIAL PRIMARY KEY,
    campus_id INT NOT NULL REFERENCES Campus(id) ON DELETE CASCADE,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Admin (
    id SERIAL PRIMARY KEY,
    campus_id INT NOT NULL REFERENCES Campus(id) ON DELETE CASCADE,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL
);

CREATE TABLE Booking (
    id SERIAL PRIMARY KEY,
    room_id INT NOT NULL REFERENCES Room(id) ON DELETE CASCADE,
    student_id INT NOT NULL REFERENCES Student(id) ON DELETE CASCADE,
    start_time TIMESTAMP NOT NULL,
    end_time TIMESTAMP NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'confirmed',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);