<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>--%>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v3.8.6">
    <title>Project</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.4/examples/pricing/">

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <!-- Favicons -->
    <meta name="theme-color" content="#563d7c">


    <!-- Custom styles for this template -->
    <link href="/project.css" rel="stylesheet">
</head>


<body>
<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-blue border-bottom shadow-sm">
    <img class="my-0 mr-md-auto" src="views/images/logo.png" height="45">
    <nav class="my-2 my-md-0 mr-md-3">
        <a class="p-2 text-dark" href="<%=request.getContextPath()%>/list">Dashboard</a>
        <a class="p-2 text-dark" href="#">Team</a>
        <a class="p-2 text-dark" href="#">About</a>
        <a class="p-2 text-dark" href="#">Help</a>
    </nav>
    <a class="btn btn-outline-primary" href="#">Sign up</a>
</div>

<div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
    <h1 class="display-4"><c:out value="${project.projectName}"/></h1>
    <h3 class="display-4"><c:out value="${project.projectStatus}"/></h3>
</div>

<div class="container">
    <div class="row">
        <div class="col-sm-7" style="border-right:1px black solid;">
            <p><span style="font-weight: bold">Start date:</span><c:out value="${project.startDate}" /></p>
            <p><span style="font-weight: bold">End date:</span><c:out value="${project.endDate}" /></p>
            <p style="font-weight: bold">Project Full description:</p>
            <p>
                <c:out value="${project.description}" />
            </p>
        </div>

        <div class="col-sm-5">
            <h2>Milestones</h2>
            <table class="table table-borderless">
                <tr>
                    <th scope="col">Name</th>
                </tr>
                <c:forEach items="${project.milestones}" var="milestone">
                <tr>
                    <td scope="row"><c:out value="${milestone}" /></td>
                </tr>
                </c:forEach>
            </table>
        </div>
    </div>

    <div class="d-inline">
        <a href="edit?id=<c:out value='${project.projectId}' />">Edit</a>
            &nbsp;&nbsp;&nbsp;&nbsp;
        <a href="delete?id=<c:out value='${project.projectId}' />">Delete</a>
    </div>

</div>

<jsp:include page="footer.jsp"/>
</body>
</html>
