<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>Welcome to ASP</title>
<link rel="stylesheet" type="text/css" href="/JS/plugin/easyui-1.4.2/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/JS/plugin/easyui-1.4.2/themes/icon.css">
<script type="text/javascript" src="/JS/plugin/easyui-1.4.2/jquery.min.js"></script>
<script type="text/javascript" src="/JS/plugin/easyui-1.4.2/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/JS/plugin/easyui-1.4.2/easyui-lang-zh_CN.js" charset="utf-8"></script>
<script type="text/javascript">
$(function(){
	$("#a1").click(function(){
		$("#Customer").datagrid({
			title: '客户列表',
			iconCls: 'icon-save',
			border: true,
			nowrap: true,
			animate: true,
			rownumbers: false,
			url: '/JSON/Customers.asp?action=pagging',
			pagination: true,
			pageSize: 10,
			pageList: [10],
			pageNumber: 1,
			singleSelect: true,
			striped: true,
			fit: true,
			fitColumns: true,
			columns: [[
				{ field: "OrderID"},
				{ field: 'CustomerID'},
				{ field: 'EmployeeID'},
				{ field: 'OrderDate'},
				{ field: 'RequiredDate'},
				{ field: 'ShippedDate'},
				{ field: 'ShipVia'},
				{ field: 'Freight'},
				{ field: 'ShipName'},
				{ field: 'ShipAddress'},
				{ field: 'ShipCity'},
				{ field: 'ShipRegion'},
				{ field: 'ShipPostalCode'},
				{ field: 'ShipCountry'}
			]]	
		});	
	});
})
</script>
</head>

<body>
	<a href="#" id="a1">加载客户列表</a>
	
	<div style="width:1000px; height:350px; margin-top:10px;">
		<table id="Customer" class="easyui-datagrid"></table>	
	</div>
</body>
</html>
