
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>&ndash;%&gt;--%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="alu.webdev.app.entities.Project" %>
<!doctype html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="views/styles/styles.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!-- jQuery Modal -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
    <title>Dashboard</title>

</head>

<body>

<header>
    <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 border-bottom box-shadow topNav">
        <img class="my-0 mr-md-auto" src="views/images/logo.png" height="45" alt="HotTracker">
        <nav class="my-2 my-md-0 mr-md-3 topNavMenu">
            <a href="${pageContext.request.contextPath}/">Dashboard</a>
            <a href="${pageContext.request.contextPath}/team">Team</a>
            <a href="${pageContext.request.contextPath}/about">About</a>
            <a href="${pageContext.request.contextPath}/help">Help</a>
        </nav>
        <a class="btn btn-primary" href="#">Sign up</a>
    </div>
</header>
<main>
    <section class="px-3 py-3 pt-md-5 pb-md-4 mx-auto dashboardHeader">
        <div id="popup" class="modal">
            <h2>Add new Project</h2>
            <form method="post">
                <label for="name">Name</label>
                <input type="text" id="name" name="name" placeholder="Project name.." maxlength="25" required>

                <label for="startDate">Start Date</label>
                <input type="date" id="startDate" name="startDate" required>
                <label for="endDate">End Date</label>
                <input type="date" id="endDate" name="endDate" required>
                <label for="description">End Date</label>
                <textarea id="description" name="description" required>Describe the project...</textarea>
                <label for="milestones">Milestone</label><br> add each milestone separated by comma
                <textarea id="milestones" name="milestones" required>Describe the project...</textarea>

                <input type="submit" value="Create Project" onclick="self.close()">
            </form>



            <a href="" rel="modal:close">Cancel</a>

        </div>
        <div>
            <a href="#popup" rel="modal:open"><img src="views/images/Add.png" alt="Add a new project"></a>
            <h2>Your Projects</h2>
        </div>


        <!-- Link to open the modal -->

    </section>

    <div class="container">
        <div class="row text-center">
<%
    ArrayList<Project> projects = (ArrayList<Project>) request.getAttribute("projects");
    if (projects != null && !projects.isEmpty()) {
        for (Project p : projects) {
            out.println("                      " +
                    "<a class=\"col-sm-3 projectCard\" href=\"/project/" + p.getProjectId() +
                    "\" >"+
                        "<div class=\"card mb-4 border-primary bg-white\" style=\"height:250px; border-radius: 30px; box-shadow: 0px 5px #2D9CDB;\" >\n" +
                            "<div>" +
                                "<h4 class=\"my-0 font-weight-bold mt-3\">" + p.getProjectName() + "</h4>" +
                            "</div>" +
                            "<div class=\"card-body\">\n" +
                                "<p>Day " + p.getCurrentProjectDuration() + " of " + p.getProjectTotalDays() + " days </p>" +
                                "<h4 class=\"card-title pricing-card-title\">" +"50"+ "<small class=\"text-muted\"> %</small></h4>" +
                                "<h5>Complete</h5>"+
                                "<ul class=\"list-unstyled mt-3 mb-4\">" +
                                    "<li> </li>" +
                                "</ul>"+
                            "</div>"+
                        "</div>"+
                    "</a>"

            );
        }
    } else out.println("<p>There are no projects yet!</p>");
%>
        </div>

        <footer class="pt-4 my-md-5 pt-md-5 border-top">
            <div class="row">
                <div class="col-12 col-md">
                    <img class="mb-2" src="https://getbootstrap.com/docs/4.0/assets/brand/bootstrap-solid.svg" alt="" width="24" height="24">
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
    </div>
</main>

<script src="views/Scripts/scripts.js"></script>
</body>
</html>
