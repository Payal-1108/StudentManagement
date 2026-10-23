package org.techhub.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.techhub.model.Admin;
import org.techhub.repository.AdminRepository;

@Service
public class AdminService {

    @Autowired
    private AdminRepository adminRepository;

    public Admin login(String username, String password) {

        return adminRepository.login(username, password);
    }
}