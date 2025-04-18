  CREATE TABLE UserR (
    user_id INT PRIMARY KEY IDENTITY(1,1),
    username VARCHAR(100) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    age VARCHAR(255) NOT NULL
);

CREATE TABLE Account (
    account_id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT,
    password_hash VARCHAR(255) NOT NULL,
    account_type VARCHAR(50),
    status VARCHAR(50),
    last_login_time DATETIME DEFAULT NULL,
    last_ip_address VARCHAR(45),
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (user_id) REFERENCES UserR(user_id)
);

CREATE TABLE AdminR (
    admin_id INT PRIMARY KEY IDENTITY(1,1),
    account_id INT,
    email VARCHAR(255) NOT NULL UNIQUE,
    age VARCHAR(255) NOT NULL,
    FOREIGN KEY (account_id) REFERENCES Account(account_id)
);

CREATE TABLE Folder (
    folder_id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT,
    admin_id INT,
    folder_name VARCHAR(100),
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (user_id) REFERENCES UserR(user_id),
    FOREIGN KEY (admin_id) REFERENCES AdminR(admin_id)
);

CREATE TABLE Message (
    message_id INT PRIMARY KEY IDENTITY(1,1),
    sender_id INT,
    receiver_id INT,
    folder_id INT,
    subject TEXT,
    body TEXT,
    sent_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (sender_id) REFERENCES UserR(user_id),
    FOREIGN KEY (receiver_id) REFERENCES UserR(user_id),
    FOREIGN KEY (folder_id) REFERENCES Folder(folder_id)
);

CREATE TABLE Settings (
    settings_id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT,
    admin_id INT,
    theme VARCHAR(50),
    notification_preference VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES UserR(user_id),
    FOREIGN KEY (admin_id) REFERENCES AdminR(admin_id)
);

CREATE TABLE Announcement (
    announcement_id INT PRIMARY KEY IDENTITY(1,1),
    admin_id INT,
    user_id INT,
    title VARCHAR(255),
    message TEXT,
    published_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (user_id) REFERENCES UserR(user_id),
    FOREIGN KEY (admin_id) REFERENCES AdminR(admin_id)
);

CREATE TABLE UserGroup (
    group_id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT,
    admin_id INT,
    group_name VARCHAR(100),
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (user_id) REFERENCES UserR(user_id),
    FOREIGN KEY (admin_id) REFERENCES AdminR(admin_id)
);

CREATE TABLE belongroup (
    group_id INT,
    user_id INT,
	PRIMARY KEY(group_id,user_id),
    FOREIGN KEY (user_id) REFERENCES UserR(user_id),
    FOREIGN KEY (group_id) REFERENCES UserGroup(group_id)
);
CREATE TABLE managegroup (
    group_id INT,
    admin_id INT,
    PRIMARY KEY(group_id, admin_id),
    FOREIGN KEY (admin_id) REFERENCES AdminR(admin_id),
    FOREIGN KEY (group_id) REFERENCES UserGroup(group_id)
);

INSERT INTO UserR (username, email, age) VALUES
('johndoe', 'johndoe@yahoo.com', '30'),
('janedoe', 'janedoe@gmail.com', '28'),
('smithj', 'smithj@outlook.com', '35'),
('mariah', 'mariah@yahoo.com', '24'),
('bob32', 'bob32@gmail.com', '40'),
('alicew', 'alicew@outlook.com', '29'),
('steven23', 'steven23@yahoo.com', '33'),
('nancyj', 'nancyj@gmail.com', '31'),
('peterp', 'peterp@outlook.com', '27'),
('rachelz', 'rachelz@yahoo.com', '26'),
('chris44', 'chris44@gmail.com', '38'),
('tinaf', 'tinaf@outlook.com', '29'),
('georgek', 'georgek@yahoo.com', '32'),
('amym', 'amym@gmail.com', '34'),
('johnsmith', 'johnsmith@outlook.com', '36'),
('ericar', 'ericar@yahoo.com', '25'),
('daveb', 'daveb@gmail.com', '37'),
('oliverj', 'oliverj@outlook.com', '28'),
('lucyk', 'lucyk@yahoo.com', '29'),
('emilyt', 'emilyt@gmail.com', '30');


