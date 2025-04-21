package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/BookRoomServlet")
public class BookRoomServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the room number
        String roomNumber = request.getParameter("roomNumber");

        // Redirect to booking page with the room number
        request.setAttribute("roomNumber", roomNumber);
        request.getRequestDispatcher("bookRoom.jsp").forward(request, response);
    }
}
