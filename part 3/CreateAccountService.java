import java.sql.*;
import java.util.Scanner;

public class CreateAccountService {

    public void createAccount(Connection conn, Scanner sc) {
        System.out.println("\n=== Create User Account ===");

        try {
            // Collect user info
            System.out.print("Enter email address: ");
            String emailAddress = sc.nextLine().trim();

            // Check if email already exists
            if (emailExists(conn, emailAddress)) {
                System.out.println("An account with that email already exists.");
                return;
            }

            System.out.print("Enter password: ");
            String password = sc.nextLine().trim();

            System.out.println("Account type:");
            System.out.println("  1. Regular User");
            System.out.println("  2. Admin");
            System.out.print("Select account type: ");
            String typeChoice = sc.nextLine().trim();

            boolean isAdmin;
            if (typeChoice.equals("1")) {
                isAdmin = false;
            } else if (typeChoice.equals("2")) {
                isAdmin = true;
            } else {
                System.out.println("Invalid account type.");
                return;
            }

            // Insert into Users and the appropriate sub-table
            insertUser(conn, emailAddress, password, isAdmin);

            System.out.println("Account created successfully.");

            // Offer to add favourite genres (sub-menu from DB query)
            System.out.print("Would you like to add favourite genres? (y/n): ");
            String ans = sc.nextLine().trim();

            if (ans.equalsIgnoreCase("y")) {
                addFavouriteGenres(conn, sc, emailAddress);
            }

        } catch (SQLException e) {
            System.out.println("SQL error while creating account:");
            System.out.println("Code: " + e.getErrorCode());
            System.out.println("State: " + e.getSQLState());
            System.out.println(e.getMessage());
        }
    }

    private boolean emailExists(Connection conn, String emailAddress) throws SQLException {
        String sql = "SELECT 1 FROM Users WHERE emailAddress = ?";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, emailAddress);

            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        }
    }

    private void insertUser(Connection conn, String emailAddress, String password, boolean isAdmin) throws SQLException {
        boolean oldAutoCommit = conn.getAutoCommit();
        conn.setAutoCommit(false);

        try {
            // Insert into Users
            String userSql = "INSERT INTO Users (emailAddress, password) VALUES (?, ?)";
            try (PreparedStatement ps = conn.prepareStatement(userSql)) {
                ps.setString(1, emailAddress);
                ps.setString(2, password);
                ps.executeUpdate();
            }

            // Insert into RegularUser or Admin
            String subSql;
            if (isAdmin) {
                subSql = "INSERT INTO Admin (emailAddress) VALUES (?)";
            } else {
                subSql = "INSERT INTO RegularUser (emailAddress) VALUES (?)";
            }
            try (PreparedStatement ps = conn.prepareStatement(subSql)) {
                ps.setString(1, emailAddress);
                ps.executeUpdate();
            }

            conn.commit();
        } catch (SQLException e) {
            conn.rollback();
            throw e;
        } finally {
            conn.setAutoCommit(oldAutoCommit);
        }
    }

    private void addFavouriteGenres(Connection conn, Scanner sc, String emailAddress) throws SQLException {
        // Query all genres from DB to build a sub-menu
        String sql = "SELECT genreName FROM Genre ORDER BY genreName";

        try (PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            // Load genres into an array for menu display
            java.util.List<String> genres = new java.util.ArrayList<>();
            while (rs.next()) {
                genres.add(rs.getString("genreName"));
            }

            if (genres.isEmpty()) {
                System.out.println("No genres available in the database.");
                return;
            }

            boolean adding = true;
            while (adding) {
                System.out.println("\n--- Available Genres ---");
                for (int i = 0; i < genres.size(); i++) {
                    System.out.println("  " + (i + 1) + ". " + genres.get(i));
                }
                System.out.println("  0. Done");
                System.out.print("Select a genre to add: ");

                String input = sc.nextLine().trim();
                int idx;
                try {
                    idx = Integer.parseInt(input);
                } catch (NumberFormatException e) {
                    System.out.println("Please enter a valid number.");
                    continue;
                }

                if (idx == 0) {
                    adding = false;
                } else if (idx < 1 || idx > genres.size()) {
                    System.out.println("Invalid selection.");
                } else {
                    String genreName = genres.get(idx - 1);
                    insertFavouriteGenre(conn, emailAddress, genreName);
                }
            }
        }
    }

    private void insertFavouriteGenre(Connection conn, String emailAddress, String genreName) throws SQLException {
        // Check if already a favourite
        String checkSql = "SELECT 1 FROM favourite_genre WHERE emailAddress = ? AND genreName = ?";
        try (PreparedStatement ps = conn.prepareStatement(checkSql)) {
            ps.setString(1, emailAddress);
            ps.setString(2, genreName);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    System.out.println("'" + genreName + "' is already in your favourites.");
                    return;
                }
            }
        }

        String sql = "INSERT INTO favourite_genre (emailAddress, genreName) VALUES (?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, emailAddress);
            ps.setString(2, genreName);
            ps.executeUpdate();
            System.out.println("Added '" + genreName + "' to your favourites.");
        }
    }
}
