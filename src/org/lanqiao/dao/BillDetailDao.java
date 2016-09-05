package org.lanqiao.dao;

import java.util.List;
import java.util.Map;

import org.lanqiao.bean.BillDetail;
import org.lanqiao.bean.ReportDTO;

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
	
	/**
	 * 查询总记录条数
	 * @param map
	 * @return
	 */
	public int countBillDetail(Map map);
	
	/**
	 * 查询账单排序
	 * @param order
	 * @return
	 */
	public List<ReportDTO> getReport(Map map);
	
}
