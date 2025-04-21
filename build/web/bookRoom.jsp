<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.Room" %>
<%@ page import="dao.RoomDAO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Room</title>
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
            max-width: 600px;
        }

        h2 {
            color: #4CAF50;
            text-align: center;
            font-size: 1.8em;
            margin-bottom: 20px;
        }

        label {
            font-size: 1em;
            margin-bottom: 8px;
            display: block;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
        }

        button:hover {
            background-color: #45a049;
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
        <h2>Book Room</h2>
        <form action="ConfirmBookingServlet" method="post">
            <label for="roomNumber">Room Number:</label>
            <input type="text" id="roomNumber" name="roomNumber" value="<%= request.getAttribute("roomNumber") %>" readonly><br>

            <label for="guestName">Guest Name:</label>
            <input type="text" id="guestName" name="guestName" required><br>

            <label for="contact">Contact Info:</label>
            <input type="text" id="contact" name="contact" required><br>

            <button type="submit">Confirm Booking</button>
        </form>
        <div class="back-link">
            <p><a href="viewRooms.jsp">Back to Room List</a></p>
        </div>
    </div>
</body>
</html>
