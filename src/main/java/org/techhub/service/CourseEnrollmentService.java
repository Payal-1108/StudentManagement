package org.techhub.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.techhub.model.CourseEnrollment;
import org.techhub.repository.CourseEnrollmentRepository;

@Service
public class CourseEnrollmentService {

    @Autowired
    private CourseEnrollmentRepository courseEnrollmentRepository;


    // =========================================
    // ENROLL STUDENT
    // =========================================

    public int enrollStudent(CourseEnrollment enrollment) {

        return courseEnrollmentRepository
                .enrollStudent(enrollment);
    }


    // =========================================
    // CHECK ALREADY ENROLLED
    // =========================================

    public boolean isAlreadyEnrolled(
            int studentId,
            int courseId) {

        return courseEnrollmentRepository
                .isAlreadyEnrolled(
                        studentId,
                        courseId
                );
    }


    // =========================================
    // GET STUDENT ENROLLMENTS
    // =========================================

    public List<CourseEnrollment> getStudentEnrollments(
            int studentId) {

        return courseEnrollmentRepository
                .getStudentEnrollments(
                        studentId
                );
    }


    // =========================================
    // DROP COURSE
    // =========================================

    public int dropCourse(int enrollmentId) {

        return courseEnrollmentRepository
                .dropCourse(enrollmentId);
    }

    public boolean hasCompletedPrerequisite(int studentId, int courseId) {

        return courseEnrollmentRepository.hasCompletedPrerequisite(
                studentId,
                courseId
        );
    }
}