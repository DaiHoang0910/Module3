<%--
  Created by IntelliJ IDEA.
  User: theon
  Date: 04/12/2024
  Time: 11:00 SA
  To change this template use File | Settings | File Templates.
--%>
<section class="product-section py-5">
  <div class="container">
    <h2 class="text-center mb-5">Sản Phẩm Nổi Bật</h2>
    <div class="row g-4">
      <%-- Mô phỏng sản phẩm động --%>
      <%
        String[][] products = {
                {"Camera IP Wifi", "1.200.000 VNĐ", "Giám sát 24/7", "https://via.placeholder.com/200"},
                {"Camera Hành Trình", "2.500.000 VNĐ", "Ghi lại hành trình của bạn", "https://via.placeholder.com/200"},
                {"Camera Giám Sát", "3.000.000 VNĐ", "Độ phân giải cao", "https://via.placeholder.com/200"}
        };
        for (String[] product : products) {
      %>
      <div class="col-md-4">
        <div class="card">
          <img src="<%= product[3] %>" class="card-img-top" alt="<%= product[0] %>">
          <div class="card-body text-center">
            <h5 class="card-title"><%= product[0] %></h5>
            <p class="card-text"><%= product[2] %></p>
            <p class="text-primary fw-bold"><%= product[1] %></p>
          </div>
        </div>
      </div>
      <% } %>
    </div>
  </div>
</section>

