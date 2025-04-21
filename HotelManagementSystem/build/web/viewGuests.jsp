<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Guest" %>
<%@ page import="dao.GuestDAO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Guest List</title>
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
    </style>
</head>
<body>
    <div class="container">
        <h2>Guest List</h2>
        <table>
            <tr>
                <th>Guest ID</th>
                <th>Guest Name</th>
                <th>Room Number</th>
                <th>Booking Date</th> <!-- Adjusted column name -->
            </tr>
            <%
                try {
                    GuestDAO guestDAO = new GuestDAO();
                    List<Guest> guests = guestDAO.getAllGuests();
                    for (Guest guest : guests) {
            %>
            <tr>
                <td><%= guest.getId() %></td>
                <td><%= guest.getName() %></td>
                <td><%= guest.getRoomNumber() %></td>
                <td><%= guest.getBookingDate() %></td> <!-- Displaying booking date -->
            </tr>
            <% 
                    }
                } catch (Exception e) {
                    out.println("<tr><td colspan='4'>Error: " + e.getMessage() + "</td></tr>");
                }
            %>
        </table>
        <div class="back-link">
            <p><a href="index.jsp">Back to Main</a></p>
        </div>
    </div>
</body>
</html>
