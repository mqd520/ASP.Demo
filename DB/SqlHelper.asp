<%
	dim connstr,conn
	'connstr="DRIVER={SQL Server}; SERVER=Mqd-PC\MSSQL2008; DATABASE=Northwind; USER=sa; PASSWORD=hytgku548098;"
	'connstr="Provider=Microsoft.ACE.OleDb.12.0;Data Source="&root& "DB\Northwind.2003.mdb" 
	connstr = "Driver={SQL Server};server=Mqd-PC\MSSQL2008;database=Northwind;uid=sa;pwd=hytgku548098;"
	set conn = server.CreateObject("ADODB.connection")
	
	' 查询数据
	function Query(sql)
		dim rs,return
		set rs = server.CreateObject("ADODB.recordset")
		conn.open connstr
		rs.open sql,conn,1,1
		return = "["
		for i=1 to rs.RecordCount step 1
			dim row
			row = "{"
			for j=0 to rs.fields.count-1 step 1
				on error resume next
				dim val
				val = rs(j)
				if isnull(val) then
					val = ""
				elseif isnumeric(val) or isdate(val) then 
					val = cstr(val)					
				end if
				row = row & """"+rs(j).name+""":"""+val+""","
				'if err.number<>0 then
					'response.Write(row)
					'response.End()
				'end if
			next
			row = left(row,len(row)-1) & "},"
			return = return + row
			rs.movenext
		next
		return = left(return,len(return)-1) & "]"
		rs.close()
		conn.close()
		set rs = nothing
		Query = return
	end function
	
	
	' 执行无查询
	function ExecuteNoQuery(sql)
		 
	end function
%>
