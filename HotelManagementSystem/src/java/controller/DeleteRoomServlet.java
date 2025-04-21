package controller;

import dao.RoomDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteRoomServlet")
public class DeleteRoomServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String roomNumber = request.getParameter("roomNumber");

        try {
            RoomDAO roomDAO = new RoomDAO();

            // Check if the room has an active booking
            if (roomDAO.hasBooking(roomNumber)) {
                request.setAttribute("errorMessage", "Room cannot be deleted because it has an active booking.");
                request.getRequestDispatcher("viewRooms.jsp").forward(request, response);
                return;
            }

            // Proceed with deletion
            boolean deleted = roomDAO.deleteRoom(roomNumber);
            if (deleted) {
                response.sendRedirect("viewRooms.jsp"); // Redirect to room list
            } else {
                request.setAttribute("errorMessage", "Error: Could not delete the room.");
                request.getRequestDispatcher("viewRooms.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error: " + e.getMessage());
            request.getRequestDispatcher("viewRooms.jsp").forward(request, response);
        }
    }
}
