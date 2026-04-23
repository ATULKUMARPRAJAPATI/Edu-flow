package com.eduflow;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.*;
import java.util.*;

/**
 * EduFlow — Course Controller
 * URL: /course
 */
@RestController
@RequestMapping("/course")
@CrossOrigin(origins = "*")
public class CourseController {

    @Autowired
    private JdbcTemplate db;

    // GET /course?search=xxx
    @GetMapping
    public List<Map<String, Object>> getCourses(
            @RequestParam(required = false, defaultValue = "") String search) {

        if (search.isEmpty()) {
            return db.queryForList(
                "SELECT c.*, t.Teacher_Name FROM course c " +
                "LEFT JOIN teacher t ON c.Teacher_ID = t.Teacher_ID ORDER BY c.Course_Code");
        } else {
            String like = "%" + search + "%";
            return db.queryForList(
                "SELECT c.*, t.Teacher_Name FROM course c " +
                "LEFT JOIN teacher t ON c.Teacher_ID = t.Teacher_ID " +
                "WHERE c.Course_Code LIKE ? OR c.Course_Title LIKE ? ORDER BY c.Course_Code",
                like, like);
        }
    }

    // POST /course — add or update course
    @PostMapping
    public Map<String, String> saveCourse(@RequestBody Map<String, Object> body) {
        try {
            db.update(
                "INSERT INTO course (Course_Code, Course_Title, Course_Credit, Teacher_ID) " +
                "VALUES (?,?,?,?) " +
                "ON DUPLICATE KEY UPDATE " +
                "Course_Title=VALUES(Course_Title), Course_Credit=VALUES(Course_Credit), Teacher_ID=VALUES(Teacher_ID)",
                body.get("Course_Code"), body.get("Course_Title"),
                body.get("Course_Credit"), body.get("Teacher_ID")
            );
            return Map.of("message", "Course saved successfully.");
        } catch (Exception e) {
            return Map.of("message", "Error: " + e.getMessage());
        }
    }

    // DELETE /course?code=CS101
    @DeleteMapping
    public Map<String, String> deleteCourse(@RequestParam String code) {
        try {
            int rows = db.update("DELETE FROM course WHERE Course_Code = ?", code);
            return rows > 0
                ? Map.of("message", "Course deleted successfully.")
                : Map.of("message", "Course not found.");
        } catch (Exception e) {
            return Map.of("message", "Error: " + e.getMessage());
        }
    }
}
