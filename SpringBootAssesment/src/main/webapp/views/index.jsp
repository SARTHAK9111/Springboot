	<%-- JSP Page Directive --%>
	<%@page import="java.time.LocalDateTime"%>
	<%@page import="java.util.List"%>
	<%@page import="java.util.Date"%>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8" isELIgnored="false"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
		crossorigin="anonymous">
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<style>
	p {
		color: white;
		background-color: black;
		padding: 10px;
	}
	.heading {
		padding: 80px;
		font-size: 40px;
		background-color: beige;
		color:#58ae3a;
	}
	</style>

	</head>
	<body>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="container-fluid">
				<a class="navbar-brand" href="#">Book Store</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<!-- <li class="nav-item"><a class="nav-link active"
							aria-current="page" href="index.jsp">Home</a></li> -->
						<%
						String id = (String) session.getAttribute("email");
			
						if (id == null) {
						%>
						<li class="nav-item"><a class="nav-link" href="login">Login</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="register">Register</a>
						</li>
						<%}else{ %>
						<li class="nav-item"><a class="nav-link" href="${pageContext.servletContext.contextPath}/dashboard">Dashboard</a>
						<li class="nav-item"><a class="nav-link" href="${pageContext.servletContext.contextPath}/logout">Logout</a>
						</li>
						<form class="form-inline my-2 my-lg-0">

							<h3 class="my-2 my-sm-0 text-light"><%
							String name = (String) session.getAttribute("username");
							out.print(name);
							%></h3>
						</form>

						<% Object role = session.getAttribute("role"); 
						if(role!=null){%>
						<li class="nav-item"><a class="nav-link" href="${pageContext.servletContext.contextPath}/admin">Admin</a>
						</li>
						<%}%>

						<%}%>
						
					</ul>
				</div>
			</div>
		</nav>

		<h1 class='text-center heading'>Book Store</h1>
		<!-- <img src='resources/images/torn.jpeg'/> -->
		<%-- <div class="container-fluid d-flex p-2">
		<a href="${pageContext.servletContext.contextPath}/home">
		<button type="button" class="btn btn-primary btn-lg">Click To See All Books</button>
		</a>
		
		</div> --%>
		<div class="row">
			<c:forEach items="${books}" var="book">
				
	            <div class="col-md-4">
	                <div class="card p-3">
	                    <div class="d-flex flex-row mb-3"><img src="https://i.imgur.com/ccMhxvC.png" width="70">
	                        <div class="d-flex flex-column ml-2"><span>${book.bookname}</span><span class="text-black-50">${book.authorname} </span><span class="ratings"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i></span></div>
	                    </div>
	                   </div>
	            </div>
			</c:forEach>
			</div>
		</div>
	

		
	</body>
	</html>