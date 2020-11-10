package model;

public class Product {
    int id;
    String product_name;
    int cat_id;
    int trademark_id;
    int group_id;
    String description1;
    String description2;
    String description3;
    String description4;
    int product_new;
    float unit_price;
    float promotion_price;
    String image1;
    String image2;
    String image3;
    String image4;
    String created_at;
    String update_at;
    String trade_name;
    String cat_name;

    public Product(String product_name, int cat_id, int trademark_id, int group_id, String description1, String description2, String description3, String description4, int product_new, float unit_price, float promotion_price, String image1, String image2, String image3, String image4) {
        this.product_name = product_name;
        this.cat_id = cat_id;
        this.trademark_id = trademark_id;
        this.group_id = group_id;
        this.description1 = description1;
        this.description2 = description2;
        this.description3 = description3;
        this.description4 = description4;
        this.product_new = product_new;
        this.unit_price = unit_price;
        this.promotion_price = promotion_price;
        this.image1 = image1;
        this.image2 = image2;
        this.image3 = image3;
        this.image4 = image4;
    }

    public Product(int id, String product_name, int cat_id, int trademark_id, int group_id, String description1, String description2, String description3, String description4, int product_new, float unit_price, float promotion_price, String image1, String image2, String image3, String image4, String created_at, String update_at, String trade_name, String cat_name) {
        this.id = id;
        this.product_name = product_name;
        this.cat_id = cat_id;
        this.trademark_id = trademark_id;
        this.group_id = group_id;
        this.description1 = description1;
        this.description2 = description2;
        this.description3 = description3;
        this.description4 = description4;
        this.product_new = product_new;
        this.unit_price = unit_price;
        this.promotion_price = promotion_price;
        this.image1 = image1;
        this.image2 = image2;
        this.image3 = image3;
        this.image4 = image4;
        this.created_at = created_at;
        this.update_at = update_at;
        this.trade_name = trade_name;
        this.cat_name = cat_name;
    }

    public Product(int id, String product_name, int cat_id, int product_new, float unit_price, float promotion_price, String image1) {
        this.id = id;
        this.product_name = product_name;
        this.cat_id = cat_id;
        this.product_new = product_new;
        this.unit_price = unit_price;
        this.promotion_price = promotion_price;
        this.image1 = image1;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public int getCat_id() {
        return cat_id;
    }

    public void setCat_id(int cat_id) {
        this.cat_id = cat_id;
    }

    public int getTrademark_id() {
        return trademark_id;
    }

    public void setTrademark_id(int trademark_id) {
        this.trademark_id = trademark_id;
    }

    public int getGroup_id() {
        return group_id;
    }

    public void setGroup_id(int group_id) {
        this.group_id = group_id;
    }

    public String getDescription1() {
        return description1;
    }

    public void setDescription1(String description1) {
        this.description1 = description1;
    }

    public String getDescription2() {
        return description2;
    }

    public void setDescription2(String description2) {
        this.description2 = description2;
    }

    public String getDescription3() {
        return description3;
    }

    public void setDescription3(String description3) {
        this.description3 = description3;
    }

    public String getDescription4() {
        return description4;
    }

    public void setDescription4(String description4) {
        this.description4 = description4;
    }

    public int getProduct_new() {
        return product_new;
    }

    public void setProduct_new(int product_new) {
        this.product_new = product_new;
    }

    public float getUnit_price() {
        return unit_price;
    }

    public void setUnit_price(float unit_price) {
        this.unit_price = unit_price;
    }

    public float getPromotion_price() {
        return promotion_price;
    }

    public void setPromotion_price(float promotion_price) {
        this.promotion_price = promotion_price;
    }

    public String getImage1() {
        return image1;
    }

    public void setImage1(String image1) {
        this.image1 = image1;
    }

    public String getImage2() {
        return image2;
    }

    public void setImage2(String image2) {
        this.image2 = image2;
    }

    public String getImage3() {
        return image3;
    }

    public void setImage3(String image3) {
        this.image3 = image3;
    }

    public String getImage4() {
        return image4;
    }

    public void setImage4(String image4) {
        this.image4 = image4;
    }

    public String getCreated_at() {
        return created_at;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }

    public String getUpdate_at() {
        return update_at;
    }

    public void setUpdate_at(String update_at) {
        this.update_at = update_at;
    }

    public String getTrade_name() {
        return trade_name;
    }

    public void setTrade_name(String trade_name) {
        this.trade_name = trade_name;
    }

    public String getCat_name() {
        return cat_name;
    }

    public void setCat_name(String cat_name) {
        this.cat_name = cat_name;
    }
}
