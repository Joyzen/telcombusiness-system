package org.lanqiao.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.lanqiao.bean.BillDetail;
import org.lanqiao.bean.Bills;
import org.lanqiao.bean.Customer;
import org.lanqiao.bean.PageUtil;
import org.lanqiao.dao.BillDetailDao;
import org.lanqiao.dao.BillsDao;
import org.lanqiao.dao.CustomerDao;
import org.lanqiao.dao.OsLoginDao;
import org.lanqiao.service.BillService;
import org.springframework.stereotype.Service;
@Service
public class BillServiceImpl implements BillService {

	@Resource
	BillsDao bd;
	@Resource
	BillDetailDao bdd;
	@Resource
	OsLoginDao od;
	@Resource
	CustomerDao cd;
	
	@Override
	public PageUtil getBills(PageUtil billsPage) {
		// TODO Auto-generated method stub
		List<Bills> lb = bd.selectBills((Map)billsPage.getQueryObj());
		Map m = (Map)billsPage.getQueryObj();
		System.out.println(m.get("start")+"----"+m.get("rows"));
		int count = bd.countBills((Map)billsPage.getQueryObj());
		billsPage.setData(lb);
		billsPage.setTotal(count);
		return billsPage;
	}

	@Override
	public Map<String,Object> getBillDetail(Map<String,Object> map) {
		int customerId = (int)map.get("customerId");
		Customer customer = cd.selectCustomerByCustomerId(customerId);
		List<BillDetail> lbd = bdd.selectBillDetailByCondition(map);
		int total = bdd.countBillDetail(map);
		Map<String,Object> m = new HashMap<String,Object>();
		m.put("rows", lbd);
		m.put("total", total);
		m.put("customer", customer);
		return m;
	}

	@Override
	public PageUtil getOsLogin(PageUtil osLoginPage) {
		// TODO Auto-generated method stub
		return null;
	}

}
