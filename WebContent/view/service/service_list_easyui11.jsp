<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <%-- <link type="text/css" rel="stylesheet" media="all" href="${pageContext.request.contextPath }/view/styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="${pageContext.request.contextPath }/view/styles/global_color.css" /> --%>        
        <link type="text/css" rel="stylesheet" media="all" href="${pageContext.request.contextPath }/css/themes/material/easyui.css" />        
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/themes/icon.css"></link>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.0.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/easyui-lang-zh_CN.js"></script>
        <script type="text/javascript" language="javascript">
        	$(function(){
        		var p = $('#dl').datagrid('getPager'); 
        	    $(p).pagination({
        	    	pageSize: 5,//每页显示的记录条数，默认为10 
        	        pageList: [5,10,15],//可以设置每页记录条数的列表 
        	        beforePageText: '第',//页数文本框前显示的汉字 
        	        afterPageText: '页    共 {pages} 页', 
        	        displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录', 
        	    })
        			/* var status = $("#dl").datagrid().datagrid("getColumnOption","status");
        			status.formatter=function(value,row,index){
        				if(status=2){ return "删除";}
        				else if(status=1){ return "开通";}
        				else return "暂停";
        			} */

        	}) 
        	function formatCustomerId(val,row){
        		return row.os.customer.customerId;
        	}
        	function formatIdNumber(val,row){
        		return row.os.customer.idNumber;
        	}
        	function formatCustomerName(val,row){
        		return row.os.customer.customerName;
        	}
        	function formatOsAccount(val,row){
        		return row.os.osAccount;
        	}
        	function formatTariffName(val,row){
        		return row.os.tariff.tariffName;
        	}
        	function formatStatus(val,row){
        		if(row.os.status=='0'){
        			return '暂停';
        		}else if(row.os.status=='1'){
        			return '开通';
        		}else if(row.os.status=='2'){
        			return '删除';
        		}
        		return '空';
        	}
        </script>
    </head>
    <body>
        <!--Logo区域开始-->
        <%-- <c:set var="pagePower" value="5" />
        <%@include file= "/view/common/powerCheckPageAndHead.jsp" %> --%>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">
                <!--数据区域：用表格展示数据-->     
                    <table id="dl" title="业务账号信息显示" class="easyui-datagrid" style="width:950px;height:250;"
                    url="${pageContext.request.contextPath}/bussiness/getJson.do"
                    idField="id" rownumbers="true" fitColumns="true" singleSelect="true"
                    pagination="true"  iconCls="icon-save" toolbar="#toolbar">
                    <thead>
	                	<tr>
	                        <th field="bussinessId" width="40px">业务ID</th>
	                        <th field="customerId" width="40px" formatter="formatCustomerId">账务账号ID</th>
	                        <th field="idNumber" width="100px" formatter="formatIdNumber">身份证</th>
	                        <th field="customerName" width="70px" formatter="formatCustomerName">姓名</th>
	                        <th field="osAccount" width="70px" formatter="formatOsAccount">OS 账号</th>
	                        <th field="status" width="30px" formatter="formatStatus">状态</th>
	                        <th field="tariffName" width="100px" formatter="formatTariffName" >资费</th>                                                        
	                        <th field="opr" width="200px"></th>
	                    </tr>
                    </thead>
                	</table>                
                <!-- <p>业务说明：<br />
                1、创建即开通，记载创建时间；<br />
                2、暂停后，记载暂停时间；<br />
                3、重新开通后，删除暂停时间；<br />
                4、删除后，记载删除时间，标示为删除，不能再开通、修改、删除；<br />
                5、业务账号不设计修改密码功能，由用户自服务功能实现；<br />
                6、暂停和删除状态的账务账号下属的业务账号不能被开通。</p> -->
                <!--分页-->
        </div>
        <!--主要区域结束-->
        <div id="footer">
           
        </div>
    </body>
</html>
