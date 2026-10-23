package org.techhub.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.techhub.model.StudentRoster;
import org.techhub.repository.StudentRosterRepository;

@Service
public class StudentRosterService {

    @Autowired
    private StudentRosterRepository studentRosterRepository;

    public List<StudentRoster> getRosterByCourse(int courseId) {

        return studentRosterRepository
                .getRosterByCourse(courseId);
    }
}