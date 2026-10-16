import java.sql.*;
import java.util.Scanner;

public class ConcertPro {
    // DB2 server URL
    private static final String URL = "jdbc:db2://winter2026-comp421.cs.mcgill.ca:50000/comp421";

    public static void main(String[] args) {
        String userId = System.getenv("SOCSUSER");
        String password = System.getenv("SOCSPASSWD");

        if (userId == null || password == null) {
            System.err.println("Error: missing SOCSUSER or SOCSPASSWD environment variable.");
            return;
        }

        // Register DB2 driver
        try {
            DriverManager.registerDriver(new com.ibm.db2.jcc.DB2Driver());
        } catch (Exception e) {
            System.err.println("Could not register DB2 driver.");
            System.err.println(e.getMessage());
            return;
        }

        // Create the feature-handler objects
        BuyTicketService buyTicketService = new BuyTicketService();
        AdminBuyTicketService adminBuyTicketService = new AdminBuyTicketService();
        AddFavArtistService addFavArtistService = new AddFavArtistService();
        ShowRecConcertsService showRecConcertsService = new ShowRecConcertsService();
        CreateAccountService createAccountService = new CreateAccountService();

        // Open the connection
        try (Connection conn = DriverManager.getConnection(URL, userId, password);
             Scanner sc = new Scanner(System.in)) {

            boolean running = true;

            while (running) {
                printMenu();
                String choice = sc.nextLine().trim();

                try {
                    switch (choice) {
                        case "1" : buyTicketService.buyTicket(conn, sc); break;
                        case "2" : adminBuyTicketService.adminBuyTicket(conn, sc); break;
                        case "3" : addFavArtistService.addArtist(conn, sc); break;
                        case "5" : createAccountService.createAccount(conn, sc); break;
                        case "4" : showRecConcertsService.showRecommendedConcerts(conn, sc); break;
                        case "6" : running = false; break;
                        default : System.out.println("Invalid option. Please choose 1 to 6.");
                    }
                } catch (SQLException e) {
                    System.out.println("SQL error:");
                    System.out.println("Code: " + e.getErrorCode());
                    System.out.println("State: " + e.getSQLState());
                    System.out.println(e.getMessage());
                } catch (NumberFormatException e) {
                    System.out.println("Invalid number format. Please enter numeric values where required.");
                } catch (Exception e) {
                    System.out.println("Unexpected error: " + e.getMessage());
                }
            }

            System.out.println("Goodbye.");

        } catch (SQLException e) {
            System.out.println("Could not connect to the database.");
            System.out.println("Code: " + e.getErrorCode());
            System.out.println("State: " + e.getSQLState());
            System.out.println(e.getMessage());
        }
    }

    private static void printMenu() {
        System.out.println();
        System.out.println("==== ConcertPro Main Menu ====");
        System.out.println("1. Buy Ticket");
        System.out.println("2. Admin Buy Ticket");
        System.out.println("3. Add Favourite Artist");
        System.out.println("4. Show Recommended Concerts");
        System.out.println("5. Create User Account");
        System.out.println("6. Quit");
        System.out.print("Select an option: ");
    }
}
