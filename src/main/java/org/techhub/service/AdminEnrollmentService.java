package org.techhub.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.techhub.model.CourseEnrollment;
import org.techhub.repository.AdminEnrollmentRepository;

@Service
public class AdminEnrollmentService {

    @Autowired
    private AdminEnrollmentRepository adminEnrollmentRepository;


    // Get all enrollments
    public List<CourseEnrollment> getAllEnrollments() {

        return adminEnrollmentRepository.getAllEnrollments();
    }


    // Approve pending enrollment
    public int approveEnrollment(int enrollmentId) {

        return adminEnrollmentRepository
                .approveEnrollment(enrollmentId);
    }


    // Drop enrolled course
    public int dropEnrollment(int enrollmentId) {

        return adminEnrollmentRepository
                .dropEnrollment(enrollmentId);
    }
}