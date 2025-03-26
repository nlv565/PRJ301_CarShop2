Cấu trúc thư mục

CarShop/
│── build/                  # Thư mục chứa các tệp build (NetBeans tự động tạo)
│── lib/                    # Thư viện bên ngoài (JAR files)
│── nbproject/              # Cấu hình dự án trong NetBeans (XML files)
│── src/                    # Mã nguồn chính
│   ├── conf/               # Cấu hình ứng dụng (database, logging, v.v.)
│   ├── java/               # Chứa mã nguồn Java chính
│   │   ├── cart/           # Xử lý giỏ hàng
│   │   │   ├── Cart.java               # Đối tượng giỏ hàng
│   │   │   ├── CartItem.java            # Chi tiết từng sản phẩm trong giỏ
│   │   ├── category/       # Quản lý danh mục sản phẩm
│   │   │   ├── Category.java            # Lớp danh mục sản phẩm
│   │   │   ├── CategoryDAO.java         # Truy vấn dữ liệu danh mục
│   │   ├── controller/     # Xử lý yêu cầu HTTP (Servlets)
│   │   │   ├── AddToCartServlet.java    # Thêm sản phẩm vào giỏ hàng
│   │   │   ├── CancelOrderServlet.java  # Hủy đơn hàng
│   │   │   ├── CheckoutServlet.java     # Xử lý thanh toán
│   │   │   ├── DispatchServlet.java     # Điều hướng request
│   │   │   ├── GetCartServlet.java      # Lấy dữ liệu giỏ hàng
│   │   │   ├── GetProductList.java      # Lấy danh sách sản phẩm
│   │   │   ├── LoginServlet.java        # Xử lý đăng nhập
│   │   │   ├── LogoutServlet.java       # Xử lý đăng xuất
│   │   │   ├── SignupServlet.java       # Xử lý đăng ký tài khoản
│   │   │   ├── UpdateQuantityCartServlet.java  # Cập nhật số lượng trong giỏ
│   │   ├── order/          # Quản lý đơn hàng
│   │   │   ├── Order.java               # Đối tượng đơn hàng
│   │   │   ├── OrderDAO.java            # Truy vấn dữ liệu đơn hàng
│   │   ├── orderdetail/    # Chi tiết đơn hàng
│   │   │   ├── OrderDetail.java         # Đối tượng chi tiết đơn hàng
│   │   │   ├── OrderDetailDAO.java      # Truy vấn chi tiết đơn hàng
│   │   ├── product/        # Quản lý sản phẩm
│   │   │   ├── Product.java             # Đối tượng sản phẩm
│   │   │   ├── ProductDAO.java          # Truy vấn dữ liệu sản phẩm
│   │   ├── user/           # Quản lý người dùng
│   │   │   ├── User.java                # Đối tượng người dùng
│   │   │   ├── UserDAO.java             # Truy vấn dữ liệu người dùng
│   │   ├── util/           # Các lớp tiện ích hỗ trợ
│   │   │   ├── DBConnection.java        # Kết nối cơ sở dữ liệu SQL Server
│   │   │   ├── HashUtil.java            # Mã hóa mật khẩu
│── web/                    # Thư mục giao diện người dùng (JSP, CSS, JS)
│   ├── assets/             # Chứa tài nguyên như hình ảnh, CSS, JavaScript
│   │   ├── css/            # Các tệp CSS cho giao diện
│   │   ├── js/             # Các tệp JavaScript hỗ trợ
│   ├── pages/              # Trang JSP chính của website
│   │   ├── home.jsp        # Trang chủ
│   │   ├── login.jsp       # Trang đăng nhập
│   │   ├── signup.jsp      # Trang đăng ký
│   │   ├── cart.jsp        # Trang giỏ hàng
│   │   ├── checkout.jsp    # Trang thanh toán
│   │   ├── order.jsp       # Trang xem đơn hàng
│   │   ├── product.jsp     # Trang sản phẩm chi tiết
│── build.xml               # File cấu hình build của NetBeans
