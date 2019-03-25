package serviceImpl.front;

import entity.user;
import mapper.front.UserMapper;
import org.springframework.stereotype.Repository;
import service.front.UserService;
import serviceImpl.Abase.Basic_serviceImpl;

import javax.annotation.Resource;


@Repository("UserServiceImpl")
public class UserServiceImpl extends Basic_serviceImpl<user> implements UserService {

    @Resource(name = "UserMapper")
    UserMapper userMapper;

    public user getUserByAccount(String account) {

        return userMapper.getUserByAccount(account);
    }

    public user loginByFront(String username, String pwd) {
        user user = new user();
        user.setAccount(username);
        user.setPass(pwd);
        return userMapper.login(user);
    }

    public Boolean updateUserPass(user user) {
        try {
            userMapper.updateUserPass(user);
            return true;
        }catch (Exception e){
            return false;
        }
    }
}