INSERT INTO Account (user_id, password_hash, account_type, status, last_login_time, last_ip_address) VALUES
(1, 'hash123', 'user', 'active', '2024-12-01 12:00:00', '192.168.0.1'),
(2, 'hash456', 'user', 'inactive', '2024-12-02 13:00:00', '192.168.0.2'),
(3, 'hash789', 'admin', 'active', '2024-12-03 14:00:00', '192.168.0.3'),
(4, 'hash101', 'user', 'active', '2024-12-04 15:00:00', '192.168.0.4'),
(5, 'hash102', 'user', 'inactive', '2024-12-05 16:00:00', '192.168.0.5'),
(6, 'hash103', 'user', 'active', '2024-12-06 17:00:00', '192.168.0.6'),
(7, 'hash104', 'admin', 'active', '2024-12-07 18:00:00', '192.168.0.7'),
(8, 'hash105', 'user', 'active', '2024-12-08 19:00:00', '192.168.0.8'),
(9, 'hash106', 'user', 'inactive', '2024-12-09 20:00:00', '192.168.0.9'),
(10, 'hash107', 'user', 'active', '2024-12-10 21:00:00', '192.168.0.10'),
(11, 'hash108', 'user', 'inactive', '2024-12-11 22:00:00', '192.168.0.11'),
(12, 'hash109', 'user', 'active', '2024-12-12 23:00:00', '192.168.0.12'),
(13, 'hash110', 'user', 'inactive', '2024-12-13 10:00:00', '192.168.0.13'),
(14, 'hash111', 'admin', 'active', '2024-12-14 11:00:00', '192.168.0.14'),
(15, 'hash112', 'user', 'inactive', '2024-12-15 12:00:00', '192.168.0.15'),
(16, 'hash113', 'user', 'active', '2024-12-16 13:00:00', '192.168.0.16'),
(17, 'hash114', 'user', 'inactive', '2024-12-17 14:00:00', '192.168.0.17'),
(18, 'hash115', 'user', 'active', '2024-12-18 15:00:00', '192.168.0.18'),
(19, 'hash116', 'admin', 'active', '2024-12-19 16:00:00', '192.168.0.19'),
(20, 'hash117', 'user', 'inactive', '2024-12-20 17:00:00', '192.168.0.20');


INSERT INTO AdminR (account_id, email, age) VALUES
(1, 'admin1@domain.com', '35'),
(2, 'admin2@domain.com', '40'),
(3, 'admin3@domain.com', '30'),
(4, 'admin4@domain.com', '28'),
(5, 'admin5@domain.com', '45'),
(6, 'admin6@domain.com', '38'),
(7, 'admin7@domain.com', '33'),
(8, 'admin8@domain.com', '36'),
(9, 'admin9@domain.com', '41'),
(10, 'admin10@domain.com', '31'),
(11, 'admin11@domain.com', '38'),
(12, 'admin12@domain.com', '22'),
(13, 'admin13@domain.com', '33'),
(14, 'admin14@domain.com', '54'),
(15, 'admin15@domain.com', '45'),
(16, 'admin16@domain.com', '38'),
(17, 'admin17@domain.com', '39'),
(18, 'admin18@domain.com', '36'),
(19, 'admin19@domain.com', '41'),
(20, 'admin20@domain.com', '23');



INSERT INTO Folder (user_id, admin_id, folder_name) VALUES
(1, 1, 'SPAM'),
(2, 2, 'DRAFT'),
(3, 3, 'SENT'),
(4, 1, 'INBOX'),
(5, 2, 'INBOX'),
(6, 3, 'SENT'),
(7, 4, 'DRAFT'),
(8, 5, 'SPAM'),
(9, 6, 'SENT'),
(10, 7, 'DRAFT'),
(11, 8, 'INBOX'),
(12, 9, 'SENT'),
(13, 10, 'SENT'),
(14, 1, 'DRAFT'),
(15, 2, 'INBOX'),
(16, 3, 'SENT'),
(17, 4, 'DRAFT'),
(18, 5, 'SENT'),
(19, 6, 'INBOX'),
(20, 7, 'SENT');

