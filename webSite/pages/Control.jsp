<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import = "java.sql.*" %>
<%@page import = "java.io.*" %>


<%String control = request.getParameter("control");
	String controlStr = "";
	String line = "";%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<h1>Do <%=control%> </h1>
<%try {
	File file = new File("Control.txt");
	BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(file));
	bufferedWriter.write(control);
	bufferedWriter.flush();
	bufferedWriter.close();
	FileReader filereader = new FileReader(file);
	BufferedReader bufReader = new BufferedReader(filereader);
	
	while((line = bufReader.readLine()) != null) {
	}
	
	bufReader.close();
} catch(FileNotFoundException e) {
} catch(IOException e) {
	}
	%>
	<h1></h1>
<script>
	alert( "It works! " );
	//history.go(-1);
	window.history.back();
</script>
</body>
</html>

