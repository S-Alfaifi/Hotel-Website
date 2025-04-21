<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Room</title>
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
            width: 350px; /* Reduced the width for a more compact layout */
        }

        h2 {
            color: #4CAF50;
            text-align: center;
            font-size: 1.8em;
        }

        label {
            font-size: 1em;
            margin-bottom: 5px;
            display: block;
        }

        input, select {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px; /* Reduced margin to make the form more compact */
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 1em;
        }

        button {
            width: 100%;
            padding: 8px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 1.1em;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }

        .back-link {
            text-align: center;
            margin-top: 10px;
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
        <h2>Add a New Room</h2>
        <form action="AddRoomServlet" method="post">
            <label for="roomNumber">Room Number:</label>
            <input type="text" id="roomNumber" name="roomNumber" required>

            <label for="roomType">Room Type:</label>
            <input type="text" id="roomType" name="roomType" required>

            <label for="availability">Availability:</label>
            <select id="availability" name="availability">
                <option value="true">Available</option>
                <option value="false">Occupied</option>
            </select>

            <button type="submit">Add Room</button>
        </form>
        <div class="back-link">
            <p><a href="index.jsp">Back to Main</a></p>
        </div>
    </div>
</body>
</html>