INSERT INTO Message (sender_id, receiver_id, folder_id, subject, body) VALUES
(1, 2, 1, 'Meeting Reminder', 'Don’t forget our meeting tomorrow at 10 AM.'),
(3, 4, 2, 'Project Update', 'The project is progressing as planned.'),
(5, 6, 3, 'Invoice Attached', 'Please find the attached invoice.'),
(7, 8, 4, 'Event Invitation', 'You are invited to the annual gala.'),
(9, 10, 5, 'Feedback Request', 'Please provide feedback on the recent changes.'),
(11, 12, 6, 'System Downtime', 'The system will be down for maintenance tonight.'),
(13, 14, 7, 'New Policy', 'Please review the updated company policy.'),
(15, 16, 8, 'Performance Review', 'Your performance review is scheduled for next week.'),
(17, 18, 9, 'Holiday Announcement', 'The office will be closed for the holidays.'),
(19, 20, 10, 'Task Assignment', 'You have been assigned a new task.'),
(1, 3, 11, 'Weekly Report', 'Here is the weekly report for your review.'),
(2, 4, 12, 'System Upgrade', 'The system upgrade was successful.'),
(5, 7, 13, 'Team Meeting', 'The team meeting has been rescheduled.'),
(8, 10, 14, 'Happy Birthday', 'Wishing you a wonderful birthday!'),
(11, 13, 15, 'Training Session', 'The training session details are attached.'),
(14, 16, 16, 'Client Feedback', 'The client provided positive feedback.'),
(17, 19, 17, 'Budget Approval', 'The budget has been approved.'),
(6, 12, 18, 'Action Required', 'Please take action on the pending items.'),
(9, 18, 19, 'Meeting Minutes', 'Attached are the minutes from yesterday’s meeting.'),
(4, 20, 20, 'Vacation Request', 'I am requesting vacation leave from next week.');


INSERT INTO Settings (user_id, admin_id, theme, notification_preference) VALUES
(1, 1, 'dark', 'email'),
(2, 2, 'light', 'sms'),
(3, 3, 'dark', 'email'),
(4, 4, 'light', 'push'),
(5, 5, 'dark', 'email'),
(6, 6, 'light', 'sms'),
(7, 7, 'dark', 'push'),
(8, 8, 'light', 'email'),
(9, 9, 'dark', 'sms'),
(10, 10, 'light', 'push'),
(11, 1, 'dark', 'email'),
(12, 2, 'light', 'sms'),
(13, 3, 'dark', 'email'),
(14, 4, 'light', 'push'),
(15, 5, 'dark', 'email'),
(16, 6, 'light', 'sms'),
(17, 7, 'dark', 'push'),
(18, 8, 'light', 'email'),
(19, 9, 'dark', 'sms'),
(20, 10, 'light', 'push');

INSERT INTO Announcement (admin_id, user_id, title, message) VALUES
(1, 2, 'Office Closure', 'The office will be closed on Friday for maintenance.'),
(2, 3, 'New Policy Update', 'Please review the attached policy update.'),
(3, 4, 'Annual Gala', 'Join us for the annual gala next month.'),
(4, 5, 'System Downtime', 'The system will be unavailable this weekend.'),
(5, 6, 'Training Announcement', 'Mandatory training sessions start next week.'),
(6, 7, 'Client Visit', 'We have a client visit scheduled for tomorrow.'),
(7, 8, 'Performance Report', 'The quarterly performance report is ready.'),
(8, 9, 'Holiday Notice', 'The office will remain closed for the holidays.'),
(9, 10, 'Security Alert', 'A new security policy has been implemented.'),
(10, 11, 'Feedback Required', 'Please share your feedback on the latest features.'),
(1, 12, 'Staff Meeting', 'A mandatory staff meeting is scheduled for next week.'),
(2, 13, 'Website Update', 'The company website will be updated this weekend.'),
(3, 14, 'Health Check-up', 'A free health check-up camp will be organized.'),
(4, 15, 'Policy Reminder', 'Reminder to adhere to the updated office policies.'),
(5, 16, 'Server Maintenance', 'Server maintenance is scheduled for Saturday.'),
(6, 17, 'Team Outing', 'Join us for the annual team outing next month.'),
(7, 18, 'Appreciation', 'Thank you for your exceptional performance.'),
(8, 19, 'Safety Training', 'Mandatory safety training is scheduled for tomorrow.'),
(9, 20, 'Project Kickoff', 'The new project will commence next week.'),
(10, 1, 'Budget Review', 'Budget review meeting is scheduled for tomorrow.');

