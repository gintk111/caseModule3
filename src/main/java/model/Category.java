package model;

public class Category {
    int cat_id;
    int group_id;
    String cat_name;
    String created_at;
    String updated_at;

    public Category(int cat_id, int group_id, String cat_name, String created_at, String updated_at) {
        this.cat_id = cat_id;
        this.group_id = group_id;
        this.cat_name = cat_name;
        this.created_at = created_at;
        this.updated_at = updated_at;
    }

    public Category(int cat_id, String cat_name) {
        this.cat_id = cat_id;
        this.cat_name = cat_name;
    }

    public int getCat_id() {
        return cat_id;
    }

    public void setCat_id(int cat_id) {
        this.cat_id = cat_id;
    }

    public int getGroup_id() {
        return group_id;
    }

    public void setGroup_id(int group_id) {
        this.group_id = group_id;
    }

    public String getCat_name() {
        return cat_name;
    }

    public void setCat_name(String cat_name) {
        this.cat_name = cat_name;
    }

    public String getCreated_at() {
        return created_at;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }

    public String getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(String updated_at) {
        this.updated_at = updated_at;
    }
}
