import java.sql.*;
import java.util.Scanner;

public class AdminBuyTicketService {

    public void adminBuyTicket(Connection conn, Scanner sc) {
        System.out.println("\n=== Admin Ticket Kiosk ===");

        try {
            // Ask for user info
            System.out.print("Enter admin email address: ");
            String emailAddress = sc.nextLine().trim();

            System.out.print("Enter password: ");
            String password = sc.nextLine().trim();

            if (!isValidAdmin(conn, emailAddress, password)) {
                System.out.println("Admin login failed.");
                return;
            }

            // Ask for ticket info
            System.out.print("Enter artist ID: ");
            int artistId = readInt(sc);

            System.out.print("Enter venue address: ");
            String address = sc.nextLine().trim();

            System.out.print("Enter concert date (YYYY-MM-DD): ");
            Date concertDate = readDate(sc);

            System.out.print("Enter section: ");
            String section = sc.nextLine().trim();

            System.out.print("Enter seat number: ");
            int seatNumber = readInt(sc);

            // Check that ticket exists
            if (!ticketExists(conn, artistId, address, concertDate, section, seatNumber)) {
                System.out.println("That ticket does not exist.");
                return;
            }

            // Check if the ticket has already been sold
            if (ticketAlreadySold(conn, artistId, address, concertDate, section, seatNumber)) {
                System.out.println("That ticket has already been sold.");
                return;
            }

            // Insert in-person purchase
            insertInPersonPurchase(conn, emailAddress, artistId, address, concertDate, section, seatNumber);

            System.out.println("Purchase successful.");

        } catch (SQLException e) {
            System.out.println("SQL error while buying ticket:");
            System.out.println("Code: " + e.getErrorCode());
            System.out.println("State: " + e.getSQLState());
            System.out.println(e.getMessage());
        }
    }

    private boolean isValidAdmin(Connection conn, String emailAddress, String password) throws SQLException {
        String sql =
                "SELECT 1 " +
                        "FROM Users u " +
                        "JOIN Admin a ON a.emailAddress = u.emailAddress " +
                        "WHERE u.emailAddress = ? AND u.password = ?";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, emailAddress);
            ps.setString(2, password);

            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        }
    }

    private boolean ticketExists(Connection conn, int artistId, String address, Date concertDate, String section, int seatNumber) throws SQLException {
        String sql =
                "SELECT 1 " +
                        "FROM Tickets " +
                        "WHERE artistId = ? " +
                        "  AND address = ? " +
                        "  AND concertDate = ? " +
                        "  AND section = ? " +
                        "  AND seatNumber = ?";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, artistId);
            ps.setString(2, address);
            ps.setDate(3, concertDate);
            ps.setString(4, section);
            ps.setInt(5, seatNumber);

            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        }
    }

    private boolean ticketAlreadySold(Connection conn, int artistId, String address, Date concertDate, String section, int seatNumber) throws SQLException {
        String sql =
                "SELECT 1 FROM online_purchase " +
                        "WHERE artistId = ? AND address = ? AND concertDate = ? AND section = ? AND seatNumber = ? " +
                        "UNION " +
                        "SELECT 1 FROM in_person_purchase " +
                        "WHERE artistId = ? AND address = ? AND concertDate = ? AND section = ? AND seatNumber = ?";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, artistId);
            ps.setString(2, address);
            ps.setDate(3, concertDate);
            ps.setString(4, section);
            ps.setInt(5, seatNumber);

            ps.setInt(6, artistId);
            ps.setString(7, address);
            ps.setDate(8, concertDate);
            ps.setString(9, section);
            ps.setInt(10, seatNumber);

            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        }
    }

    private void insertInPersonPurchase(Connection conn, String emailAddress, int artistId, String address, Date concertDate, String section, int seatNumber) throws SQLException {
        String sql =
                "INSERT INTO in_person_purchase " +
                        "(emailAddress, artistId, address, concertDate, section, seatNumber) " +
                        "VALUES (?, ?, ?, ?, ?, ?)";

        boolean oldAutoCommit = conn.getAutoCommit();
        conn.setAutoCommit(false);

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, emailAddress);
            ps.setInt(2, artistId);
            ps.setString(3, address);
            ps.setDate(4, concertDate);
            ps.setString(5, section);
            ps.setInt(6, seatNumber);

            ps.executeUpdate();
            conn.commit();
        } catch (SQLException e) {
            conn.rollback();
            throw e;
        } finally {
            conn.setAutoCommit(oldAutoCommit);
        }
    }

    private int readInt(Scanner sc) {
        while (true) {
            String line = sc.nextLine().trim();
            try {
                return Integer.parseInt(line);
            } catch (NumberFormatException e) {
                System.out.print("Please enter a valid integer: ");
            }
        }
    }

    private Date readDate(Scanner sc) {
        while (true) {
            String line = sc.nextLine().trim();
            try {
                return Date.valueOf(line);
            } catch (IllegalArgumentException e) {
                System.out.print("Please enter a valid date in YYYY-MM-DD format: ");
            }
        }
    }
}
