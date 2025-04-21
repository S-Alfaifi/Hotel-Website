package dao;

import model.Guest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class GuestDAO {
    public List<Guest> getAllGuests() throws Exception {
        String query = "SELECT * FROM bookings"; 
        List<Guest> guestList = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Guest guest = new Guest();
                guest.setId(rs.getInt("id"));
                guest.setName(rs.getString("guest_name"));
                guest.setRoomNumber(rs.getString("room_number"));
                guest.setBookingDate(rs.getDate("booking_date").toString());
                guestList.add(guest);
            }
        }
        return guestList;
    }
}
