<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>&ndash;%&gt;--%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="alu.webdev.app.entities.Project" %>
<%@ page import="alu.webdev.app.entities.Milestone" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v3.8.6">
    <title>Project</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <!-- Favicons -->
    <meta name="theme-color" content="#563d7c">

    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="/views/styles/dashboard.css">
    <link href="pricing.css" rel="stylesheet">
    <link href="/views/styles/project.css" rel="stylesheet">
</head>


<body>
<%@include file="/header.jsp" %>


<div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
    <h1 class="display-4">${project.projectName}</h1>
</div>

<div class="container">
    <div class="row">
        <div class="col-sm-6" style="border-right:1px black solid;">
            <p><span style="font-weight: bold">Start date:</span> ${project.startDate}</p>
            <p><span style="font-weight: bold">End date:</span>${project.endDate}</p>
            <p style="font-weight: bold">Project Full description:</p>
            <p>
                ${project.description}
            </p>
        </div>

        <div class="col-sm-6">

            <h2>Milestones</h2>
            <table class="table table-borderless">
            <%
                ArrayList<Milestone> milestones = (ArrayList<Milestone>) ((Project) request.getAttribute("project")).getMilestones();
                if (milestones != null && !milestones.isEmpty()) {
                    for (Milestone milestone : milestones) {
                        out.println("                      " +
                                "<tr>" +
                                "<td scope=\"col\">"+milestone.getName()+"</td>" +
                                "</tr>"
                        );
                    }
                } else out.println("<p>There are no milestones yet!</p>");

            %>
            </table>
        </div>
    </div>

</div>


<jsp:include page="footer.jsp"/>
</body>
</html>


