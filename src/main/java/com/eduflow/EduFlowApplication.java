package com.eduflow;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * EduFlow — Main entry point
 * Run this class to start the server on http://localhost:8080
 */
@SpringBootApplication
public class EduFlowApplication {
    public static void main(String[] args) {
        SpringApplication.run(EduFlowApplication.class, args);
        System.out.println("\n✅ EduFlow server started!");
        System.out.println("🌐 Open: http://localhost:8080/index.html");
        System.out.println("🗄️  DB:   localhost:3306/miniproject\n");
    }
}
