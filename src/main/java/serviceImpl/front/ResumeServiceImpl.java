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

	public boolean saveResume(ComResume comResume) {
		try {
			resumeMapper.insert(comResume);
			return true;
		} catch (Exception e){
			return false;
		}
	}

}
