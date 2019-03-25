package serviceImpl.front;

import entity.Emp;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import service.front.EmpService;
import service.front.PhotoService;
import utils.DateUtil;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;


@Service("photoServiceService")
@Transactional
public class PhotoServiceImpl implements PhotoService {
    @Resource
    EmpService empService;

    public boolean saveDpersonImage(HttpServletRequest request, MultipartFile file, Integer id) {
        String path = request.getSession().getServletContext().getRealPath("photo");
        String fileName = DateUtil.getCurrDate("yyyy-MM-dd") + "_" + file.getOriginalFilename();
        File targetFile = new File(path, fileName);
        if (!targetFile.exists()) {
            targetFile.mkdirs();
        } else {
            targetFile.delete();
            targetFile.mkdirs();
        }
        try {
            file.transferTo(targetFile);
            System.out.println(request.getContextPath() + "/photo/" + fileName);
            Emp dp = new Emp();
            dp.setEmpId(id);
            dp.setImage(request.getContextPath() + "/photo/" + fileName);
            boolean flag = empService.updateEmpImg(dp);
            return flag;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

    }

    public boolean saveEpersonImage(HttpServletRequest request,
                                    MultipartFile file, Integer id) {
        String path = request.getSession().getServletContext().getRealPath("photo");
        String fileName = file.getOriginalFilename() + "_" + DateUtil.getCurrDate("yyyy-MM-dd");
        System.out.println(path);
        File targetFile = new File(path, fileName);
        if (!targetFile.exists()) {
            targetFile.mkdirs();
        } else {
            targetFile.delete();
            targetFile.mkdirs();
        }

        try {
            file.transferTo(targetFile);
            System.out.println(request.getContextPath() + "/photo/" + fileName);
            Emp dp = new Emp();
            dp.setEmpId(id);
            dp.setImage(request.getContextPath() + "/photo/" + fileName);
            boolean flag = empService.updateEmp(dp);
            return flag;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

}
