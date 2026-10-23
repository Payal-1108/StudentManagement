package org.techhub.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.techhub.model.FeePayment;
import org.techhub.repository.FeePaymentRepository;

@Service
public class FeePaymentService {

    @Autowired
    private FeePaymentRepository feePaymentRepository;

    public int addPayment(FeePayment payment) {

        return feePaymentRepository.addPayment(payment);
    }

    public List<FeePayment> getStudentPayments(int studentId) {

        return feePaymentRepository.getStudentPayments(studentId);
    }
    public void makePayment(FeePayment payment) {
        feePaymentRepository.makePayment(payment);
    }
}