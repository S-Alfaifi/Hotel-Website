package controller;

import dao.RoomDAO;
import model.Booking;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ConfirmBookingServlet")
public class ConfirmBookingServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form data
        String roomNumber = request.getParameter("roomNumber");
        String guestName = request.getParameter("guestName");
        String contact = request.getParameter("contact");

        // Create a Booking object
        Booking booking = new Booking();
        booking.setRoomNumber(roomNumber);
        booking.setGuestName(guestName);
        booking.setContact(contact);

        // Save booking and update room status
        try {
            RoomDAO roomDAO = new RoomDAO();
            boolean bookingSuccess = roomDAO.saveBooking(booking);
            if (bookingSuccess) {
                response.sendRedirect("viewRooms.jsp"); // Redirect back to room list
            } else {
                response.getWriter().println("Error: Booking could not be confirmed.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
