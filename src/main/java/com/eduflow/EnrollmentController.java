package com.eduflow;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.*;
import java.util.*;

/**
 * EduFlow — Enrollment Controller
 * URL: /enrollment
 */
@RestController
@RequestMapping("/enrollment")
@CrossOrigin(origins = "*")
public class EnrollmentController {

    @Autowired
    private JdbcTemplate db;

    // GET /enrollment?search=xxx
    @GetMapping
    public List<Map<String, Object>> getEnrollments(
            @RequestParam(required = false, defaultValue = "") String search) {

        if (search.isEmpty()) {
            return db.queryForList(
                "SELECT e.*, s.Student_Name, c.Course_Title FROM enrollment e " +
                "LEFT JOIN student s ON e.Student_ID = s.Student_ID " +
                "LEFT JOIN course c ON e.Course_Code = c.Course_Code " +
                "ORDER BY e.Enroll_ID DESC");
        } else {
            String like = "%" + search + "%";
            return db.queryForList(
                "SELECT e.*, s.Student_Name, c.Course_Title FROM enrollment e " +
                "LEFT JOIN student s ON e.Student_ID = s.Student_ID " +
                "LEFT JOIN course c ON e.Course_Code = c.Course_Code " +
                "WHERE e.Student_ID LIKE ? OR e.Course_Code LIKE ? OR s.Student_Name LIKE ? " +
                "ORDER BY e.Enroll_ID DESC",
                like, like, like);
        }
    }

    // POST /enrollment — add new enrollment
    @PostMapping
    public Map<String, String> saveEnrollment(@RequestBody Map<String, Object> body) {
        try {
            db.update(
                "INSERT INTO enrollment (Enroll_ID, Student_ID, Course_Code, Enrollment_Date, Grade, Fee_ID) " +
                "VALUES (?,?,?,?,?,?)",
                body.get("Enroll_ID"), body.get("Student_ID"), body.get("Course_Code"),
                body.get("Enrollment_Date"), body.get("Grade"), body.get("Fee_ID")
            );
            return Map.of("message", "Student enrolled successfully.");
        } catch (Exception e) {
            String msg = e.getMessage();
            if (msg != null && msg.contains("Invalid Grade")) {
                return Map.of("message", "Invalid grade. Allowed: A, B, C, D, F only.");
            }
            return Map.of("message", "Error: " + msg);
        }
    }

    // DELETE /enrollment?id=1001
    @DeleteMapping
    public Map<String, String> deleteEnrollment(@RequestParam int id) {
        try {
            int rows = db.update("DELETE FROM enrollment WHERE Enroll_ID = ?", id);
            return rows > 0
                ? Map.of("message", "Enrollment deleted successfully.")
                : Map.of("message", "Enrollment not found.");
        } catch (Exception e) {
            return Map.of("message", "Error: " + e.getMessage());
        }
    }
}
