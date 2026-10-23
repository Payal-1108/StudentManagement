package org.techhub.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import org.techhub.model.FeePayment;

@Repository
public class AdminPaymentRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<FeePayment> getAllPayments() {

        String sql =
                "SELECT fp.id, " +
                "fp.student_id, " +
                "fp.amount, " +
                "fp.payment_date, " +
                "fp.payment_status, " +
                "fp.receipt_number, " +
                "s.roll_number, " +
                "s.name AS student_name " +
                "FROM fee_payments fp " +
                "JOIN students s " +
                "ON fp.student_id = s.id " +
                "ORDER BY fp.id DESC";

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

                    if (rs.getDate("payment_date") != null) {

                        payment.setPaymentDate(
                                rs.getDate("payment_date")
                                        .toLocalDate()
                        );
                    }

                    payment.setPaymentStatus(
                            rs.getString("payment_status")
                    );

                    payment.setReceiptNumber(
                            rs.getString("receipt_number")
                    );

                    return payment;
                }
        );
    }
}