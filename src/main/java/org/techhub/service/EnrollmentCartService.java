package org.techhub.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.stereotype.Service;

import org.techhub.model.EnrollmentCartItem;

@Service
public class EnrollmentCartService {

    private static final String CART_ATTRIBUTE =
            "enrollmentCart";


    @SuppressWarnings("unchecked")
    public List<EnrollmentCartItem> getCart(
            jakarta.servlet.http.HttpSession session) {

        List<EnrollmentCartItem> cart =
                (List<EnrollmentCartItem>)
                session.getAttribute(CART_ATTRIBUTE);

        if (cart == null) {

            cart = new ArrayList<>();

            session.setAttribute(
                    CART_ATTRIBUTE,
                    cart
            );
        }

        return cart;
    }


    public boolean addToCart(
            jakarta.servlet.http.HttpSession session,
            EnrollmentCartItem item) {

        List<EnrollmentCartItem> cart =
                getCart(session);

        // Prevent duplicate course
        for (EnrollmentCartItem existing : cart) {

            if (existing.getCourseId()
                    == item.getCourseId()) {

                return false;
            }
        }

        cart.add(item);

        return true;
    }


    public boolean removeFromCart(
            jakarta.servlet.http.HttpSession session,
            int courseId) {

        List<EnrollmentCartItem> cart =
                getCart(session);

        Iterator<EnrollmentCartItem> iterator =
                cart.iterator();

        while (iterator.hasNext()) {

            EnrollmentCartItem item =
                    iterator.next();

            if (item.getCourseId() == courseId) {

                iterator.remove();

                return true;
            }
        }

        return false;
    }


    public void clearCart(
            jakarta.servlet.http.HttpSession session) {

        session.removeAttribute(CART_ATTRIBUTE);
    }


    public double getTotalFee(
            jakarta.servlet.http.HttpSession session) {

        List<EnrollmentCartItem> cart =
                getCart(session);

        double total = 0;

        for (EnrollmentCartItem item : cart) {

            total = total + item.getFeeAmount();
        }

        return total;
    }
}