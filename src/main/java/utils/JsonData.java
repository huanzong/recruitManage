package utils;

public class JsonData {
	private int status=0;
	private String url;
	public JsonData() {
		// TODO Auto-generated constructor stub
	}

	public JsonData(int status) {
		super();
		this.status = status;
	}



	public JsonData(int status, String url) {
		super();
		this.status = status;
		this.url = url;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

}
