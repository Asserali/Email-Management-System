



# User Messaging & Group Management SQL Database

## 📘 Project Overview

This project defines a relational database schema for managing users, accounts, messages, folders, admin interactions, and user groups within a messaging system. It includes table definitions, constraints, and data insertion scripts for testing and demonstration purposes.

---

## 🧱 Database Structure

The database includes the following tables:

### 🔹 `UserR`
Stores user information.
- `user_id`, `username`, `email`, `age`

### 🔹 `Account`
Linked to users, holds login credentials and status.
- `account_id`, `user_id`, `password_hash`, `account_type`, `status`, etc.

### 🔹 `AdminR`
Represents admins with separate credentials and attributes.
- `admin_id`, `account_id`, `email`, `age`

### 🔹 `Folder`
Email-style folders for users and admins.
- `folder_id`, `user_id`, `admin_id`, `folder_name`, `created_at`

### 🔹 `Message`
Stores messages exchanged between users.
- `message_id`, `sender_id`, `receiver_id`, `folder_id`, `subject`, `body`, `sent_at`

### 🔹 `Settings`
User/admin preferences.
- `settings_id`, `user_id`, `admin_id`, `theme`, `notification_preference`

### 🔹 `Announcement`
Admin announcements sent to users.
- `announcement_id`, `admin_id`, `user_id`, `title`, `message`, `published_at`

### 🔹 `UserGroup`
User groups managed by admins.
- `group_id`, `user_id`, `admin_id`, `group_name`

### 🔹 `belongroup`
Many-to-many relationship between users and groups.

### 🔹 `managegroup`
Many-to-many relationship between admins and groups.

---

## 🔄 Sample Queries

### Select Users with Gmail:
```sql
SELECT * FROM UserR WHERE email LIKE '%gmail.com%' ORDER BY username;
```

### Join: Users & Accounts
```sql
SELECT 
    UserR.user_id, 
    UserR.username, 
    Account.account_id, 
    Account.status 
FROM 
    UserR 
LEFT JOIN Account ON UserR.user_id = Account.user_id;
```

### Admin Announcements:
```sql
SELECT 
    Announcement.announcement_id, 
    Announcement.title, 
    UserR.username 
FROM 
    Announcement 
INNER JOIN UserR ON Announcement.user_id = UserR.user_id;
```

### Aggregate Data:
- Total Users:
  ```sql
  SELECT COUNT(*) AS TotalUsers FROM UserR;
  ```
- Average Age:
  ```sql
  SELECT AVG(CAST(age AS FLOAT)) AS average_age FROM UserR;
  ```

---

## 🚀 Getting Started

1. Create a database in your SQL Server or compatible RDBMS.
2. Run the schema scripts to create tables.
3. Insert sample data using provided `INSERT INTO` statements.
4. Run the queries to explore relationships and data insights.

---

## 🛠 Technologies

- **SQL Server / T-SQL**
- Relational Database Design
- Data Normalization
- Indexing & Joins
- Aggregates and Filtering

---

## 📄 License

This project is open-source and available under the [MIT License](LICENSE).

---

## 🙌 Contributing

Feel free to fork this repo, raise issues, or contribute improvements via PR!

---

## 📬 Contact

For any queries or suggestions, reach out via [GitHub Issues](https://github.com/yourusername/yourrepo/issues).
```

---