INSERT INTO UserGroup (user_id, admin_id, group_name) 
VALUES
(1, 1, 'Group A'),
(1, 2, 'Group B'),
(1, 3, 'Group C'),
(1, 4, 'Group D'),
(2, 1, 'Group E'),
(2, 2, 'Group F'),
(2, 3, 'Group G'),
(2, 4, 'Group H'),
(3, 1, 'Group I'),
(3, 2, 'Group J'),
(3, 3, 'Group K'),
(3, 4, 'Group L'),
(4, 1, 'Group M'),
(4, 2, 'Group N'),
(4, 3, 'Group O'),
(4, 4, 'Group P'),
(5, 1, 'Group Q'),
(5, 2, 'Group R'),
(5, 3, 'Group S'),
(5, 4, 'Group T');
SELECT * FROM UserR ORDER BY username;
SELECT * FROM Account ORDER BY last_login_time DESC;
SELECT * FROM AdminR ORDER BY age;
SELECT * FROM Folder ORDER BY folder_id;
SELECT * FROM Message ORDER BY message_id DESC;
SELECT * FROM Settings ORDER BY theme;
SELECT * FROM Announcement ORDER BY title;
SELECT * FROM UserGroup ORDER BY group_name;


SELECT * FROM UserR
WHERE email LIKE '%gmail.com%'
ORDER BY username;


SELECT * FROM Account
ORDER BY account_id DESC;


SELECT * FROM AdminR
ORDER BY age;


SELECT * FROM Folder
ORDER BY folder_name;


SELECT * FROM Message
ORDER BY sender_id DESC;


SELECT * FROM Settings
ORDER BY theme;


SELECT * FROM Announcement
ORDER BY title;



SELECT * FROM UserGroup
ORDER BY group_name;


SELECT * FROM UserR
WHERE username LIKE 'j%'
ORDER BY username;


SELECT * FROM Account
WHERE account_type LIKE 'user'
ORDER BY last_login_time DESC;


SELECT * FROM AdminR
WHERE email LIKE 'admin1%'
ORDER BY age;


SELECT * FROM Folder
WHERE folder_name LIKE 'SENT'
ORDER BY folder_name;


SELECT * FROM Message
WHERE subject LIKE '%Meeting%'
ORDER BY sent_at DESC;


SELECT * FROM Settings
WHERE theme LIKE 'd%'
ORDER BY theme;


SELECT * FROM Announcement
WHERE title LIKE '%Policy%'
ORDER BY published_at;




SELECT * FROM UserGroup
WHERE group_name LIKE '%Group A%'
ORDER BY group_name;


SELECT 
    UserR.user_id, 
    UserR.username, 
    Account.account_id, 
    Account.status 
FROM 
    UserR 
LEFT JOIN 
    Account 
ON 
    UserR.user_id = Account.user_id;
	SELECT 
    Folder.folder_id, 
    Folder.folder_name, 
    AdminR.admin_id, 
    AdminR.email 
FROM 
    Folder 
RIGHT JOIN 
    AdminR 
ON 
    Folder.admin_id = AdminR.admin_id;
	SELECT 
    Message.message_id, 
    Message.subject, 
    Folder.folder_name 
FROM 
    Message 
FULL OUTER JOIN 
    Folder 
ON 
    Message.folder_id = Folder.folder_id;
	SELECT 
    Announcement.announcement_id, 
    Announcement.title, 
    UserR.username 
FROM 
    Announcement 
INNER JOIN 
    UserR 
ON 
    Announcement.user_id = UserR.user_id;


SELECT COUNT(*) AS TotalUsers
FROM UserR;


SELECT SUM(CAST(age AS FLOAT)) AS totalage
FROM AdminR;


SELECT AVG(CAST(age AS FLOAT)) AS average_age
FROM UserR;


SELECT MIN(CAST(age AS FLOAT)) AS min_age 
FROM UserR;


SELECT MAX(created_at) AS LatestFolderCreation
FROM Folder;
