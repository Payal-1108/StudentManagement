package org.techhub.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.techhub.model.FeePayment;
import org.techhub.repository.AdminPaymentRepository;

@Service
public class AdminPaymentService {

    @Autowired
    private AdminPaymentRepository adminPaymentRepository;

    public List<FeePayment> getAllPayments() {

        return adminPaymentRepository.getAllPayments();
    }
}