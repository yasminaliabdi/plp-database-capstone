-- V4: Row-Level Security

-- Enable RLS on the Student table
ALTER TABLE Student ENABLE ROW LEVEL SECURITY;

-- Create a policy so students can only see other students in their own campus
CREATE POLICY student_campus_isolation ON Student
    FOR ALL
    USING (campus_id = current_setting('app.current_campus_id')::int);

-- Enable RLS on the Room table
ALTER TABLE Room ENABLE ROW LEVEL SECURITY;

-- Create a policy so rooms are only visible if they belong to the user's campus
CREATE POLICY room_campus_isolation ON Room
    FOR ALL
    USING (
        building_id IN (
            SELECT id FROM Building WHERE campus_id = current_setting('app.current_campus_id')::int
        )
    );

-- Create the application roles (safe if they already exist)
DO $$ 
BEGIN
    CREATE ROLE app_read;
EXCEPTION WHEN duplicate_object THEN null;
END $$;

DO $$ 
BEGIN
    CREATE ROLE app_write;
EXCEPTION WHEN duplicate_object THEN null;
END $$;