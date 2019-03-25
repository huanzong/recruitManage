package serviceImpl.back;

import entity.user;
import mapper.back.userReview_mapper;
import org.springframework.stereotype.Service;
import service.back.userReview_service;
import serviceImpl.Abase.Basic_serviceImpl;

import javax.annotation.Resource;

@Service("userReview_serviceImpl")
public class userReview_serviceImpl extends Basic_serviceImpl<user> implements userReview_service {
    @Resource(name = "userReview_mapper")
    userReview_mapper mapper;

}
