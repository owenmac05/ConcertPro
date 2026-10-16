import java.sql.*;
import java.util.Scanner;

public class ShowRecConcertsService {

    public void showRecommendedConcerts(Connection conn, Scanner sc) throws SQLException {

        // Display method info and request a user email address
        displayInfo();
        String userEmailAddress = sc.nextLine().trim();

        // Check if userEmailAddress exists in the database
        // Format check SQL query using ? instead of userEmailAddress
        String checkQuery = "SELECT emailAddress FROM Users WHERE emailAddress = ?";

        // Create check prepared statement and set variable to userEmailAddress (prevents SQL injection)
        PreparedStatement checkStatement = conn.prepareStatement(checkQuery);
        checkStatement.setString(1, userEmailAddress);

        // Execute query and return if no user is found with this email address in the database
        ResultSet checkResultSet = checkStatement.executeQuery();
        if (!checkResultSet.next()) {
            System.out.println("\nNo user found with this email address.");
            checkStatement.close();
            return;
        }
        checkStatement.close();

        // Format recommendation SQL query using ? instead of userEmailAddress
        String recommendationQuery = "SELECT DISTINCT A.name, C.address, C.concertDate FROM concert C, Artist A " +
                "WHERE C.artistId = A.artistId AND (" +
                "C.artistId IN (SELECT artistId FROM favourite_artist WHERE emailAddress = ?) " +
                "OR C.artistId IN (SELECT G.artistId FROM artist_genre G, favourite_genre F " +
                "WHERE G.genreName = F.genreName AND F.emailAddress = ?)) " +
                "ORDER BY C.concertDate, A.name";

        // Create recommendation prepared statement and set variables to userEmailAddress (prevents SQL injection)
        PreparedStatement recommendationStatement = conn.prepareStatement(recommendationQuery);
        recommendationStatement.setString(1, userEmailAddress);
        recommendationStatement.setString(2, userEmailAddress);

        // Display recommendation query with input userEmailAddress
        System.out.println("\nSQL Query: ");
        System.out.println(recommendationQuery.replace("?", "'" + userEmailAddress + "'"));

        // Execute recommendation query and display result set
        ResultSet recommendationResultSet = recommendationStatement.executeQuery();
        System.out.println("\nList of concerts: ");
        boolean hasResults = false; // Track if resulting table has records
        while (recommendationResultSet.next()) {
            hasResults = true;
            String name = recommendationResultSet.getString(1);
            String venue = recommendationResultSet.getString(2);
            String date = recommendationResultSet.getString(3);
            System.out.println();
            System.out.println ("Artist: " + name);
            System.out.println ("Venue: " + venue);
            System.out.println ("Date: " + date);
        }
        if (hasResults) {
            System.out.println("\nDONE.");
        } else {
            System.out.println("\nUser exists but has no recommended concerts.");
        }

        recommendationStatement.close();
    }

    private static void displayInfo() {
        System.out.println("\nShow recommended concerts for a specific user\ndepending on the user's favourite artists and genres.");
        System.out.println("\nEnter user email address: ");
    }

}
