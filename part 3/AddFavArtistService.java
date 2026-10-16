import java.sql.*;
import java.util.Scanner;

public class AddFavArtistService {

    public void addArtist(Connection conn, Scanner sc) throws SQLException {
        displayInfo();

        String email = sc.nextLine().trim();

        System.out.print("Enter artist ID: ");
        int artistId = Integer.parseInt(sc.nextLine().trim());

        String sql = "INSERT INTO favourite_artist (emailAddress, artistId) VALUES (?, ?)";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);
            stmt.setInt(2, artistId);

            int rows = stmt.executeUpdate();

            if (rows > 0) {
                System.out.println("Favourite artist added successfully.");
            } else {
                System.out.println("No row inserted.");
            }
        }
    }

    private static void displayInfo() {
        System.out.println("\nAdd Favourite Artist");
        System.out.print("Enter user email address: ");
    }
}
