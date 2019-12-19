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
    <link rel="stylesheet" href="views/styles/dashboard.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!-- jQuery Modal -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
    <title>Dashboard</title>

</head>

<body>

<%@include file="/header.jsp" %>
<main>
    <section class="px-3 py-3 pt-md-5 pb-md-4 mx-auto dashboardHeader">
        <div id="popup" class="modal">
            <h4>Add new project</h4>
            <form method="post">
                <label for="name" maxlength="50">Name</label>
                <input type="text" id="name" name="name" placeholder="Project name.." maxlength="25" required>

                <label for="startDate">Start Date</label>
                <input type="date" id="startDate" name="startDate" required>
                <label for="endDate">End Date</label>
                <input type="date" id="endDate" name="endDate" required><br>
                <label for="description">Description</label>
                <textarea id="description" name="description" maxlength="1000" required>Describe the project...</textarea>
                <label for="milestones">Milestone <br>Add each milestone separated by comma </label>
                <textarea id="milestones" name="milestones" maxlength="500" required>Project Milestones..</textarea><br>
                <input type="submit" value="Create Project" style="width:150px" onclick="self.close()">
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
                                "<h4 class=\"card-title pricing-card-title\">" +p.getCompletionPercentage() + "<small class=\"text-muted\"> %</small></h4>" +
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

        <jsp:include page="footer.jsp"/>
    </div>
</main>

<script src="views/Scripts/scripts.js"></script>
</body>
</html>