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

    <link rel="canonical" href="https://getbootstrap.com/docs/4.4/examples/pricing/">

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <!-- Favicons -->
    <meta name="theme-color" content="#563d7c">


    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="/views/styles/styles.css">
    <link href="pricing.css" rel="stylesheet">
    <link href="/views/styles/project.css" rel="stylesheet">
</head>


<body>

<header>
    <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 border-bottom box-shadow topNav">
        <img class="my-0 mr-md-auto" src="/views/images/logo.png" height="45" alt="HotTracker">
        <nav class="my-2 my-md-0 mr-md-3 topNavMenu">
            <a href="${pageContext.request.contextPath}/">Dashboard</a>
            <a href="${pageContext.request.contextPath}/team">Team</a>
            <a href="${pageContext.request.contextPath}/about">About</a>
            <a href="${pageContext.request.contextPath}/help">Help</a>
        </nav>
        <a class="btn btn-primary" href="#">Sign up</a>
    </div>
</header>


<div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
    <h1 class="display-4">${project.projectName}</h1>
</div>

<div class="container">
    <div class="row">
        <div class="col-sm-7" style="border-right:1px black solid;">
            <p><span style="font-weight: bold">Start date:</span> ${project.startDate}</p>
            <p><span style="font-weight: bold">End date:</span>${project.endDate}</p>
            <p style="font-weight: bold">Project Full description:</p>
            <p>
                ${project.description}
            </p>
        </div>






        <div class="col-sm-5">

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


<footer class="pt-4 my-md-5 pt-md-5 border-top">
    <div class="row">
        <div class="col-12 col-md">
            <img class="mb-2" src="https://getbootstrap.com/docs/4.0/assets/brand/bootstrap-solid.svg" alt="" width="24"
                 height="24">
            <small class="d-block mb-3 text-muted">&copy; 2017-2018</small>
        </div>
        <div class="col-6 col-md">
            <h5>Features</h5>
            <ul class="list-unstyled text-small">
                <li><a class="text-muted" href="#">Cool stuff</a></li>
                <li><a class="text-muted" href="#">Random feature</a></li>
                <li><a class="text-muted" href="#">Team feature</a></li>
                <li><a class="text-muted" href="#">Stuff for developers</a></li>
                <li><a class="text-muted" href="#">Another one</a></li>
                <li><a class="text-muted" href="#">Last time</a></li>
            </ul>
        </div>
        <div class="col-6 col-md">
            <h5>Resources</h5>
            <ul class="list-unstyled text-small">
                <li><a class="text-muted" href="#">Resource</a></li>
                <li><a class="text-muted" href="#">Resource name</a></li>
                <li><a class="text-muted" href="#">Another resource</a></li>
                <li><a class="text-muted" href="#">Final resource</a></li>
            </ul>
        </div>
        <div class="col-6 col-md">
            <h5>About</h5>
            <ul class="list-unstyled text-small">
                <li><a class="text-muted" href="#">Team</a></li>
                <li><a class="text-muted" href="#">Locations</a></li>
                <li><a class="text-muted" href="#">Privacy</a></li>
                <li><a class="text-muted" href="#">Terms</a></li>
            </ul>
        </div>
    </div>
</footer>
</body>
</html>


