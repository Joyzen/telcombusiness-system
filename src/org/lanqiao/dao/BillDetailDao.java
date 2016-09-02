package org.lanqiao.dao;

import java.util.List;
import java.util.Map;

import org.lanqiao.bean.BillDetail;

public interface BillDetailDao {

	/**
	 * 查询详单记录
	 * @param map
	 * @return
	 */
	public List<BillDetail> selectBillDetailByCondition(Map map);
	
	/**
	 * 插入一条详单记录
	 * @param billDetail
	 * @return
	 */
	public int insertBillDetail(BillDetail billDetail);
	
}
