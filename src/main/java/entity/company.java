package entity;

public class company {
    private int id;//公司id
    private int userId;//招聘人
    private String name;//公司名称
    private String comType;//公司类型：私企/国企
    private String description;//公司描述
    private String empCount;//公司人员数量，公司规模
    private String address;//公司地址
    private String email;//公司邮箱
    private String comTel;//公司电话
    private String manager;//公司法人
    private String mTel;//公司管理者电话
    private String trade;//公司所属行业
    private String businessLicense;//公司营业执照

    private int status;//审核状态，0待审核，1审核通过，2审核失败


    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getComType() {
        return comType;
    }

    public void setComType(String comType) {
        this.comType = comType;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getEmpCount() {
        return empCount;
    }

    public void setEmpCount(String empCount) {
        this.empCount = empCount;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getComTel() {
        return comTel;
    }

    public void setComTel(String comTel) {
        this.comTel = comTel;
    }

    public String getManager() {
        return manager;
    }

    public void setManager(String manager) {
        this.manager = manager;
    }

    public String getmTel() {
        return mTel;
    }

    public void setmTel(String mTel) {
        this.mTel = mTel;
    }

    public String getTrade() {
        return trade;
    }

    public void setTrade(String trade) {
        this.trade = trade;
    }

    public String getBusinessLicense() {
        return businessLicense;
    }

    public void setBusinessLicense(String businessLicense) {
        this.businessLicense = businessLicense;
    }
}
