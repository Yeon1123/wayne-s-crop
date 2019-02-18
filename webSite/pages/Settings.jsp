<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import = "java.sql.*" %>
<%@page import = "java.io.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

<% String line = "";%>

<title>Wayne's Crop | Pages | Settings</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="../layout/styles/layout.css" rel="stylesheet"
	type="text/css" media="all">
</head>
<body id="top">



	<!-- Top Background Image Wrapper -->
	<div class="bgded overlay"
		style="background-image: url('../images/demo/backgrounds/01.png');">

		<div class="wrapper row1">
			<header id="header" class="hoc clear">

				<div id="logo" class="fl_left">
					<h1>
						<a href="../index.html">Wayne's Crop</a>
					</h1>
				</div>
				<nav id="mainav" class="fl_right">
					<ul class="clear">
						<li class="active"><a href="../index.html">Home</a></li>
						<li><a href="About.html">About</a></li>
						<li><a class="drop" href="#!">Pages</a>
							<ul>
								<li><a href="Summary%20Survey.html">Summary Survey</a></li>
								<li><a href="View%20Data.html">View Data</a></li>
								<li><a href="Data%20Analysis.html">Data Analysis</a></li>
								<li><a href="Eco%20System.html">Eco System</a></li>
								<li><a href="About%20Details.html">About Details</a></li>
								<li><a href="Settings.jsp">Settings</a></li>
							</ul></li>
						<li><a href="gallery.html">Gallery</a></li>
					</ul>
				</nav>

			</header>
		</div>



		<div class="wrapper row2">
			<div id="breadcrumb" class="hoc clear">

				<ul>
					<li><a href="../index.html">Home</a></li>
					<li><a href="#!">Pages</a></li>
					<li><a href="Settings.jsp">Settings</a></li>
				</ul>

			</div>
		</div>

	</div>
	<!-- End Top Background Image Wrapper -->



	<div class="wrapper row3">
		<main class="hoc container clear"> <!-- main body -->

		<div class="sidebar one_quarter first">

			<h6>Category</h6>
			<nav class="sdb_holder">
				<ul>
					<li><a class="drop" href="#!">Pages</a>
						<ul>
							<li><a href="Summary%20Survey.html">Summary Survey</a></li>
							<li><a href="View%20Data.html">View Data</a></li>
							<li><a href="Data%20Analysis.html">Data Analysis</a></li>
							<li><a href="Eco%20System.html">Eco System</a></li>
							<li><a href="About%20Details.html">About Details</a></li>
							<li><a href="Settings.jsp">Settings</a></li>
						</ul></li>
					<li><a href="gallery.html">Gallery</a></li>
				</ul>
			</nav>

		</div>


		<div class="content three_quarter">

			<h1>Settings</h1>
			<img class="imgr borderedbox inspace-5" src="../images/demo/imgr.gif"
				alt="">
				<div id="Power">
				<%try {
					File file = new File("C://Users/Muk/eclipse-workspace/Wayne/WebContent/webSite/pages/Power.txt");
					FileReader filereader = new FileReader(file);
					BufferedReader bufReader = new BufferedReader(filereader);
	
					while((line = bufReader.readLine()) != null) {
						%><h1><%=line%></h1>
					<%}
	
					bufReader.close();
					} catch(FileNotFoundException e) {
					//System.out.println(e);
					} catch(IOException e) {
					//System.out.println(e);
					}
					%>
					</div>
	
			<form action="Control.jsp" method="post">
				  <input type="radio" name="control" value="on" checked>on<br>
  				  <input type="radio" name="control" value="off">off<br>
				<input type="submit" value="Submit">
			</form>
			<p>Aliquatjusto quisque nam consequat doloreet vest orna partur
				scetur portortis nam. Metadipiscing eget facilis elit sagittis
				felisi eger id justo maurisus convallicitur.</p>
			<p>
				Dapiensociis <a href="#!">temper donec auctortortis cumsan</a> et
				curabitur condis lorem loborttis leo. Ipsumcommodo libero nunc at in
				velis tincidunt pellentum tincidunt vel lorem.
			</p>
			<img class="imgl borderedbox inspace-5" src="../images/demo/imgl.gif"
				alt="">
			<p>
				This is a W3C compliant free website template from <a
					href="https://www.os-templates.com/" title="Free Website Templates">OS
					Templates</a>. For full terms of use of this template please read our <a
					href="https://www.os-templates.com/template-terms">website
					template licence</a>.
			</p>
			<p>
				You can use and modify the template for both personal and commercial
				use. You must keep all copyright information and credit links in the
				template and associated files. For more website templates visit our
				<a href="https://www.os-templates.com/">free website templates</a>
				section.
			</p>
			<p>Portortornec condimenterdum eget consectetuer condis consequam
				pretium pellus sed mauris enim. Puruselit mauris nulla
				hendimentesque elit semper nam a sapien urna sempus.</p>
			<h1>Table(s)</h1>
			<div class="scrollable">
				<table>
					<thead>
						<tr>
							<th>Header 1</th>
							<th>Header 2</th>
							<th>Header 3</th>
							<th>Header 4</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><a href="#!">Value 1</a></td>
							<td>Value 2</td>
							<td>Value 3</td>
							<td>Value 4</td>
						</tr>
						<tr>
							<td>Value 5</td>
							<td>Value 6</td>
							<td>Value 7</td>
							<td><a href="#!">Value 8</a></td>
						</tr>
						<tr>
							<td>Value 9</td>
							<td>Value 10</td>
							<td>Value 11</td>
							<td>Value 12</td>
						</tr>
						<tr>
							<td>Value 13</td>
							<td><a href="#!">Value 14</a></td>
							<td>Value 15</td>
							<td>Value 16</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

		<!-- / main body -->
		<div class="clear"></div>
		</main>
	</div>



	<div class="wrapper row5">
		<div id="copyright" class="hoc clear">

			<p class="fl_left">
				Copyright &copy; 2018 - All Rights Reserved - <a
					href="../index.html">Wayne's Crop</a>
			</p>
			<p class="fl_right">
				Template by <a target="_blank" href="https://www.os-templates.com/"
					title="Free Website Templates">OS Templates</a>
			</p>

		</div>
	</div>



	<a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
	<!-- JAVASCRIPTS -->
	<script src="../layout/scripts/jquery.min.js"></script>
	<script src="../layout/scripts/jquery.backtotop.js"></script>
	<script src="../layout/scripts/jquery.mobilemenu.js"></script>
	<script></script>
</body>
</html>