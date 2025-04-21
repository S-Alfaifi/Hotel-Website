package controller;

import dao.RoomDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RemoveBookingServlet")
public class RemoveBookingServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String roomNumber = request.getParameter("roomNumber");

        try {
            RoomDAO roomDAO = new RoomDAO();
            boolean removed = roomDAO.removeBooking(roomNumber);

            if (removed) {
                response.sendRedirect("viewRooms.jsp"); // Redirect back to room list
            } else {
                response.getWriter().println("Error: Could not remove the booking.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
