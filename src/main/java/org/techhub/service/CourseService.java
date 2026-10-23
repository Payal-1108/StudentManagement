package org.techhub.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.techhub.model.Course;
import org.techhub.repository.CourseRepository;

@Service
public class CourseService {

    @Autowired
    private CourseRepository courseRepository;


    // ==============================
    // GET ALL COURSES
    // ==============================

    public List<Course> getAllCourses() {

        return courseRepository.getAllCourses();
    }


    // ==============================
    // GET COURSE BY ID
    // ==============================

    public Course getCourseById(int id) {

        return courseRepository.getCourseById(id);
    }


    // ==============================
    // ADD COURSE
    // ==============================

    public int addCourse(Course course) {

        return courseRepository.addCourse(course);
    }


    // ==============================
    // UPDATE COURSE
    // ==============================

    public int updateCourse(Course course) {

        return courseRepository.updateCourse(course);
    }


    // ==============================
    // DELETE COURSE
    // ==============================

    public int deleteCourse(int id) {

        return courseRepository.deleteCourse(id);
    }


    // ==============================
    // GET AVAILABLE COURSES
    // ==============================

    public List<Course> getAvailableCourses() {

        return courseRepository.getAvailableCourses();
    }
}