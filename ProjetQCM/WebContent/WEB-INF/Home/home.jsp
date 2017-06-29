<%@ include file="../General/head.jsp" %>
<%@ include file="../General/header.jsp" %>
<% if(request.getAttribute("formateur") != null) {%>
	<%@ include file="../General/formateurEni.jsp" %>
<%} else {%>
	<%@ include file="homeBody.jsp" %>
<%} %>
<%@ include file="../General/footer.jsp" %>