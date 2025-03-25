package chatbot;


import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/chatbot")
public class ChatbotServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private Map<String, String> keywordResponses;

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String userMessage = request.getParameter("message").trim().toLowerCase();
        String botResponse = "Xin lỗi, tôi chưa hiểu câu hỏi của bạn. Bạn có thể hỏi lại theo cách khác không?";

        // Ki?m tra t?ng t? kh�a trong tin nh?n c?a ng�?i d�ng
        for (Map.Entry<String, String> entry : keywordResponses.entrySet()) {
            if (userMessage.contains(entry.getKey())) {
                botResponse = entry.getValue();
                break;
            }
        }

        response.setContentType("text/plain");
        response.getWriter().write(botResponse);
    }
}
