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
<h1>Do <%=power%> </h1>
<%try {
	File file = new File("Power.txt");
	BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(file));
	bufferedWriter.write(power);
	bufferedWriter.flush();
	bufferedWriter.close();
} catch(FileNotFoundException e) {
} catch(IOException e) {
	}
	%>
<script>
	alert( "It works! " );
	window.history.back();
</script>
</body>
</html>

