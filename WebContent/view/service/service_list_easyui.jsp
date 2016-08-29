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
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/easyui-lang-zh_CN.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
        <script language="javascript" type="text/javascript">
            //显示角色详细信息
            function showDetail(flag,a) {
                var detailDiv = a.parentNode.getElementsByTagName("div")[0];
                if (flag) {
                    detailDiv.style.display = "block";
                }
                else
                    detailDiv.style.display = "none";
            }
            //删除
            function deleteAccount() {
                var r = window.confirm("确定要删除此业务账号吗？删除后将不能恢复。");
                document.getElementById("operate_result_info").style.display = "block";
            }
            //开通或暂停
            function setState() {
                var r = window.confirm("确定要开通此业务账号吗？");
                document.getElementById("operate_result_info").style.display = "block";
            }
            $(function(){
            	//初始化数据表格
            	$('#dl').datagrid({ 
                    title:'业务账号信息显示', 
                    iconCls:'icon-show',//图标 
                    width: 950, 
                    height: 300, 
                    nowrap: false, 
                    striped: true, 
                    border: true, 
                    collapsible:false,//是否可折叠的 
                    fit: false,//自动大小 
                    url:'${pageContext.request.contextPath}/bussiness/getJson.do', 
                    //sortName: 'code', 
                    //sortOrder: 'desc', 
                    remoteSort:false,  
                    idField:'bussinessId', 
                    singleSelect:true,//是否单选 
                    pagination:true,//分页控件 
                    rownumbers:false,//行号 
                    /* frozenColumns:[[ 
                        {field:'ck',checkbox:true} 
                    ]], */ 
                    toolbar:"#search"
                }); 
        		var p = $('#dl').datagrid('getPager'); 
        	    $(p).pagination({
        	    	pageSize: 5,//每页显示的记录条数，默认为10 
        	        pageList: [3,5,10],//可以设置每页记录条数的列表 
        	        beforePageText: '第',//页数文本框前显示的汉字 
        	        afterPageText: '页  /  共 {pages} 页', 
        	        displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录', 
        	    });
        	    //初始化添加窗口
        	    $("#addDialog").dialog({
        	    	title:'增加业务账号',
        	    	closed:true,
        	    	onBeforeOpen:initTariff()
        	    })
        	}) 
			//打开或关闭增加面板
        	function oprWin(opr){
            	if(opr=='open'){
            		$("#addDialog").dialog("open");
            	}else if(opr=='close'){
            		$("#addDialog").dialog("close");
            	}
            }
        	
            //根据身份证查询账务账号
            function searchAccounts() {
				$.ajax({
					url:"${pageContext.request.contextPath}/bussiness/checkIdNumber.do",
					data:{"idNumber":$("input[name='idNumber']:eq(1)").val()},
					success:function(data){
						$("input[name='customerId']").val(data.customerId)
						$("input[name='customerAccount']").val(data.customerAccount)
					}
				})
            }
            
            //初始化资费列表
            function initTariff(){
            	$.ajax({
            		url:"${pageContext.request.contextPath}/bussiness/getTariff.do",
            		success:function(data){
            			$(data.tariffList).each(function(){
            				var o="<option value='"+this.tariffId+"'>"+this.tariffName+"</option>";
            				$("select[name='tariffId']").append(o);
            			})
            		}
            	})
            }
            
            //easyUI表格数据显示格式化
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
        	function formatOpr(val,row){
        		var openBtn="<input type='button' class='btn_start' value='开通' onclick='setStus(1,"+row.bussinessId+")'/>";
        		var pauseBtn="<input type='button' class='btn_pause' value='暂停' onclick='setStus(0,"+row.bussinessId+")'/>";
        		var delBtn="<input type='button' class='btn_delete' value='删除' onclick='setStus(2,"+row.bussinessId+")'/>";
        		var modiBtn="<input type='button' class='btn_modify' value='修改' onclick='modi("+row.bussinessId+")'/>";
        		
        		if(row.os.status!='2'){
        			if(row.os.status=='1'){
        				return pauseBtn+modiBtn+delBtn;
        			}
        			if(row.os.status=='0'){
        				return openBtn+modiBtn+delBtn;
        			}
        		}
        		return '';
        	}
        	function setStus(status,bussinessId){
        		$.ajax({
            		url		:"${pageContext.request.contextPath}/bussiness/updateStatus.do",
            		data	:{
            					"bussinessId":bussinessId,
            					"status":status,
            		},
            		success:function(data){
            			if(data=="success"){
            				if(status==0){
            					$("#operate_result_info").html("暂停成功")
            				}
            				if(status==1){
            					$("#operate_result_info").html("开通成功")
            				}
            				if(status==2){
            					$("#operate_result_info").html("删除成功")
            				}
            				$("#operate_result_info").css("display","block");
            				setTimeout("$('#operate_result_info').css('display','none')",1000);
            				setTimeout("$('#dl').datagrid('reload')",1000);
            			}
            		}
            	})
        	}
        	function modi(){
        		
        	}
        	//搜索方法
        	function doSearch(opr){
        		if(opr=='none'){
        			$('#osAccount').val('');
        			$('#idNumber').val('');
        			$('#status').val('-1');
        			$('#dl').datagrid('load',{
	        			osAccount: $('#osAccount').val(),
	        			idNumber: $('#idNumber').val(),
	        			status:$('#status').val(),
	        		});
        		}
        		else{
	        		$('#dl').datagrid('load',{
	        			osAccount: $('#osAccount').val(),
	        			idNumber: $('#idNumber').val(),
	        			status:$('#status').val(),
	        		});
        		}
        	}
        </script>
    </head>
    <body>
        <!--Logo区域开始-->
        <c:set var="pagePower" value="5" />
        <%@include file= "/view/common/powerCheckPageAndHead.jsp" %>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">
                <!--查询-->
                <div id="search" class="search_add">                        
                    <div>OS 账号：<input id="osAccount" name="osAccount" type="text" value="${bussinessPage.queryObj.osAccount }" class="width100 text_search" /></div>                            
                    <!-- <div>服务器 IP：<input type="text" value="" class="width100 text_search" /></div> -->
                    <div>身份证：<input id="idNumber" name="idNumber" type="text"  value="${bussinessPage.queryObj.idNumber }" class="text_search" /></div>
                    <div>状态：
                        <select id="status" name="status" class="select_search">
                            <option value="-1">全部</option>
                            <option value="1">开通</option>
                            <option value="0">暂停</option>
                            <option value="2">删除</option>
                        </select>
                    </div>
                    <div><input type="button" value="搜索" class="btn_search" onclick="doSearch()"/></div>
                    <div><input type="button" value="搜索全部" class="btn_search_large" onclick="doSearch('none')"/></div>
                    <input type="button" value="增加" class="btn_add" onclick="oprWin('open')" />
                </div>  
                <!--删除的操作提示-->
                <div id="operate_result_info" class="operate_success">
                    <img src="${pageContext.request.contextPath}/view/images/close.png" onclick="this.parentNode.style.display='none';" />
                </div>   
                <!--数据区域：用表格展示数据-->     
                <div id="data">            
                    <table id="dl" class="easyui-datagrid">
                    <thead>
	                	<tr>
	                        <th field="bussinessId" width="70px">业务ID</th>
	                        <th field="customerId" width="70px" formatter="formatCustomerId">账务账号ID</th>
	                        <th field="idNumber" width="150px" formatter="formatIdNumber">身份证</th>
	                        <th field="customerName" width="70px" formatter="formatCustomerName">姓名</th>
	                        <th field="osAccount" width="70px" formatter="formatOsAccount">OS 账号</th>
	                        <th field="status" width="70px" formatter="formatStatus">状态</th>
	                        <th field="tariffName" width="100px" formatter="formatTariffName" >资费</th>                                                        
	                        <th field="opr" width="200px" formatter="formatOpr">操作</th>
	                    </tr>
                    </thead>
                	</table>
                	<!-- 添加对话窗口 -->  
          <div id="addDialog" class="easyui-dialog">
            <form action="" method="" class="main_form">
                <!--内容项-->
                <div class="text_info clearfix"><span>身份证：</span></div>
                <div class="input_info">
                    <input name="idNumber" type="text" value="查询出的结果写入账务账号" class="width180" />
                    <input type="button" value="查询账务账号" class="btn_search_large" onclick="searchAccounts()" />
                    <input name="customerId"type="hidden" value=""/>
                    <span class="required">*</span>
                    <div class="validate_msg_short">没有此身份证号，请重新录入。</div>
                </div>
                <div class="text_info clearfix"><span>账务账号：</span></div>
                <div class="input_info">
                    <input name="customerAccount" type="text" value="" onkeyup="searchAccounts(this);" />
                    <span class="required">*</span>
                    <div class="validate_msg_long">没有此账务账号，请重新录入。</div>
                </div>
                <div class="text_info clearfix"><span>资费类型：</span></div>
                <div class="input_info">
                    <select name="tariffId">
                    <c:forEach items="${tariffList }" var="t">
                    	<option value="${t.tariffId }">${t.tariffName}</option>
                    </c:forEach>
                    </select>                        
                </div> 
                <div class="text_info clearfix"><span>服务器 IP：</span></div>
                <div class="input_info">
                    <input name="serverIp" type="text" value="192.168.0.23"  />
                    <span class="required">*</span>
                    <div class="validate_msg_long">15 长度，符合IP的地址规范</div>
                </div>                   
                <div class="text_info clearfix"><span>登录 OS 账号：</span></div>
                <div class="input_info">
                    <input name="osAccount" type="text" value="创建即启用，状态为开通"  />
                    <span class="required">*</span>
                    <div class="validate_msg_long">8长度以内的字母、数字和下划线的组合</div>
                </div>
                <div class="text_info clearfix"><span>密码：</span></div>
                <div class="input_info">
                    <input name="osPassword" type="password"  />
                    <span class="required">*</span>
                    <div class="validate_msg_long">30长度以内的字母、数字和下划线的组合</div>
                </div>
                <div class="text_info clearfix"><span>重复密码：</span></div>
                <div class="input_info">
                    <input type="password"  />
                    <span class="required">*</span>
                    <div class="validate_msg_long">两次密码必须相同</div>
                </div>     
                <!--操作按钮-->
                <div class="button_info clearfix">
                    <input type="button" value="保存" class="btn_save" onclick="sub();" />
                    <input type="button" value="取消" class="btn_save" />
                </div>
            </form>
        </div>              
                <p>业务说明：<br />
                1、创建即开通，记载创建时间；<br />
                2、暂停后，记载暂停时间；<br />
                3、重新开通后，删除暂停时间；<br />
                4、删除后，记载删除时间，标示为删除，不能再开通、修改、删除；<br />
                5、业务账号不设计修改密码功能，由用户自服务功能实现；<br />
                6、暂停和删除状态的账务账号下属的业务账号不能被开通。</p>
                </div>                    
        </div>
        <!--主要区域结束-->
        <div id="footer">
           
        </div>
    </body>
</html>
