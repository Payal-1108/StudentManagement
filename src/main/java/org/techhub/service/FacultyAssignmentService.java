package org.techhub.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.techhub.model.Faculty;
import org.techhub.model.FacultyCourse;
import org.techhub.repository.FacultyAssignmentRepository;

@Service
public class FacultyAssignmentService {

    @Autowired
    private FacultyAssignmentRepository facultyAssignmentRepository;


    // Get all faculty members

    public List<Faculty> getAllFaculty() {

        return facultyAssignmentRepository
                .getAllFaculty();
    }


    // Get all courses

    public List<FacultyCourse> getAllCourses() {

        return facultyAssignmentRepository
                .getAllCourses();
    }


    // Assign course to faculty

    public int assignCourse(
            int facultyId,
            int courseId,
            String semester) {

        return facultyAssignmentRepository
                .assignCourse(
                        facultyId,
                        courseId,
                        semester
                );
    }
}