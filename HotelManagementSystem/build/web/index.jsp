<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Management System</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
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
            border-radius: 15px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 450px;
            padding: 30px;
            text-align: center;
            margin: 20px;
        }

        h1 {
            font-size: 2.5em;
            color: #4CAF50;
            margin-bottom: 20px;
        }

        .button {
            display: block;
            width: 100%;
            background-color: #4CAF50;
            color: white;
            padding: 15px;
            text-decoration: none;
            border-radius: 8px;
            margin: 15px 0;
            font-size: 1.2em;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .button:hover {
            background-color: #45a049;
            transform: translateY(-3px);
        }

        .footer {
            margin-top: 30px;
            font-size: 0.9em;
            color: #555;
        }

        .footer a {
            color: #4CAF50;
            text-decoration: none;
        }

        .footer a:hover {
            color: #45a049;
        }

    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to the Hotel Management System</h1>
        <a href="viewRooms.jsp" class="button">View Rooms</a>
        <a href="addRoom.jsp" class="button">Add Room</a>
        <a href="viewGuests.jsp" class="button">Guest List</a>
        <div class="footer">
        </div>
    </div>
</body>
</html>
