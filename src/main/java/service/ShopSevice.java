package service;

import model.Category;
import model.Group;
import model.Product;
import model.Trademark;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ShopSevice {
    private final static String jdbcURL = "jdbc:mysql://localhost:3306/shop?useSSL=false";
    private final static String jdbcUsername = "root";
    private final static String jdbcPassword = "02031997";

    private static final String SELECT_ALL_PRODUCTS = "SELECT products.id, products.product_name,products.cat_id,products.trademark_id,products.group_id,products.description1,products.description2,products.description3,products.description4,products.image1,products.image2,products.image3,products.image4,products.new,products.created_at,products.update_at,products.unit_price,products.promotion_price, category.cat_name, trademark.trademark_name FROM shop.products join category on products.cat_id = category.cat_id join trademark on products.trademark_id = trademark.trademark_id ";
    private static final String SELECT_ALL_GROUPS = "select * from group_pr";
    private static final String SELECT_COUT_ROW = "SELECT COUNT(*) FROM products ;";
    private static final String SELECT_TRADEMARKS = "select * from trademark where show_web = 1 ";
    private static final String SELECT_LAPTOPS = "select * from products where group_id = 10 ";
    private static final String SELECT_MOUSER = "select * from products where group_id = 14 ";
    private static final String SELECT_ICON = "select * from products where group_id = 12 ";
    private static final String SELECT_VP = "select * from products where group_id = 16 limit 4 ";
    private static final String SELECT_MH = "select * from products where group_id = 13 limit 4";
    private static final String SELECT_PC = "select * from products where group_id = 11 limit 4 ";
    private static final String SELECT_TRADE = "select trademark_id, trademark_name from trademark ";
    private static final String SELECT_CATEGORY = "select cat_id, cat_name from category ";
    private static final String SELECT_PRODUCT_BY_ID = "SELECT products.id, products.product_name,products.cat_id,products.trademark_id,products.group_id,products.description1,products.description2,products.description3,products.description4,products.image1,products.image2,products.image3,products.image4,products.new,products.created_at,products.update_at,products.unit_price,products.promotion_price, category.cat_name, trademark.trademark_name FROM shop.products join category on products.cat_id = category.cat_id join trademark on products.trademark_id = trademark.trademark_id where products.id = ?; ";
    private static final String SELECT_PRODUCT_LIKE_CAT_ID = "SELECT products.id, products.product_name,products.cat_id,products.trademark_id,products.group_id,products.description1,products.description2,products.description3,products.description4,products.image1,products.image2,products.image3,products.image4,products.new,products.created_at,products.update_at,products.unit_price,products.promotion_price, category.cat_name, trademark.trademark_name FROM shop.products join category on products.cat_id = category.cat_id join trademark on products.trademark_id = trademark.trademark_id where products.cat_id = ?; ";
    private static final String INSERT_PRODUCT_SQL = "INSERT INTO products" + "(product_name,cat_id,trademark_id,group_id,description1,description2,description3,description4,new,unit_price,promotion_price,image1,image2,image3,image4) VALUES " + "(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    public ShopSevice() {
    }

    protected static Connection getConnection() {
        Connection connection = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public void insertProduct(Product product) {
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PRODUCT_SQL);
            preparedStatement.setString(1, product.getProduct_name());
            preparedStatement.setInt(2, product.getCat_id());
            preparedStatement.setInt(3, product.getTrademark_id());
            preparedStatement.setInt(4, product.getGroup_id());
            preparedStatement.setString(5, product.getDescription1());
            preparedStatement.setString(6, product.getDescription2());
            preparedStatement.setString(7, product.getDescription3());
            preparedStatement.setString(8, product.getDescription4());
            preparedStatement.setInt(9, product.getProduct_new());
            preparedStatement.setFloat(10,product.getUnit_price());
            preparedStatement.setFloat(11,product.getPromotion_price());
            preparedStatement.setString(12,product.getImage1());
            preparedStatement.setString(13,product.getImage2());
            preparedStatement.setString(14,product.getImage3());
            preparedStatement.setString(15,product.getImage4());
            preparedStatement.executeUpdate();
        }catch (SQLException e) {
            printSQLException(e);
        }
    }

    public  List<Category> selectAllCategory () {
        List<Category> categories = new ArrayList<>();
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CATEGORY);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int cat_id = rs.getInt("cat_id");
                String cat_name = rs.getString("cat_name");
                categories.add(new Category(cat_id,cat_name));
            }
        }catch (SQLException e) {
            printSQLException(e);
        }
        return categories;
    }

    public List<Product> selectAllProductsAdmin(String key, String group,String trade, String start) {
        List<Product> products = new ArrayList<>();
        String where = "";
        if (key == ""){
            key = null;
        }
        if (trade != null) {
            where += " products.trademark_id = " + trade;
        }
        if (group != null) {
            if (where != "") {
                where += " AND products.group_id = " + group;
            } else {
                where += " products.group_id = " + group;
            }
        }
        if (key != null) {
            if (where != "") {
                where += " AND products.product_name like " + " %"+key+"%";
            } else {
                where += " products.product_name like " + " '" +"%"+key+"%'";
            }
        }
        try {
            Connection connection = getConnection();
            if (where != ""){
                where = " WHERE" + where;
            }else {
                where = "";
            }

            System.out.println(where);
            String limit = "10";
            String strOderBy = " ORDER BY id DESC LIMIT ";
            String strWhere = SELECT_ALL_PRODUCTS + where + strOderBy + " " + start + " , "+ limit ;
            PreparedStatement preparedStatement = connection.prepareStatement(strWhere);
            ResultSet rs = preparedStatement.executeQuery();
            System.out.println(strWhere);

            while (rs.next()) {
                int product_id = rs.getInt("products.id");
                String product_name = rs.getString("products.product_name");
                int cat_id = rs.getInt("products.cat_id");
                int trademark_id = rs.getInt("products.trademark_id");
                int group_id = rs.getInt("products.group_id");
                String des1 = rs.getString("products.description1");
                String des2 = rs.getString("products.description2");
                String des3 = rs.getString("products.description3");
                String des4 = rs.getString("products.description4");
                String image1 = rs.getString("products.image1");
                String image2 = rs.getString("products.image2");
                String image3 = rs.getString("products.image3");
                String image4 = rs.getString("products.image4");
                int pr_new = rs.getInt("products.new");
                String created_at = rs.getString("products.created_at");
                String update_at = rs.getString("products.update_at");
                float unit_price = Float.parseFloat(String.valueOf(rs.getInt("products.unit_price")));
                float promotion_price = Float.parseFloat(String.valueOf(rs.getInt("products.promotion_price")));
                String cat_name = rs.getString("category.cat_name");
                String trade_name  = rs.getString("trademark.trademark_name");
                products.add(new Product(product_id,product_name,cat_id,trademark_id,group_id,des1,des2,des3,des4,pr_new,unit_price,promotion_price,image1,image2,image3,image4,created_at,update_at,trade_name,cat_name));
            }
        }catch (SQLException e) {
            printSQLException(e);
        }
        return products;
    }

    public List<Product> selectAllProducts(String trade,String group,String key,String page,String start ) {
        List<Product> products = new ArrayList<>();
        String where = "";
        if (key == ""){
            key = null;
        }
        if (trade != null) {
            where += " products.trademark_id = " + trade;
        }
        if (group != null) {
            if (where != "") {
                where += " AND products.group_id = " + group;
            } else {
                where += " products.group_id = " + group;
            }
        }
        if (key != null) {
            if (where != "") {
                where += " AND products.product_name like " + " %"+key+"%";
            } else {
                where += " products.product_name like " + " '" +"%"+key+"%'";
            }
        }
        try {
            Connection connection = getConnection();
            if (where != ""){
                where = " WHERE" + where;
            }else {
                where = "";
            }
            String limit = "12";
            String strOderBy = " ORDER BY id DESC LIMIT ";
            String strWhere = SELECT_ALL_PRODUCTS + where + strOderBy + " " + start + " , " + limit ;
            System.out.println(strWhere);
            PreparedStatement preparedStatement = connection.prepareStatement(strWhere);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int product_id = rs.getInt("products.id");
                String product_name = rs.getString("products.product_name");
                int cat_id = rs.getInt("products.cat_id");
                int trademark_id = rs.getInt("products.trademark_id");
                int group_id = rs.getInt("products.group_id");
                String des1 = rs.getString("products.description1");
                String des2 = rs.getString("products.description2");
                String des3 = rs.getString("products.description3");
                String des4 = rs.getString("products.description4");
                String image1 = rs.getString("products.image1");
                String image2 = rs.getString("products.image2");
                String image3 = rs.getString("products.image3");
                String image4 = rs.getString("products.image4");
                int pr_new = rs.getInt("products.new");
                String created_at = rs.getString("products.created_at");
                String update_at = rs.getString("products.update_at");
                float unit_price = Float.parseFloat(String.valueOf(rs.getInt("products.unit_price")));
                float promotion_price = Float.parseFloat(String.valueOf(rs.getInt("products.promotion_price")));
                String cat_name = rs.getString("category.cat_name");
                String trade_name  = rs.getString("trademark.trademark_name");
                products.add(new Product(product_id,product_name,cat_id,trademark_id,group_id,des1,des2,des3,des4,pr_new,unit_price,promotion_price,image1,image2,image3,image4,created_at,update_at,trade_name,cat_name));
            }
        }catch (SQLException e) {
            printSQLException(e);
        }
        return products;
    }

    public int coutRow() {
        int row = 0;
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_COUT_ROW);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                row = rs.getInt("COUNT(*)");
            }
        }catch (SQLException e) {
            printSQLException(e);
        }
        return row;
    }

    public List<Trademark> selectAllTrademark() {
        List<Trademark> trademarks = new ArrayList<>();
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_TRADE);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("trademark_id");
                String trade_name = rs.getString("trademark_name");
                trademarks.add(new Trademark(id,trade_name));
            }
        }catch (SQLException e) {
            printSQLException(e);
        }
        return trademarks;
    }

    public List<Product> selectLaptop() {
        List<Product> laptops = new ArrayList<>();
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_LAPTOPS);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String product_name = rs.getString("product_name");
                int cat_id = rs.getInt("cat_id");
                int product_new = rs.getInt("new");
                float unit_price = Float.parseFloat(String.valueOf(rs.getInt("unit_price")));
                float promotion_price = Float.parseFloat(String.valueOf(rs.getInt("promotion_price")));
                String product_image = rs.getString("image1");
                laptops.add( new Product(id,product_name,cat_id,product_new,unit_price,promotion_price,product_image));
            }
        }catch (SQLException e) {
            printSQLException(e);
        }
        return laptops;
    }

    public List<Product> selectManhinh() {
        List<Product> laptops = new ArrayList<>();
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_MH);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String product_name = rs.getString("product_name");
                int cat_id = rs.getInt("cat_id");
                int product_new = rs.getInt("new");
                float unit_price = Float.parseFloat(String.valueOf(rs.getInt("unit_price")));
                float promotion_price = Float.parseFloat(String.valueOf(rs.getInt("promotion_price")));
                String product_image = rs.getString("image1");
                laptops.add( new Product(id,product_name,cat_id,product_new,unit_price,promotion_price,product_image));
            }
        }catch (SQLException e) {
            printSQLException(e);
        }
        return laptops;
    }

    public List<Product> selectPc() {
        List<Product> laptops = new ArrayList<>();
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PC);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String product_name = rs.getString("product_name");
                int cat_id = rs.getInt("cat_id");
                int product_new = rs.getInt("new");
                float unit_price = Float.parseFloat(String.valueOf(rs.getInt("unit_price")));
                float promotion_price = Float.parseFloat(String.valueOf(rs.getInt("promotion_price")));
                String product_image = rs.getString("image1");
                laptops.add( new Product(id,product_name,cat_id,product_new,unit_price,promotion_price,product_image));
            }
        }catch (SQLException e) {
            printSQLException(e);
        }
        return laptops;
    }

    public List<Product> selectVp() {
        List<Product> laptops = new ArrayList<>();
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_VP);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String product_name = rs.getString("product_name");
                int cat_id = rs.getInt("cat_id");
                int product_new = rs.getInt("new");
                float unit_price = Float.parseFloat(String.valueOf(rs.getInt("unit_price")));
                float promotion_price = Float.parseFloat(String.valueOf(rs.getInt("promotion_price")));
                String product_image = rs.getString("image1");
                laptops.add( new Product(id,product_name,cat_id,product_new,unit_price,promotion_price,product_image));
            }
        }catch (SQLException e) {
            printSQLException(e);
        }
        return laptops;
    }

    public List<Product> selectMouse() {
        List<Product> laptops = new ArrayList<>();
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_MOUSER);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String product_name = rs.getString("product_name");
                int cat_id = rs.getInt("cat_id");
                int product_new = rs.getInt("new");
                float unit_price = Float.parseFloat(String.valueOf(rs.getInt("unit_price")));
                float promotion_price = Float.parseFloat(String.valueOf(rs.getInt("promotion_price")));
                String product_image = rs.getString("image1");
                laptops.add( new Product(id,product_name,cat_id,product_new,unit_price,promotion_price,product_image));
            }
        }catch (SQLException e) {
            printSQLException(e);
        }
        return laptops;
    }

    public List<Product> slectItem() {
        List<Product> laptops = new ArrayList<>();
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ICON);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String product_name = rs.getString("product_name");
                int cat_id = rs.getInt("cat_id");
                int product_new = rs.getInt("new");
                float unit_price = Float.parseFloat(String.valueOf(rs.getInt("unit_price")));
                float promotion_price = Float.parseFloat(String.valueOf(rs.getInt("promotion_price")));
                String product_image = rs.getString("image1");
                laptops.add( new Product(id,product_name,cat_id,product_new,unit_price,promotion_price,product_image));
            }
        }catch (SQLException e) {
            printSQLException(e);
        }
        return laptops;
    }

    public List<Trademark> selectTrademark() {
        List<Trademark> trades = new ArrayList<>();
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_TRADEMARKS);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("trademark_id");
                String trademark_name = rs.getString("trademark_name");
                String trademark_image = rs.getString("trademark_image");
                int show = rs.getInt("show_web");
                String created = rs.getString("created_at");
                String updated = rs.getString("updated_at");

                trades.add(new Trademark(id,trademark_name,trademark_image,show,created,updated));
            }
        }catch (SQLException e) {
            printSQLException(e);
        }
        return trades;
    }


    public List<Group> selectAllGroup() {
        List<Group> groups = new ArrayList<>();
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_GROUPS);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("group_id");
                String group_name = rs.getString("group_name");
                String group_image = rs.getString("group_image");
                String created = rs.getString("created_at");
                String updated = rs.getString("updated_at");

                groups.add(new Group(id,group_name,group_image,created,updated));
            }
        }catch (SQLException e) {
            printSQLException(e);
        }
        return groups;
    }
    public Product selectProduct(int id) {
        Product product = null;
        // Step 1: Establishing a Connection
        try {
            Connection connection = getConnection();
             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCT_BY_ID);
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int product_id = rs.getInt("products.id");
                String product_name = rs.getString("products.product_name");
                int cat_id = rs.getInt("products.cat_id");
                int trademark_id = rs.getInt("products.trademark_id");
                int group_id = rs.getInt("products.group_id");
                String des1 = rs.getString("products.description1");
                String des2 = rs.getString("products.description2");
                String des3 = rs.getString("products.description3");
                String des4 = rs.getString("products.description4");
                String image1 = rs.getString("products.image1");
                String image2 = rs.getString("products.image2");
                String image3 = rs.getString("products.image3");
                String image4 = rs.getString("products.image4");
                int pr_new = rs.getInt("products.new");
                String created_at = rs.getString("products.created_at");
                String update_at = rs.getString("products.update_at");
                float unit_price = Float.parseFloat(String.valueOf(rs.getInt("products.unit_price")));
                float promotion_price = Float.parseFloat(String.valueOf(rs.getInt("products.promotion_price")));
                String cat_name = rs.getString("category.cat_name");
                String trade_name  = rs.getString("trademark.trademark_name");
                product = new Product(product_id,product_name,cat_id,trademark_id,group_id,des1,des2,des3,des4,pr_new,unit_price,promotion_price,image1,image2,image3,image4,created_at,update_at,trade_name,cat_name);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return product;
    }

    public List<Product> selectProduct1(int id) {
        List<Product> products = new ArrayList<>();
        // Step 1: Establishing a Connection
        try {
            Connection connection = getConnection();
            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCT_LIKE_CAT_ID);
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int product_id = rs.getInt("products.id");
                String product_name = rs.getString("products.product_name");
                int cat_id = rs.getInt("products.cat_id");
                int trademark_id = rs.getInt("products.trademark_id");
                int group_id = rs.getInt("products.group_id");
                String des1 = rs.getString("products.description1");
                String des2 = rs.getString("products.description2");
                String des3 = rs.getString("products.description3");
                String des4 = rs.getString("products.description4");
                String image1 = rs.getString("products.image1");
                String image2 = rs.getString("products.image2");
                String image3 = rs.getString("products.image3");
                String image4 = rs.getString("products.image4");
                int pr_new = rs.getInt("products.new");
                String created_at = rs.getString("products.created_at");
                String update_at = rs.getString("products.update_at");
                float unit_price = Float.parseFloat(String.valueOf(rs.getInt("products.unit_price")));
                float promotion_price = Float.parseFloat(String.valueOf(rs.getInt("products.promotion_price")));
                String cat_name = rs.getString("category.cat_name");
                String trade_name  = rs.getString("trademark.trademark_name");
                products.add(new Product(product_id,product_name,cat_id,trademark_id,group_id,des1,des2,des3,des4,pr_new,unit_price,promotion_price,image1,image2,image3,image4,created_at,update_at,trade_name,cat_name));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return products;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
