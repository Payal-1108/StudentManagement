package org.techhub.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.techhub.model.FacultyCourse;
import org.techhub.repository.FacultyCourseRepository;

@Service
public class FacultyCourseService {

    @Autowired
    private FacultyCourseRepository facultyCourseRepository;

    public List<FacultyCourse> getAssignedCourses(int facultyId) {

        return facultyCourseRepository
                .getAssignedCourses(facultyId);
    }
}