package com.eduflow;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.*;
import java.util.*;

/**
 * EduFlow — Course Fee Controller
 * URL: /fees
 */
@RestController
@RequestMapping("/fees")
@CrossOrigin(origins = "*")
public class CourseFeeController {

    @Autowired
    private JdbcTemplate db;

    // GET /fees?search=xxx
    @GetMapping
    public List<Map<String, Object>> getFees(
            @RequestParam(required = false, defaultValue = "") String search) {

        if (search.isEmpty()) {
            return db.queryForList(
                "SELECT cf.*, c.Course_Title FROM course_fees cf " +
                "LEFT JOIN course c ON cf.Course_Code = c.Course_Code ORDER BY cf.Fee_ID");
        } else {
            String like = "%" + search + "%";
            return db.queryForList(
                "SELECT cf.*, c.Course_Title FROM course_fees cf " +
                "LEFT JOIN course c ON cf.Course_Code = c.Course_Code " +
                "WHERE cf.Fee_ID LIKE ? OR cf.Course_Code LIKE ? OR c.Course_Title LIKE ? ORDER BY cf.Fee_ID",
                like, like, like);
        }
    }

    // POST /fees — add or update fee
    @PostMapping
    public Map<String, String> saveFee(@RequestBody Map<String, Object> body) {
        try {
            db.update(
                "INSERT INTO course_fees (Fee_ID, Course_Code, Amount, Semester, Due_Date) " +
                "VALUES (?,?,?,?,?) " +
                "ON DUPLICATE KEY UPDATE " +
                "Course_Code=VALUES(Course_Code), Amount=VALUES(Amount), " +
                "Semester=VALUES(Semester), Due_Date=VALUES(Due_Date)",
                body.get("Fee_ID"), body.get("Course_Code"), body.get("Amount"),
                body.get("Semester"), body.get("Due_Date")
            );
            return Map.of("message", "Fee record saved successfully.");
        } catch (Exception e) {
            return Map.of("message", "Error: " + e.getMessage());
        }
    }

    // DELETE /fees?id=F001
    @DeleteMapping
    public Map<String, String> deleteFee(@RequestParam String id) {
        try {
            int rows = db.update("DELETE FROM course_fees WHERE Fee_ID = ?", id);
            return rows > 0
                ? Map.of("message", "Fee record deleted successfully.")
                : Map.of("message", "Fee record not found.");
        } catch (Exception e) {
            return Map.of("message", "Error: " + e.getMessage());
        }
    }
}
