package service.front;

import entity.user;
import service.Abase.Basic_Service;


public interface UserService extends Basic_Service<user> {


    public user getUserByAccount(String account);

    public user loginByFront(String username, String pwd);

    public Boolean updateUserPass(user user);

    public user findByUsername(String userName);


}
