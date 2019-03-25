package serviceImpl.Abase;

import java.lang.reflect.Field;
import java.util.List;

import entity.operator;
import mapper.Abase.Basic_mapper;
import utils.Search;


public class Basic_serviceImpl<T>{
	
	
	private Basic_mapper<T> getMapper(){
		try {
			Field f=getClass().getDeclaredField("mapper");
			f.setAccessible(true);
			return (Basic_mapper<T>) f.get(this);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	public List<T> getByWhere(Search info) {
		List list= getMapper().getByWhere(info);
		info.setRows((int)getMapper().getByWhereSize(info));
		return list;
	}
	
	public void insert(T t) {
		getMapper().insert(t);
	}
	
	public void update(T t) {
		getMapper().update(t);
	}

	
	public void delete(int id) {
		getMapper().delete(id);
	}



	public long getByWhereSize(Search info) {		
		return getMapper().getByWhereSize(info);
	}



	public T getById(int id) {
		return getMapper().getById(id);
	}

	public List<operator> getoperatorlist(){ return  getMapper().getoperatorlist();}

}
