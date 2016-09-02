package org.lanqiao.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.lanqiao.bean.Bills;
import org.lanqiao.bean.PageUtil;
import org.lanqiao.dao.BillDetailDao;
import org.lanqiao.dao.BillsDao;
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
	
	@Override
	public PageUtil getBills(PageUtil billsPage) {
		// TODO Auto-generated method stub
		List<Bills> lb = bd.selectBills((Map)billsPage.getQueryObj());
		int count = bd.countBills((Map)billsPage.getQueryObj());
		int total = count%billsPage.getPageSize()==0?count%billsPage.getPageSize():count%billsPage.getPageSize()+1;
		billsPage.setData(lb);
		billsPage.setTotal(total);
		return billsPage;
	}

	@Override
	public PageUtil getBillDetail(PageUtil billDetailPage) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PageUtil getOsLogin(PageUtil osLoginPage) {
		// TODO Auto-generated method stub
		return null;
	}

}
