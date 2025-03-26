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
public void init() throws ServletException {
    keywordResponses = new HashMap<>();
    keywordResponses.put("chào", "Xin chào! Tôi có thể hỗ trợ gì cho bạn hôm nay?");
    keywordResponses.put("thịnh hành", 
                         "Hiện tại, các dòng xe đang thịnh hành tại cửa hàng bao gồm BMW, Bentley, và Mercedes-Benz.");
    keywordResponses.put("giá", 
                         "Giá xe tại cửa hàng dao động từ 900 triệu VND đến 1,5 tỷ VND, tùy theo mẫu xe và trang bị.");
    keywordResponses.put("bảo hành", 
                         "Dạ có! Mỗi xe mua tại cửa hàng đều được bảo hành từ 3 đến 5 năm tùy theo hãng xe.");
    keywordResponses.put("trả góp", 
                         "Dạ có! Chúng tôi hỗ trợ trả góp với lãi suất ưu đãi, chỉ từ 0.6%/tháng.");
    keywordResponses.put("đặt xe", 
                         "Dạ được! Quý khách có thể đặt xe trước và nhận xe trong vòng 2-4 tuần tùy theo mẫu xe.");
    keywordResponses.put("cảm ơn", 
                         "Không có gì ạ! Nếu cần hỗ trợ thêm, cứ nhắn tin cho tôi nhé! 😊");
    keywordResponses.put("tạm biệt", 
                         "Cảm ơn bạn đã ghé thăm! Hẹn gặp lại bạn lần sau. 🚗💨");
    keywordResponses.put("còn xe bmw không", 
                         "Dạ, hiện tại cửa hàng vẫn có xe BMW trong kho. Bạn có thể đến xem và chọn mẫu xe phù hợp!");
    keywordResponses.put("giá khoảng bao nhiêu tiền", 
                         "Giá của các xe tại cửa hàng dao động từ 900 triệu VND đến 1,5 tỷ VND, tùy theo mẫu xe và trang bị.");
    keywordResponses.put("tôi muốn đặt một chiếc", 
                         "Dạ được! Bạn có thể cung cấp thông tin về mẫu xe bạn muốn đặt, và chúng tôi sẽ hỗ trợ bạn đặt xe ngay.");
}
    
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
