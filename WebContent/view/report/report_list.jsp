<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <link type="text/css" rel="stylesheet" media="all" href="${pageContext.request.contextPath }/view/styles/globaleasyUI.css" />
        <link type="text/css" rel="stylesheet" media="all" href="${pageContext.request.contextPath }/view/styles/global_color.css" />        
        <link type="text/css" rel="stylesheet" media="all" href="${pageContext.request.contextPath }/css/themes/material/easyui.css" />        
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/themes/icon.css"></link>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.0.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/easyui-lang-zh_CN.js"></script>
        <script language="javascript" type="text/javascript">
	        function changeTab(e,ulObj) {                
	            var obj = e.srcElement || e.target;
	            if (obj.nodeName == "A") {
	                var links = ulObj.getElementsByTagName("a");
	                for (var i = 0; i < links.length; i++) {
	                    if (links[i].innerHTML == obj.innerHTML) {
	                        links[i].className = "tab_on";
	                    }
	                    else {
	                        links[i].className = "tab_out";
	                    }
	                }
	            }
	        }
            $(function(){
            	$("#datalist").datagrid({
            		title:'报表显示', 
                    iconCls:'icon-show',//图标 
                    width: 950, 
                    height: 300, 
                    nowrap: false, 
                    striped: true, 
                    border: true, 
                    collapsible:false,//是否可折叠的 
                    fit: false,//自动大小 
                    url:'', 
                    //sortName: 'code', 
                    //sortOrder: 'desc', 
                    pageSize: 5,//每页显示的记录条数，默认为10 
        	        pageList: [3,5,10],//可以设置每页记录条数的列表 
                    remoteSort:false,  
                    idField:'billId', 
                    singleSelect:true,//是否单选 
                    pagination:true,//分页控件 
                    rownumbers:false,//行号 
                    /* frozenColumns:[[ 
                        {field:'ck',checkbox:true} 
                    ]], */ 
                    /* onDblClickRow:function(row,index){
                    	detail();
                    }, */
                    toolbar:"#tabs"
            	})
            	var p = $('#datalist').datagrid('getPager'); 
        	    $(p).pagination({
        	        beforePageText: '第',//页数文本框前显示的汉字 
        	        afterPageText: '页  /  共 {pages} 页', 
        	        displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录', 
        	    });
            })
        </script>
    </head>
    <body>
        <!--Logo区域开始-->
        <c:set var="pagePower" value="7" />
        <%@include file= "/view/common/powerCheckPageAndHead.jsp" %>
        <!--导航区域结束-->
        <!--主要区域开始-->        
        <div id="report_main">
        	<div id="tabs" class="tabs">
    	        <ul onclick="changeTab(event,this);">
        	        <li><a href="#" class="tab_on" title="每位客户每月的累计时长">客户使用时长</a></li>
                    <li><a href="#" class="tab_out" title="每台服务器上累计时长最高的前三名客户">时长排行榜</a></li>
                    <li><a href="#" class="tab_out" title="每台服务器每种资费标准的使用次数">资费使用率</a></li>
                </ul>
            </div>            
            <div class="report_box">
                <!--数据区域：用表格展示数据-->
                <div id="report_data">
                    <table id="datalist">
                    <thead>
                        <tr>                            
                            <th field="customerId">账号 ID</th>
                            <th field="customerAccount">账务帐号</th>
                            <th field="customerName">客户名称</th>
                            <th field="idNumber" class="width200">身份证号码</th>
                            <th field="phone">电话</th>
                            <th field="months">月份</th>
                            <th field="timeLong">累积时长</th>
                        </tr>                      
                    </thead>
                    </table>
                </div>
            </div>
        </div>
        <!--主要区域结束-->
        <div id="footer"></div>
    </body>
</html>
