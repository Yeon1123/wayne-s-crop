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

<h1><%=control%> 을 합니다. </h1>
<%try {
	File file = new File("C://Users/Muk/eclipse-workspace/Wayne/WebContent/webSite/pages/Control.txt");
	BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(file));
	bufferedWriter.write(control);
	//bufferedWriter.newLine();
	bufferedWriter.flush();
	bufferedWriter.close();
	FileReader filereader = new FileReader(file);
	BufferedReader bufReader = new BufferedReader(filereader);
	
	while((line = bufReader.readLine()) != null) {
		//System.out.println(line);
	}
	
	bufReader.close();
} catch(FileNotFoundException e) {
	//System.out.println(e);
} catch(IOException e) {
	//System.out.println(e);
	}
	%>
	<h1></h1>
<script>
	alert( "동작합니다! " );
	//history.go(-1);
	window.history.back();
</script>
</body>
</html>

