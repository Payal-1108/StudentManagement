package org.techhub.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.techhub.model.Faculty;
import org.techhub.repository.FacultyRegistrationRepository;

@Service
public class FacultyRegistrationService {

    @Autowired
    private FacultyRegistrationRepository facultyRegistrationRepository;

    public int registerFaculty(Faculty faculty) {

        return facultyRegistrationRepository.registerFaculty(faculty);
    }
}