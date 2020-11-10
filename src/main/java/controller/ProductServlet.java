package controller;

import model.Group;
import model.Product;
import model.Trademark;
import service.ShopSevice;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ProductServlet",urlPatterns = "/product_details")
public class ProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ShopSevice shopSevice;

    public void init() {
        shopSevice = new ShopSevice();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                default:
                    product_details(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void product_details(HttpServletRequest request, HttpServletResponse response)throws SQLException, IOException, ServletException  {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = shopSevice.selectProduct(id);
        int selectID = product.getCat_id();
        List<Product> product1 = shopSevice.selectProduct1(selectID);
        request.setAttribute("product", product);
        request.setAttribute("product1", product1);
        RequestDispatcher dispatcher = request.getRequestDispatcher("shop/details.jsp");
        dispatcher.forward(request, response);
    }
}
