import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/healthz")
public class HealthCheckServlet extends HttpServlet {

    // Default constructor
    public HealthCheckServlet() {
        super();
    }

    // Handling GET requests (health check)
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set HTTP response status to 200 OK
        response.setStatus(HttpServletResponse.SC_OK);

        // Optionally, you can add additional information like a response message
        response.getWriter().write("Service is healthy");
    }

    // Optional: If you want to support POST requests for health checks as well
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // In some cases, health checks might use POST
        doGet(request, response);  // Just forward POST to GET
    }
}
