<%@page import="java.util.List"%>
<%@page import="js.bean.DemoBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Check box</title>
</head>
<body>
	<%
		List<DemoBean> a = (List<DemoBean>)request.getAttribute("listDemoBean");
		String[] arr = {"one", "three"};
	%>
	<%int no = 0; for ( DemoBean demo : a ){ ++no; %>
		<%String func = "nyukai".concat(no + "()"); %>
		<input onclick= "<%=func %>" name = "nyukai" type="checkbox" value="<%=demo.getId() %>" id="<%=demo.getId() %>" /> <%=demo.getValue() %><br/>
	<%} %>
	
	<%for ( DemoBean demo : a ){ %>
		<%for(String ar : arr){ %>
		<%if(ar.equals(demo.getId())){ %>>
		<%= demo.getValue() %>
	<%} } }%>
</body>
<script>
function limit(){
	<% int limit = 0; for ( DemoBean demo : a ){ limit++; %>
	
	<%} %>	
	return <%=limit%>;
}
//------------------------------------------------
 var ok = 0;
 var checkNo = limit()-1;
<% no = 0; %> 
<% for ( DemoBean demo : a ){ ++no; %>
	<%String func = "function nyukai".concat(no + "(){"); %>
	<%=func %>
		var id = document.getElementById("<%=demo.getId()%>");
		var id_value = document.getElementById("<%=demo.getId()%>").value;
		if(id.checked === true && id_value === 'all'){
			ok = 0;
			//checkNo = limit()-1;
			<%for ( DemoBean demo1 : a ){ %>
				document.getElementById('<%=demo1.getId()%>').checked = true;
			<%}%>
		}else if (id.checked === false && id_value === 'all'){
			ok = 0;
			//checkNo = limit()-1;
			<%for ( DemoBean demo1 : a ){ %>
				document.getElementById('<%=demo1.getId()%>').checked = false;
			<%}%>
		}else if(id.checked === true && id_value !== 'all'){
			ok++;
			//checkNo--;
			console.log("ok++ " + ok + ", checkNo-- " + checkNo)
			if(ok ===  (limit()-1) || ok == 0){
				document.getElementById("all").checked = true
			}
		}else if(id.checked === false && id_value !== 'all'){
			ok--;
			//checkNo++;
			console.log("ok-- " + ok + ", checkNo++ " + checkNo)
			<%for ( DemoBean demo1 : a ){ %>
				id.checked = false
				document.getElementById('all').checked = false;
				if(document.getElementById('<%=demo1.getId()%>').checked === false){
					document.getElementById('<%=demo1.getId()%>').checked = false;
				}
			<%}%>
		}
	<%="}" %>
<%} %>
	
</script>
</html>