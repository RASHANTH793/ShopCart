package com.ShopCart.Verification;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Random;

@WebServlet(name="GenerateCaptcha", urlPatterns={"/GenerateCaptcha"})
public class GenerateCaptcha extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Generate a random CAPTCHA
        String captcha = generateCaptcha();
        
        // Store the CAPTCHA in the session
        HttpSession session = request.getSession();
        session.setAttribute("captcha", captcha);
        
        // Optionally send the CAPTCHA back as a response (useful for AJAX-based apps)
        response.setContentType("text/plain");
        response.getWriter().write(captcha);
    }

    private String generateCaptcha() {
        String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        StringBuilder captcha = new StringBuilder();
        Random random = new Random();
        for (int i = 0; i < 6; i++) { // Generate 6-character CAPTCHA
            captcha.append(chars.charAt(random.nextInt(chars.length())));
        }
        return captcha.toString();
    }
}
