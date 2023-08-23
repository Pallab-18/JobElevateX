<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored ="false" %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Page</title>
<%@include file="all_components/all_css.jsp"%>

<style type="text/css">
.back-img
{
  background: url("img/admin3.jpeg");
  height:90vh;
  width:100%;
  background-repeat: no-repeat;
  background-size: cover;
}


</style>


</head>
<body>

       <c:if test="${userobj.role ne 'admin'}">
        <c:redirect url="login.jsp"></c:redirect>
       </c:if>


<%@include file="all_components/navbar.jsp"%>

  <div class="container-fluid back-img">
     <div class="text-center">
          <h1 class="p-2 mb-3 bg-light text-dark font-weight-bold text-center">WELCOME ADMIN</h1>
    </div>
  </div>

</body>
</html>