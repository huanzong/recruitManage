package utils;

public class Values {

	public static final int JOB_SEEKER_STATUS = 0;//求职者
	public static final int RECRUITER_STATUS = 1;//招聘者

	public static String[][] user_type=new String[][]{{"0","求职者"},{"1","招聘者"}};
	public static String[][] user_status=new String[][]{{"0","待审核"},{"1","拒绝"},{"2","通过"}};
	public static String[][] currency_status=new String[][]{{"0","可用"},{"1","禁用"}};
	public static String[][] fabu_status=new String[][]{{"0","已发布"},{"1","已撤销"}};
	public static String[][] hot_status=new String[][]{{"0","普通"},{"1","热门"}};

	public static final int USER_STATUS_NO = 1;//公司审核拒绝
	public static final int USER_STATUS_YES = 2;//公司审核通过
	public static final int USER_STATUS_NOChECK = 0;//公司待审核
}
