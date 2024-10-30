CREATE TABLE User (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(100),
    role ENUM('student', 'instructor', 'admin'),
    registration_date DATE
);

-- Insert Users
INSERT INTO User (name, email, password, role, registration_date) VALUES
('Hasan Ali', 'hasan@gmail.com', 'password123', 'student', '2024-01-15'),
('Mehedi Hasan', 'mehedi@gmail.com', 'password456', 'instructor', '2023-05-20'),
('Sara Rahman', 'sara@gmail.com', 'password789', 'admin', '2022-12-25'),
('Jannat Ferdous', 'jannat@gmail.com', 'password321', 'student', '2024-02-10'),
('Farzana Nahar', 'farzana@gmail.com', 'password654', 'instructor', '2023-07-15'),
('Mahmudul Hasan', 'mahmudul@gmail.com', 'password987', 'student', '2024-03-01'),
('Nafisa Khan', 'nafisa@gmail.com', 'passwordabc', 'instructor', '2023-08-05'),
('Tariq Islam', 'tariq@gmail.com', 'passworddef', 'student', '2024-04-01'),
('Shafiqur Rahman', 'shafiq@gmail.com', 'passwordghi', 'admin', '2022-10-20'),
('Riaz Ahmed', 'riaz@gmail.com', 'passwordjkl', 'student', '2024-05-12');


CREATE TABLE Course (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    description TEXT,
    instructor_id INT,
    price DECIMAL(10, 2),
    start_date DATE,
    FOREIGN KEY (instructor_id) REFERENCES User(user_id)
);

-- Insert Courses
INSERT INTO Course (title, description, instructor_id, price, start_date) VALUES
('Data Science 101', 'Introductory course on Data Science.', 2, 5000.00, '2024-01-10'),
('Machine Learning', 'Learn machine learning techniques.', 2, 8000.00, '2024-02-15'),
('Python Programming', 'Basics of Python for beginners.', 5, 4000.00, '2024-03-20'),
('Web Development', 'Complete guide to web development.', 7, 6000.00, '2024-04-01'),
('Digital Marketing', 'Learn strategies for online marketing.', 5, 5500.00, '2024-05-25');



CREATE TABLE Enrollment (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    course_id INT,
    progress INT,
    enrollment_date DATE,
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

-- Insert Enrollments
INSERT INTO Enrollment (user_id, course_id, progress, enrollment_date) VALUES
(1, 1, 50, '2024-01-20'),
(1, 2, 30, '2024-02-01'),
(4, 3, 70, '2024-03-05'),
(6, 4, 90, '2024-04-10'),
(8, 5, 20, '2024-05-15');


CREATE TABLE Payment (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    course_id INT,
    amount DECIMAL(10, 2),
    payment_date DATE,
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

-- Insert Payments
INSERT INTO Payment (user_id, course_id, amount, payment_date) VALUES
(1, 1, 5000.00, '2024-01-22'),
(1, 2, 8000.00, '2024-02-02'),
(4, 3, 4000.00, '2024-03-06'),
(6, 4, 6000.00, '2024-04-12'),
(8, 5, 5500.00, '2024-05-16');
CREATE TABLE Quiz (
    quiz_id INT PRIMARY KEY AUTO_INCREMENT,
    course_id INT,
    title VARCHAR(100),
    total_marks INT,
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

-- Insert Quizzes
INSERT INTO Quiz (course_id, title, total_marks) VALUES
(1, 'Data Science Basics Quiz', 100),
(2, 'Machine Learning Quiz', 100),
(3, 'Python Fundamentals', 50),
(4, 'Web Development Quiz', 75),
(5, 'Digital Marketing Quiz', 50);
CREATE TABLE Assignment (
    assignment_id INT PRIMARY KEY AUTO_INCREMENT,
    course_id INT,
    title VARCHAR(100),
    due_date DATE,
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

-- Insert Assignments
INSERT INTO Assignment (course_id, title, due_date) VALUES
(1, 'Data Analysis Project', '2024-02-15'),
(2, 'ML Model Development', '2024-03-10'),
(3, 'Python Project', '2024-04-01'),
(4, 'Build a Portfolio Website', '2024-05-05'),
(5, 'Marketing Plan Assignment', '2024-06-01');
CREATE TABLE Discussion (
    discussion_id INT PRIMARY KEY AUTO_INCREMENT,
    course_id INT,
    user_id INT,
    message TEXT,
    post_date DATE,
    FOREIGN KEY (course_id) REFERENCES Course(course_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Insert Discussions
INSERT INTO Discussion (course_id, user_id, message, post_date) VALUES
(1, 1, 'Loving the course so far!', '2024-01-25'),
(2, 1, 'Struggling with the algorithms.', '2024-02-05'),
(3, 4, 'Python is so versatile!', '2024-03-07'),
(4, 6, 'How do I deploy a website?', '2024-04-15'),
(5, 8, 'What tools are best for marketing?', '2024-05-18');









