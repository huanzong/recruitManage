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
    UserMapper mapper;

    public user getUserByAccount(String account) {

        return mapper.getUserByAccount(account);
    }

    public user loginByFront(String username, String pwd) {
        user user = new user();
        user.setAccount(username);
        user.setPass(pwd);
        return mapper.login(user);
    }

    public Boolean updateUserPass(user user) {
        try {
            mapper.updateUserPass(user);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public user findByUsername(String userName) {

        return mapper.getUserByAccount(userName);
    }

    @Override
    public void insert(user t) {
        mapper.insert(t);
    }
}
