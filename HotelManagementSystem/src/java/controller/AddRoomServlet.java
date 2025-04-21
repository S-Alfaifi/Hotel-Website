package controller;

import dao.RoomDAO;
import model.Room;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddRoomServlet")
public class AddRoomServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get parameters from the form
        String roomNumber = request.getParameter("roomNumber");
        String roomType = request.getParameter("roomType");
        boolean isAvailable = Boolean.parseBoolean(request.getParameter("availability"));

        // Create Room object
        Room room = new Room();
        room.setRoomNumber(roomNumber);
        room.setRoomType(roomType);
        room.setAvailable(isAvailable);

        // Add room to the database
        try {
            RoomDAO roomDAO = new RoomDAO();
            boolean success = roomDAO.addRoom(room);
            if (success) {
                response.sendRedirect("viewRooms.jsp");
            } else {
                response.getWriter().println("Error: Room could not be added.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
