package model;

public class Group {
    int groupId;
    String groupName;
    String groupImage;
    String created_at;
    String update_at;

    public Group(int groupId, String groupName, String groupImage, String created_at, String update_at) {
        this.groupId = groupId;
        this.groupName = groupName;
        this.groupImage = groupImage;
        this.created_at = created_at;
        this.update_at = update_at;
    }

    public int getGroupId() {
        return groupId;
    }

    public void setGroupId(int groupId) {
        this.groupId = groupId;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public String getGroupImage() {
        return groupImage;
    }

    public void setGroupImage(String groupImage) {
        this.groupImage = groupImage;
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
}
