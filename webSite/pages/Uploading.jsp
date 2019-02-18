<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import = "java.sql.*" %>
<%@page import = "java.io.*" %>
<%String power = request.getParameter("power"); String controlStr = ""; String line = "";%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1><%=power%> 을 합니다. </h1>
<%try {
	File file = new File("C://Users/Muk/eclipse-workspace/Wayne/WebContent/webSite/pages/Power.txt");
	BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(file));
	bufferedWriter.write(power);
	bufferedWriter.flush();
	bufferedWriter.close();
} catch(FileNotFoundException e) {
} catch(IOException e) {
	}
	%>
<script>
	alert( "동작합니다! " );
	window.history.back();
</script>
</body>
</html>

