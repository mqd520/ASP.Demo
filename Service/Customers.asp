<!--#include virtual="DB/SqlHelper.asp"-->
<%
	class CustomersSrv
		Private Sub Class_Initialize()
			
		End Sub
		
		public function GetAll()
			dim sql
			sql = "SELECT TOP 100 * FROM dbo.Orders"
			GetAll = Query(sql)
		end function
		
		public function GetPagging(index1,size1)
			dim sql
			sql = "SELECT TOP "+size1+" * FROM dbo.Orders "
			sql = sql + "WHERE OrderID NOT IN (SELECT TOP (("+index1+"-1)*"+size1+") OrderID FROM dbo.Orders ORDER BY OrderID) "
			sql = sql + "ORDER BY OrderID"
			'response.Write(Query(sql))
			'response.End()
			GetPagging = Query(sql)
		end function		
	end class
%>