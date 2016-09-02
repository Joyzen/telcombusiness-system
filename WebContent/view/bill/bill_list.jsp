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
            //写入下拉框中的年份和月份
            function initialYearAndMonth() {
                //写入最近3年
                var yearObj = document.getElementById("selYears");
                var year = (new Date()).getFullYear();
                for (var i = 0; i <= 2; i++) {
                    var opObj = new Option(year - i, year - i);
                    yearObj.options[i] = opObj;
                }
                //写入 12 月
                var monthObj = document.getElementById("selMonths");
                var opObj = new Option("全部", "全部");
                monthObj.options[0] = opObj;
                for (var i = 1; i <= 12; i++) {
                    var opObj = new Option(i, i);
                    monthObj.options[i] = opObj;
                }
            }
        </script>
    </head>
    <body onload="initialYearAndMonth();">
        <!--Logo区域开始-->
        <c:set var="pagePower" value="6" />
        <%@include file= "/view/common/powerCheckPageAndHead.jsp" %>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">
            <form action="" method="">
                <!--查询-->
                <div class="search_add">                        
                    <div>身份证：<input type="text"  value="230101111111111111" class="text_search" /></div>
                    <div>账务账号：<input type="text" value="admin1" class="width100 text_search" /></div>                            
                    <div>姓名：<input type="text" value="张三" class="width70 text_search" /></div>
                    <div>
                        <select class="select_search" id="selYears">
                        </select>
                        年
                        <select class="select_search" id="selMonths">
                        </select>
                        月
                    </div>
                    <div><input type="button" value="搜索" class="btn_search" /></div>
                </div>  
			</form>
                <!--数据区域：用表格展示数据-->     
                <div id="data">            
                    <table id="datalist">
                    <tr>
                        <th class="width50">账单ID</th>
                        <th class="width70">姓名</th>
                        <th class="width150">身份证</th>
                        <th class="width150">账务账号</th>
                        <th>费用</th>
                        <th class="width100">月份</th>
                        <th class="width100">支付方式</th>
                        <th class="width100">支付状态</th>                                                        
                        <th class="width50"></th>
                    </tr>
                </table>
                
                <p>业务说明：<br />
                1、设计支付方式和支付状态，为用户自服务中的支付功能预留；<br />
                2、只查询近 3 年的账单，即当前年和前两年，如2013/2012/2011；<br />
                3、年和月的数据由 js 代码自动生成；<br />
                4、由数据库中的ｊｏｂ每月的月底定时计算账单数据。</p>
                </div>                    
        </div>
        <!--主要区域结束-->
        <div id="footer">
            
           
        </div>
    </body>
</html>
