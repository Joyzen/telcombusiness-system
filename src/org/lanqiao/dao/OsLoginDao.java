package org.lanqiao.dao;

import java.util.List;
import java.util.Map;

import org.lanqiao.bean.OsLogin;

public interface OsLoginDao {

	/**
	 * 查询登陆记录
	 * @param map
	 * @return
	 */
	public List<OsLogin> selectOsLoginByCondition(Map map);
	
	/**
	 * 添加登陆记录
	 * @param osLogin
	 * @return
	 */
	public int insertOsLogin(OsLogin osLogin);
	
}
