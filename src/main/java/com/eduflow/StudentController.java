package com.eduflow;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.*;
import java.util.*;

/**
 * EduFlow — Student Controller
 * Handles all student CRUD operations
 * URL: /student
 */
@RestController
@RequestMapping("/student")
@CrossOrigin(origins = "*")
public class StudentController {

    @Autowired
    private JdbcTemplate db;

    // GET /student?search=xxx — fetch all students
    @GetMapping
    public List<Map<String, Object>> getStudents(
            @RequestParam(required = false, defaultValue = "") String search) {

        if (search.isEmpty()) {
            return db.queryForList("SELECT * FROM student ORDER BY Student_ID");
        } else {
            String like = "%" + search + "%";
            return db.queryForList(
                "SELECT * FROM student WHERE Student_Name LIKE ? OR Student_ID LIKE ? OR Email LIKE ? ORDER BY Student_ID",
                like, like, like);
        }
    }

    // POST /student — add or update student
    @PostMapping
    public Map<String, String> saveStudent(@RequestBody Map<String, String> body) {
        try {
            db.update(
                "INSERT INTO student (Student_ID, Student_Name, Father_Name, Father_Mobile, " +
                "Mother_Name, Student_Mobile, Email, DOB, Address) VALUES (?,?,?,?,?,?,?,?,?) " +
                "ON DUPLICATE KEY UPDATE " +
                "Student_Name=VALUES(Student_Name), Father_Name=VALUES(Father_Name), " +
                "Father_Mobile=VALUES(Father_Mobile), Mother_Name=VALUES(Mother_Name), " +
                "Student_Mobile=VALUES(Student_Mobile), Email=VALUES(Email), " +
                "DOB=VALUES(DOB), Address=VALUES(Address)",
                body.get("Student_ID"), body.get("Student_Name"), body.get("Father_Name"),
                body.get("Father_Mobile"), body.get("Mother_Name"), body.get("Student_Mobile"),
                body.get("Email"), body.get("DOB"), body.get("Address")
            );
            return Map.of("message", "Student saved successfully.");
        } catch (Exception e) {
            return Map.of("message", "Error: " + e.getMessage());
        }
    }

    // DELETE /student?id=S001 — delete student
    @DeleteMapping
    public Map<String, String> deleteStudent(@RequestParam String id) {
        try {
            int rows = db.update("DELETE FROM student WHERE Student_ID = ?", id);
            return rows > 0
                ? Map.of("message", "Student deleted successfully.")
                : Map.of("message", "Student not found.");
        } catch (Exception e) {
            return Map.of("message", "Error: " + e.getMessage());
        }
    }
}
