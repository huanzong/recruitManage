package service.front;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

public interface PhotoService {

public boolean saveDpersonImage(HttpServletRequest request, MultipartFile file, Integer id);


public boolean saveEpersonImage(HttpServletRequest request, MultipartFile file, Integer id);

}
