package utils;

public class Search {
private int rows;
private int page;
private String where;

private String sort;
private String order;



public String getSort() {
	if(sort==null||sort.length()==0) return "";
	return " order by "+sort+" "+order +" ";
}
public void setSort(String sort) {
	this.sort = sort;
}
public String getOrder() {
	return order;
}
public void setOrder(String order) {
	this.order = order;
}
public String getWhere() {
	return where;
}
public void setWhere(String where) {
	this.where = where;
}
public int getRows() {
	return rows;
}
public void setRows(int rows) {
	this.rows = rows;
}
public int getPage() {
	return page;
}
public void setPage(int page) {
	this.page = page;
}

public String getLimit(){
	if(page==0)return "";
	int s=(page-1)*rows;
	return " limit "+s+","+rows;
}

}
