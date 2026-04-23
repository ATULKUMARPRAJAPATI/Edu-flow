# EduFlow — Online Enrollment System
 
A full-stack student course enrollment management system built with Java Spring Boot and MySQL.
 
---
 
## Project Structure
 
```
E:\Edu flow\
├── pom.xml                                  ← Maven dependencies
├── src\
│   └── main\
│       ├── java\com\eduflow\
│       │   ├── EduFlowApplication.java      ← Spring Boot entry point (run this)
│       │   ├── StudentController.java       ← REST API: /student
│       │   ├── TeacherController.java       ← REST API: /teacher
│       │   ├── CourseController.java        ← REST API: /course
│       │   ├── EnrollmentController.java    ← REST API: /enrollment
│       │   └── CourseFeeController.java     ← REST API: /fees
│       └── resources\
│           ├── application.properties       ← Database config
│           └── static\
│               └── index.html              ← Frontend UI
└── README.md                               ← This file
```
 
---
 
## Tech Stack
 
| Layer     | Technology                  |
|-----------|-----------------------------|
| Frontend  | HTML5, CSS3, JavaScript     |
| Backend   | Java 21, Spring Boot 3.2.5  |
| Database  | MySQL 8.0 (miniproject DB)  |
| Build     | Maven 3.9.x                 |
 
---
 
## Prerequisites
 
Make sure these are installed before running:
 
- [Java JDK 21+](https://www.oracle.com/java/technologies/downloads/)
- [Apache Maven 3.9+](https://maven.apache.org/download.cgi)
- [MySQL 8.0](https://dev.mysql.com/downloads/mysql/)
- [VS Code](https://code.visualstudio.com/) with Extension Pack for Java
Check versions in terminal:
```bash
java -version
mvn --version
mysql --version
```
 
---
 
## Database Setup
 
1. Open MySQL Workbench or terminal
2. Import the database:
```bash
mysql -u root -p < exported_database.sql
```
3. Verify tables exist:
```sql
USE miniproject;
SHOW TABLES;
```
You should see: `student`, `teacher`, `course`, `course_fees`, `enrollment`, `enrollment_errors`
 
---
 
## Configuration
 
Open `src/main/resources/application.properties` and set your MySQL password:
 
```properties
spring.datasource.url=jdbc:mysql://localhost:3306/miniproject
spring.datasource.username=root
spring.datasource.password=YOUR_PASSWORD_HERE   ← change this
server.port=8080
```
 
---
 
## How to Run
 
Open VS Code terminal (`Ctrl + ~`) in the `E:\Edu flow\` folder:
 
```bash
mvn clean spring-boot:run
```
 
Wait for this message:
```
✅ EduFlow server started!
🌐 Open: http://localhost:8080/index.html
```
 
Then open your browser and go to:
```
http://localhost:8080/index.html
```
 
> ⚠️ Do NOT open index.html by double-clicking.
> Always use http://localhost:8080/index.html
 
---
 
## REST API Endpoints
 
| Method | Endpoint      | Description                     |
|--------|---------------|---------------------------------|
| GET    | /student      | Get all students (search param) |
| POST   | /student      | Add or update a student         |
| DELETE | /student?id=  | Delete student by ID            |
| GET    | /teacher      | Get all teachers                |
| POST   | /teacher      | Add or update a teacher         |
| DELETE | /teacher?id=  | Delete teacher by ID            |
| GET    | /course       | Get all courses                 |
| POST   | /course       | Add or update a course          |
| DELETE | /course?code= | Delete course by code           |
| GET    | /enrollment   | Get all enrollments             |
| POST   | /enrollment   | Enroll a student                |
| DELETE | /enrollment?id=| Remove enrollment              |
| GET    | /fees         | Get all fee records             |
| POST   | /fees         | Add or update fee record        |
| DELETE | /fees?id=     | Delete fee record               |
 
Test in browser:
```
http://localhost:8080/student
http://localhost:8080/course
http://localhost:8080/teacher
```
If you see JSON data — everything is working ✅
 
---
 
## Database Tables
 
| Table             | Primary Key   | Description                        |
|-------------------|---------------|------------------------------------|
| student           | Student_ID    | Student personal records           |
| teacher           | Teacher_ID    | Faculty records                    |
| course            | Course_Code   | Course catalogue                   |
| course_fees       | Fee_ID        | Fee structure per course/semester  |
| enrollment        | Enroll_ID     | Student-Course enrollment records  |
| enrollment_errors | Error_ID      | Trigger error log table            |
 
---
 
## Features
 
- ✅ Dashboard with live stats (students, courses, enrollments, teachers)
- ✅ Full CRUD for all 5 tables
- ✅ Live search on every table
- ✅ Grade validation via DB trigger (A, B, C, D, F only)
- ✅ Auto enrollment date via DB trigger
- ✅ Color-coded grade badges
- ✅ Toast notifications for success/error
- ✅ Responsive sidebar navigation
---
 
## Common Errors & Fixes
 
| Error | Fix |
|-------|-----|
| `mvn not recognized` | Add Maven `bin` folder to System PATH |
| `Connection refused` | Make sure `mvn spring-boot:run` is running |
| `Access denied for user root` | Wrong password in `application.properties` |
| Data not showing in UI | Open via `http://localhost:8080` not `file://` |
| Port 8080 already in use | Change `server.port=8081` in application.properties |
 
---
 
## Authors
 
- **Ayush Mishra** — RA2412707010005
- **Atul Kumar Prajapati** — RA2412707010028
Guide: **Dr. Santhiya Parivallal**
 
Department of Networking and Communications
SRM Institute of Science and Technology, Kattankulathur — 603 203
 
---
 
*21CSC205P — Database Management Systems Mini Project | May 2026*
