package com.eduflow;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.*;
import java.util.*;

/**
 * EduFlow — Teacher Controller
 * URL: /teacher
 */
@RestController
@RequestMapping("/teacher")
@CrossOrigin(origins = "*")
public class TeacherController {

    @Autowired
    private JdbcTemplate db;

    // GET /teacher?search=xxx
    @GetMapping
    public List<Map<String, Object>> getTeachers(
            @RequestParam(required = false, defaultValue = "") String search) {

        if (search.isEmpty()) {
            return db.queryForList("SELECT * FROM teacher ORDER BY Teacher_ID");
        } else {
            String like = "%" + search + "%";
            return db.queryForList(
                "SELECT * FROM teacher WHERE Teacher_Name LIKE ? OR Teacher_ID LIKE ? OR Designation LIKE ? ORDER BY Teacher_ID",
                like, like, like);
        }
    }

    // POST /teacher — add or update teacher
    @PostMapping
    public Map<String, String> saveTeacher(@RequestBody Map<String, String> body) {
        try {
            db.update(
                "INSERT INTO teacher (Teacher_ID, Teacher_Name, Designation, Email, Phone, Hire_Date) " +
                "VALUES (?,?,?,?,?,?) " +
                "ON DUPLICATE KEY UPDATE " +
                "Teacher_Name=VALUES(Teacher_Name), Designation=VALUES(Designation), " +
                "Email=VALUES(Email), Phone=VALUES(Phone), Hire_Date=VALUES(Hire_Date)",
                body.get("Teacher_ID"), body.get("Teacher_Name"), body.get("Designation"),
                body.get("Email"), body.get("Phone"), body.get("Hire_Date")
            );
            return Map.of("message", "Teacher saved successfully.");
        } catch (Exception e) {
            return Map.of("message", "Error: " + e.getMessage());
        }
    }

    // DELETE /teacher?id=T001
    @DeleteMapping
    public Map<String, String> deleteTeacher(@RequestParam String id) {
        try {
            int rows = db.update("DELETE FROM teacher WHERE Teacher_ID = ?", id);
            return rows > 0
                ? Map.of("message", "Teacher deleted successfully.")
                : Map.of("message", "Teacher not found.");
        } catch (Exception e) {
            return Map.of("message", "Error: " + e.getMessage());
        }
    }
}
