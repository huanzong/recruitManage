package service.front;


import entity.Company;

public interface CompanyService {

	Company findByCompanyname(String username);
	
	//通过用户id 获得公司对象
	Company findByUid(int uid);

	public boolean saveCompany(Company company);
	
	public boolean updateCompany(Company company);
}
