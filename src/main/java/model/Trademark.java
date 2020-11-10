package model;

public class Trademark {
    int trademarkId;
    String trademarkName;
    String trademarkImage;
    int showWed;
    String createdAt;
    String updatedAt;

    public Trademark(int trademarkId, String trademarkName, String trademarkImage, int showWed, String createdAt, String updatedAt) {
        this.trademarkId = trademarkId;
        this.trademarkName = trademarkName;
        this.trademarkImage = trademarkImage;
        this.showWed = showWed;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public Trademark(int trademarkId, String trademarkName) {
        this.trademarkId = trademarkId;
        this.trademarkName = trademarkName;
    }

    public int getTrademarkId() {
        return trademarkId;
    }

    public void setTrademarkId(int trademarkId) {
        this.trademarkId = trademarkId;
    }

    public String getTrademarkName() {
        return trademarkName;
    }

    public void setTrademarkName(String trademarkName) {
        this.trademarkName = trademarkName;
    }

    public String getTrademarkImage() {
        return trademarkImage;
    }

    public void setTrademarkImage(String trademarkImage) {
        this.trademarkImage = trademarkImage;
    }

    public int getShowWed() {
        return showWed;
    }

    public void setShowWed(int showWed) {
        this.showWed = showWed;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public String getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(String updatedAt) {
        this.updatedAt = updatedAt;
    }
}
