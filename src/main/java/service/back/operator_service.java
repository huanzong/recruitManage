package service.back;

import entity.operator;
import service.Abase.Basic_Service;

import java.util.List;

public interface operator_service extends Basic_Service<operator> {
    public operator login(operator t);
    public void updatepass(operator t);
}
