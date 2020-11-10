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
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "Shop", urlPatterns = "")
public class Shop extends HttpServlet {
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
                    homeShop(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void homeShop(HttpServletRequest request, HttpServletResponse response)throws SQLException, IOException, ServletException  {
        List<Group> groups = shopSevice.selectAllGroup();
        List<Trademark> trademarks = shopSevice.selectTrademark();
        List<Product> laptops = shopSevice.selectLaptop();
        List<Product> mouses = shopSevice.selectMouse();
        List<Product> items = shopSevice.slectItem();
        List<Product> vanphong = shopSevice.selectVp();
        List<Product> manhinh = shopSevice.selectManhinh();
        List<Product> pc = shopSevice.selectPc();
        List<Trademark> allTrademark = shopSevice.selectAllTrademark();
        request.setAttribute("laptops", laptops);
        request.setAttribute("pc", pc);
        request.setAttribute("manhinh", manhinh);
        request.setAttribute("vanphong", vanphong);
        request.setAttribute("mouses", mouses);
        request.setAttribute("items", items);
        request.setAttribute("groups", groups);
        request.setAttribute("trademarks", trademarks);
        request.setAttribute("allTrademark", allTrademark);
        RequestDispatcher dispatcher = request.getRequestDispatcher("shop/index.jsp");
        dispatcher.forward(request, response);
    }


}
