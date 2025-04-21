<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Room" %>
<%@ page import="dao.RoomDAO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Rooms</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 1000px;
            overflow-x: auto;
        }

        h2 {
            color: #4CAF50;
            text-align: center;
            font-size: 1.8em;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 8px 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }

        button:disabled {
            background-color: #ccc;
            cursor: not-allowed;
        }

        .back-link {
            text-align: center;
            margin-top: 20px;
        }

        .back-link a {
            color: #4CAF50;
            text-decoration: none;
            font-weight: bold;
        }

        .back-link a:hover {
            color: #45a049;
        }

        .error-message {
            color: red;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Room List</h2>

        <%-- Display error message if present --%>
        <% if (request.getAttribute("errorMessage") != null) { %>
            <p class="error-message"><%= request.getAttribute("errorMessage") %></p>
        <% } %>

        <table>
            <tr>
                <th>Room Number</th>
                <th>Room Type</th>
                <th>Availability</th>
                <th>Delete the Room</th>
                <th>Book A Room</th>
                <th>Remove the Booking</th>
            </tr>
            <%
                try {
                    RoomDAO roomDAO = new RoomDAO();
                    List<Room> rooms = roomDAO.getAllRooms();
                    for (Room room : rooms) {
            %>
            <tr>
                <td><%= room.getRoomNumber() %></td>
                <td><%= room.getRoomType() %></td>
                <td><%= room.isAvailable() ? "Available" : "Occupied" %></td>
                <td>
                    <form action="DeleteRoomServlet" method="post" style="display:inline;">
                        <input type="hidden" name="roomNumber" value="<%= room.getRoomNumber() %>">
                        <button type="submit">Delete</button>
                    </form>
                </td>
                <td>
                    <% if (room.isAvailable()) { %>
                        <form action="BookRoomServlet" method="post" style="display:inline;">
                            <input type="hidden" name="roomNumber" value="<%= room.getRoomNumber() %>">
                            <button type="submit">Book</button>
                        </form>
                    <% } else { %>
                        <button disabled>Occupied</button>
                    <% } %>
                </td>
                <td>
                    <% if (!room.isAvailable()) { %>
                        <form action="RemoveBookingServlet" method="post" style="display:inline;">
                            <input type="hidden" name="roomNumber" value="<%= room.getRoomNumber() %>">
                            <button type="submit">Remove Booking</button>
                        </form>
                    <% } else { %>
                        <button disabled>Available</button>
                    <% } %>
                </td>
            </tr>
            <% 
                    }
                } catch (Exception e) {
                    out.println("<tr><td colspan='6'>Error: " + e.getMessage() + "</td></tr>");
                }
            %>
        </table>
        <div class="back-link">
            <p><a href="index.jsp">Back to Main</a></p>
        </div>
    </div>
</body>
</html>
