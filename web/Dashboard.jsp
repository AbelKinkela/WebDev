
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
            <form action="/" method="post">
                <label for="name">Name</label>
                <input type="text" id="name" name="name" placeholder="Project name.." required>

                <label for="startDate">Start Date</label>
                <input type="date" id="startDate" name="startDate" placeholder="Project starting date.." required>
                <label for="endDate">End Date</label>
                <input type="date" id="endDate" name="endDate" placeholder="Project end date.." required>
                <label for="description">End Date</label>
                <textarea id="description" name="description" required>Describe the project...</textarea>

                <input type="submit" value="Create Project">
            </form>



            <a href="#" rel="modal:close">Close</a>

        </div>
        <div>
            <a href="#popup" rel="modal:open"><img src="views/images/Add.png" alt="Add a new project"></a>
            <h2>Your Projects</h2>
        </div>


        <!-- Link to open the modal -->

    </section>

    <section class="container">
        <div class="card-deck mb-3 text-center">
<%
    ArrayList<Project> projects = (ArrayList<Project>) request.getAttribute("projects");
    if (projects != null && !projects.isEmpty()) {
        for (Project p : projects) {
            out.println("                      " +
                    "<div class=\"card mb-4 shadow-sm\">\n" +
                    "<div class=\"card-header\">" +
                    "<h4 class=\"my-0 font-weight-normal\">" + p.getName() + "</h4>" +
                    "</div>" +
                    "<div class=\"card-body\">\n" +
                    "<h1 class=\"card-title pricing-card-title\">" + p.getCompletionPercentage() + "<small class=\"text-muted\"> % Complete</small></h1>" +
                    "<ul class=\"list-unstyled mt-3 mb-4\">" +
                    "<li>Day " + p.getDays() + " of " + p.getTotalDuration() + " days </li>" +
                    "<li>3 milestones</li>" +
                    "</ul>"+
                    "</div>"+
                    "</div>"

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
    </section>
</main>

<script src="views/Scripts/scripts.js"></script>
</body>
</html>