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

@WebServlet(name = "StoreServlet",urlPatterns = "/store")
public class StoreServlet extends HttpServlet {
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
                    storeShow(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }
    private void storeShow(HttpServletRequest request, HttpServletResponse response)throws SQLException, IOException, ServletException  {
        String trade = request.getParameter("trade");
        String group = request.getParameter("group");
        String key = request.getParameter("key");
        String page = request.getParameter("page");
        if (trade == "") {
            trade = null;
        }
        if (group == ""){
            group = null;
        }
        if (page == null){
            page = "";
        }
        if (page == "") {
            page = "1";
        }
        int totalRow = shopSevice.coutRow();
        int totalPage = 0;
        double douTotal = totalRow * 1.0 /12;
        totalPage = (int) Math.ceil(douTotal);
        int start = (Integer.parseInt(page) - 1) * 12;
        int nextpage = Integer.parseInt(page) + 1;
        int nextpage1 = nextpage + 1;
        int previousPage = Integer.parseInt(page) - 1;

        String firstpage = " 1 ";
        String strStart = Integer.toString(start);
        String strNext = Integer.toString(nextpage);
        String strNext1 = Integer.toString(nextpage1);
        String strPreviousPage = Integer.toString(previousPage);
        String strTotalPage = Integer.toString(totalPage);

        List<Product> products = shopSevice.selectAllProducts(trade,group,key,page,strStart);
        List<Trademark> trademarks = shopSevice.selectAllTrademark();
        List<Group> groups = shopSevice.selectAllGroup();

        request.setAttribute("trade", trade);
        request.setAttribute("group", group);
        request.setAttribute("key", key);
        request.setAttribute("page", page);
        request.setAttribute("firstpage", firstpage);
        request.setAttribute("strNext", strNext);
        request.setAttribute("strNext1", strNext1);
        request.setAttribute("strPreviousPage", strPreviousPage);
        request.setAttribute("strTotalPage", strTotalPage);

        request.setAttribute("products", products);
        request.setAttribute("products", products);
        request.setAttribute("trademarks", trademarks);
        request.setAttribute("groups", groups);
        RequestDispatcher dispatcher = request.getRequestDispatcher("shop/store.jsp");
        dispatcher.forward(request, response);
    }
}
