package serviceImpl.front;

import entity.ComResume;
import mapper.front.ComResumeMapper;
import org.springframework.stereotype.Service;
import service.front.ResumeService;

import javax.annotation.Resource;

@Service
public class ResumeServiceImpl implements ResumeService {
	@Resource
	ComResumeMapper resumeMapper;

	public boolean saveResume(ComResume user) {
		int i=resumeMapper.insert(user);
		if (i > 0) {
			return true;
		}
		return false;
	}

}
