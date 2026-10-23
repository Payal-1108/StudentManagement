package org.techhub.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.techhub.model.Faculty;
import org.techhub.repository.FacultyRepository;

@Service
public class FacultyService {

    @Autowired
    private FacultyRepository facultyRepository;

    public Faculty login(String email, String password) {

        return facultyRepository
                .getFacultyByEmailAndPassword(
                        email,
                        password
                );
    }
}