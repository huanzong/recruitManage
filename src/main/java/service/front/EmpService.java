package service.front;


import entity.Emp;

public interface EmpService {

    public boolean saveEmp(Emp user);

    public Emp findByUserId(Integer id);

    public boolean updateEmp(Emp dp);

    public boolean updateEmpImg(Emp dp);


}
