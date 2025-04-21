package dao;

import model.Room;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Booking;

public class RoomDAO {
    public List<Room> getAllRooms() throws SQLException {
        List<Room> rooms = new ArrayList<>();
        String query = "SELECT * FROM rooms";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Room room = new Room();
                room.setRoomId(rs.getInt("room_id"));
                room.setRoomNumber(rs.getString("room_number"));
                room.setRoomType(rs.getString("room_type"));
                room.setAvailable(rs.getBoolean("is_available"));
                rooms.add(room);
            }
        }
        return rooms;
    }
        public boolean addRoom(Room room) throws Exception {
        String query = "INSERT INTO rooms (room_number, room_type, is_available) VALUES (?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, room.getRoomNumber());
            stmt.setString(2, room.getRoomType());
            stmt.setBoolean(3, room.isAvailable());
            return stmt.executeUpdate() > 0; 
        }
    }
public boolean deleteRoom(String roomNumber) throws Exception {
    String deleteRoomQuery = "DELETE FROM rooms WHERE room_number = ?";

    try (Connection conn = DBConnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement(deleteRoomQuery)) {

        stmt.setString(1, roomNumber);
        return stmt.executeUpdate() > 0;
    }
}

                public boolean bookRoom(String roomNumber) throws Exception {
        String query = "UPDATE rooms SET is_available = false WHERE room_number = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, roomNumber);
            return stmt.executeUpdate() > 0; // Return true if a row is updated
        }
    }
 public boolean removeBooking(String roomNumber) throws Exception {
        String deleteBookingQuery = "DELETE FROM bookings WHERE room_number = ?";
        String updateRoomQuery = "UPDATE rooms SET is_available = true WHERE room_number = ?";

        try (Connection conn = DBConnection.getConnection()) {
            // Delete from bookings table
            try (PreparedStatement deleteStmt = conn.prepareStatement(deleteBookingQuery)) {
                deleteStmt.setString(1, roomNumber);
                int bookingDeleted = deleteStmt.executeUpdate();

                // Update room availability
                if (bookingDeleted > 0) {
                    try (PreparedStatement updateStmt = conn.prepareStatement(updateRoomQuery)) {
                        updateStmt.setString(1, roomNumber);
                        return updateStmt.executeUpdate() > 0;
                    }
                }
            }
        }
        return false;
    }
                public boolean saveBooking(Booking booking) throws Exception {
        String insertBookingQuery = "INSERT INTO bookings (room_number, guest_name, contact) VALUES (?, ?, ?)";
        String updateRoomQuery = "UPDATE rooms SET is_available = false WHERE room_number = ?";

        try (Connection conn = DBConnection.getConnection()) {
            // Insert into bookings table
            try (PreparedStatement bookingStmt = conn.prepareStatement(insertBookingQuery)) {
                bookingStmt.setString(1, booking.getRoomNumber());
                bookingStmt.setString(2, booking.getGuestName());
                bookingStmt.setString(3, booking.getContact());
                int bookingInserted = bookingStmt.executeUpdate();

                // Update room availability
                if (bookingInserted > 0) {
                    try (PreparedStatement roomStmt = conn.prepareStatement(updateRoomQuery)) {
                        roomStmt.setString(1, booking.getRoomNumber());
                        return roomStmt.executeUpdate() > 0;
                    }
                }
            }
        }
        return false;
    }
                public boolean hasBooking(String roomNumber) throws Exception {
    String checkBookingQuery = "SELECT COUNT(*) FROM bookings WHERE room_number = ?";

    try (Connection conn = DBConnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement(checkBookingQuery)) {

        stmt.setString(1, roomNumber);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        }
    }
    return false;
}

}
