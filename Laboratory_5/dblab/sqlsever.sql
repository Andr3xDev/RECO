CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL
);

CREATE TABLE Activities (
    activity_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT
);

CREATE TABLE Schedule (
    schedule_id INT PRIMARY KEY,
    user_id INT,
    activity_id INT,
    date DATE NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (activity_id) REFERENCES Activities(activity_id)
);


INSERT INTO Users (user_id, username, password) VALUES 
    (1, 'student1', 'hashed_password_1'),
    (2, 'student2', 'hashed_password_2');

INSERT INTO Activities (activity_id, name, description) VALUES 
    (1, 'Math Class', 'Calculus and algebra lessons'),
    (2, 'Gym', 'Workout session'),
    (3, 'Study', 'Self-study for exams');

INSERT INTO Schedule (schedule_id, user_id, activity_id, date, start_time, end_time) VALUES 
    (1, 1, 1, '2025-03-18', '10:00', '11:30'),
    (2, 1, 2, '2025-03-18', '15:00', '16:00'),
    (3, 2, 3, '2025-03-19', '09:00', '11:00');
