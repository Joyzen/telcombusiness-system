package org.lanqiao.action;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.collections.map.HashedMap;
import org.lanqiao.bean.PageUtil;
import org.lanqiao.service.BillService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/bill")
public class BillAction {

	@Resource
	BillService bs;
	
	@RequestMapping("/toBills")
	public String toBills(){
		return "bill/bill_list";
	}
	
	/**
	 * 返回账单查询json数据
	 * @param idNumber
	 * @param customerAccount
	 * @param customerName
	 * @param year
	 * @param month
	 * @param page
	 * @param rows
	 * @return
	 */
	@RequestMapping("/getBills")
	@ResponseBody
	public Map showBills(@RequestParam(value="idNumber",defaultValue="")String idNumber,
			        	  @RequestParam(value="customerAccount",defaultValue="")String customerAccount,
			        	  @RequestParam(value="customerName",defaultValue="")String customerName,
			        	  @RequestParam(value="year",defaultValue="")String year,
			        	  @RequestParam(value="month",defaultValue="")String month,
			        	  @RequestParam(value="page",defaultValue="1")int page,
			        	  @RequestParam(value="rows",defaultValue="5")int rows){
		PageUtil billsPage = new PageUtil();
		Map map = new HashedMap();
		int start = (page-1)*rows;
		map.put("idNumber", idNumber);
		map.put("customerAccount", customerAccount);
		map.put("customerName", customerName);
		map.put("year", year);
		map.put("month", month);
		map.put("page", page);
		map.put("rows", rows);
		billsPage.setQueryObj(map);
		billsPage.setPage(page);
		billsPage.setRows(rows);
		billsPage = bs.getBills(billsPage);
		map.put("rows", billsPage.getRows());
		map.put("total", billsPage.getTotal());
		return map;
	}
	
}
