<%@page import="com.entity.Jobs"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.JobDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User: Home</title>
<%@include file="all_components/all_css.jsp"%>
</head>

<body style="background-color: #f0f1f2">

	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>


	<%@include file="all_components/navbar.jsp"%>

	<div class="continer">
		<div class="row">
			<div class="col-md-12">
				<h5 class="text-center text-primary mt-2">All Jobs</h5>

				<c:if test="${not empty succMsg }">
					<h4 class="text-center text-primary">${succMsg }</h4>
					<c:remove var="succMsg"></c:remove>
				</c:if>


				<div class="card col-md-10 offset-md-1">
					<div class="card-body">


						<form class="form-inline" action="more_view.jsp" method="get">

							<div class="form-group col-md-5 mt-1">
								<h5>Location</h5>
							</div>

							<div class="form-group col-md-4 mt-1">
								<h5>Category</h5>
							</div>

							<div class="form-group col-md-5">
								<select name="loc" class="custom-select"
									id="inlineFormCustomSelectPref">

									<option selected value="lo">Choose...</option>
									<option value="Odisha">Odisha</option>
									<option value="Jharkhand">Jharkhand</option>
									<option value="Kolkata">Kolkata</option>
									<option value="Delhi">Delhi</option>
									<option value="Pune">Pune</option>
									<option value="Hyderabad">Hyderabad</option>
									<option value="Bangalore">Bangalore</option>
									<option value="Chennai">Chennai</option>
									<option value="Mumbai">Mumbai</option>
									<option value="Gurgaon">Gurgaon</option>
									<option value="Shimla">Shimla</option>
								</select>
							</div>


							<div class="form-group col-md-5">
								<select name="cat"
									class="custom-select" id="inlineFormCustomSelectPref">

									<option selected value="ca">Choose...</option>
									<option value="IT">IT</option>
									<option value="Developer">Developer</option>
									<option value="QA Engineer">QA Engineer</option>
									<option value="Data Analyst">Data Analyst</option>
									<option value="SQL Developer">SQL Developer</option>

								</select>
							</div>

                   			    <button class="btn btn-success">Submit</button>
						</form>
						
					</div>
				</div>
				
				
				<%
				JobDao dao=new JobDao(DBConnect.getConn());
				List<Jobs> list=dao.getAllJobsForUser();
				for(Jobs j:list)
				{
				%>
				
				<div class="card mt-2 col-md-10 offset-md-1">
				   <div class="card-body">
				       <div class="text-center text-primary">
				          <i class="far fa-clipboard fa-2x"></i>
				       </div>
				       
				       <h6><%=j.getTitle() %></h6>
				       
				       <%
				       if(j.getDescription().length() >0 && j.getDescription().length() <120){
				       %>
				       
				       <p><%=j.getDescription()%>.</p>
				       
				       
				       <%
				        } else {
				       %>
				       <p><%=j.getDescription().substring(0,120) %>...</p>
				       <%
				        }
				       %>
				       
				       
				       <br>
				       <div class="form-row">
				          <div class="form-group col-md-3">
				             <input type="text" class="form-control form-control-sm"
				             value="Location :<%=j.getLocation()%>" readonly>
				          </div>
				          
				           <div class="form-group col-md-3">
				             <input type="text" class="form-control form-control-sm"
				             value="Category :<%=j.getCategory()%>" readonly>
				          </div>
				       
				       </div>
				       
				       <h6>
				       Publish Date :
				       <%=j.getPdate().toString() %>
				       </h6>
				       
				       <div class="text-center">
				       
				         <a href="one_view.jsp?id=<%=j.getId() %>"
				         class="btn btn-sm bg-success text-white">View More</a>
				         
				       </div>
				       
				       
				   </div>
				</div>
				
				
				
				<%	
				}
				%>
				
				
				
			</div>
		</div>
	</div>


</body>
</html>