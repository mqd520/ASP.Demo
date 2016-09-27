<!--#include virtual="Service/Customers.asp"-->
<%
	on error resume next
	dim action,json,srv
	action = request("action")
	set srv = new CustomersSrv
	select case lcase(action)
		case "all"
			json = srv.GetAll()
		case "pagging"
			index1 = request("page")
			size1 = request("rows")
			json = srv.GetPagging(index1,size1)			
		case else
			json = "[]"
	end select
	set srv = nothing
	json = "{""rows"":"+json+",""total"":830}"
	response.Write(json)
	response.Flush()
%>