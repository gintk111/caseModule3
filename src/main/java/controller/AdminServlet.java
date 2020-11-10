package controller;

import model.Category;
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

@WebServlet(name = "AdminServlet",urlPatterns = "/admin")
public class AdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ShopSevice shopSevice;

    public void init() {
        shopSevice = new ShopSevice();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "insert":
                    insertCustomer(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "insert" :
                    insertProduct(request, response);
                    break;
                default:
                    showAdmin(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }
    private void showAdmin(HttpServletRequest request, HttpServletResponse response)throws SQLException, IOException, ServletException  {
        List<Trademark> trademarks = shopSevice.selectAllTrademark();
        List<Group> groups = shopSevice.selectAllGroup();
        String group = request.getParameter("group");
        String trade = request.getParameter("trade");

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

        request.setAttribute("key", key);
        request.setAttribute("page", page);
        request.setAttribute("firstpage", firstpage);
        request.setAttribute("strNext", strNext);
        request.setAttribute("strNext1", strNext1);
        request.setAttribute("strPreviousPage", strPreviousPage);
        request.setAttribute("strTotalPage", strTotalPage);
        List<Product> products = shopSevice.selectAllProductsAdmin(key,group,trade,strStart);
        request.setAttribute("products", products);
        request.setAttribute("trademarks", trademarks);
        request.setAttribute("groups", groups);
        request.setAttribute("group", group);
        request.setAttribute("trade", trade);
        RequestDispatcher dispatcher = request.getRequestDispatcher("admin/index.jsp");
        dispatcher.forward(request, response);
    }

    private void insertProduct(HttpServletRequest request, HttpServletResponse response)throws SQLException, IOException, ServletException  {
        List<Group> groups = shopSevice.selectAllGroup();
        List<Trademark> trademarks = shopSevice.selectTrademark();
        List<Category> categories = shopSevice.selectAllCategory();

        request.setAttribute("groups", groups);
        request.setAttribute("trademarks", trademarks);
        request.setAttribute("categories", categories);

        RequestDispatcher dispatcher = request.getRequestDispatcher("admin/insert.jsp");
        dispatcher.forward(request, response);
    }

    private void insertCustomer(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        String name = request.getParameter("name");
        int group_id = Integer.parseInt(request.getParameter("group"));
        int cat_id = Integer.parseInt(request.getParameter("cat"));
        int trademark_id = Integer.parseInt(request.getParameter("group"));
        float unit = Float.parseFloat(request.getParameter("unit"));
        float promo = Float.parseFloat(request.getParameter("promotion"));
        int pr_new = Integer.parseInt(request.getParameter("new"));
        String image1 = request.getParameter("image1");
        String image2 = request.getParameter("image2");
        String image3 = request.getParameter("image3");
        String image4 = request.getParameter("image4");
        String des1 = request.getParameter("des1");
        String des2 = request.getParameter("des2");
        String des3 = request.getParameter("des3");
        String des4 = request.getParameter("des4");

        Product product = new Product(name,cat_id,trademark_id,group_id,des1,des2,des3,des4,pr_new,unit,promo,image1,image2,image3,image4);
        shopSevice.insertProduct(product);
        RequestDispatcher dispatcher = request.getRequestDispatcher("admin/insert.jsp");
        request.setAttribute("message", "Insert successfully");
        dispatcher.forward(request, response);
    }
}
