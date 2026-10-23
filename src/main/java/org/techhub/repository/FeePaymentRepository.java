package org.techhub.repository;

import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import org.techhub.model.FeePayment;

@Repository
public class FeePaymentRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;


    // =====================================================
    // ADD PAYMENT
    // =====================================================

    public int addPayment(FeePayment payment) {

        String receiptNumber =
                "REC-" +
                UUID.randomUUID()
                    .toString()
                    .substring(0, 8)
                    .toUpperCase();

        String sql =
                "INSERT INTO fee_payments " +
                "(student_id, amount, payment_date, " +
                "payment_status, receipt_number) " +
                "VALUES (?, ?, ?, ?, ?)";

        return jdbcTemplate.update(
                sql,
                payment.getStudentId(),
                payment.getAmount(),
                LocalDate.now(),
                payment.getPaymentStatus(),
                receiptNumber
        );
    }


    // =====================================================
    // MAKE PAYMENT
    // =====================================================

    public void makePayment(FeePayment payment) {

        String receiptNumber =
                "REC-" +
                UUID.randomUUID()
                    .toString()
                    .substring(0, 8)
                    .toUpperCase();

        String sql =
                "INSERT INTO fee_payments " +
                "(student_id, amount, payment_date, " +
                "payment_status, receipt_number) " +
                "VALUES (?, ?, ?, ?, ?)";

        jdbcTemplate.update(
                sql,
                payment.getStudentId(),
                payment.getAmount(),
                LocalDate.now(),
                payment.getPaymentStatus(),
                receiptNumber
        );
    }


    // =====================================================
    // GET STUDENT PAYMENTS
    // =====================================================

    public List<FeePayment> getStudentPayments(
            int studentId) {

        String sql =
                "SELECT id, student_id, amount, " +
                "payment_date, payment_status, " +
                "receipt_number " +
                "FROM fee_payments " +
                "WHERE student_id = ? " +
                "ORDER BY payment_date DESC";

        return jdbcTemplate.query(
                sql,
                (rs, rowNum) -> {

                    FeePayment payment =
                            new FeePayment();

                    payment.setId(
                            rs.getInt("id")
                    );

                    payment.setStudentId(
                            rs.getInt("student_id")
                    );

                    payment.setAmount(
                            rs.getDouble("amount")
                    );

                    payment.setPaymentDate(
                            rs.getDate("payment_date").toLocalDate()
                    );
                    payment.setPaymentStatus(
                            rs.getString("payment_status")
                    );

                    payment.setReceiptNumber(
                            rs.getString("receipt_number")
                    );

                    return payment;
                },
                studentId
        );
    }
}