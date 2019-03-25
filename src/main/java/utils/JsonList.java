package utils;

import java.util.List;

public class JsonList {
List rows;
long total;
public JsonList() {
	// TODO Auto-generated constructor stub
}

public JsonList(List rows, long total) {
	super();
	this.rows = rows;
	this.total = total;
}

public List getRows() {
	return rows;
}
public void setRows(List rows) {
	this.rows = rows;
}
public long getTotal() {
	return total;
}
public void setTotal(long total) {
	this.total = total;
}


}
