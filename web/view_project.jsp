<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v3.8.6">
    <title>add Project</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.4/examples/pricing/">

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <!-- Favicons -->
    <meta name="theme-color" content="#563d7c">


    <!-- Custom styles for this template -->
    <link href="/styles/project.css" rel="stylesheet">

    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="/addProject.js"></script>
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
    <h1 class="display-4">Add New Assignment</h1>
</div>

<div class="container">
    <c:if test="${project != null}">
    <form action="update" method="post">
        </c:if>
        <c:if test="${project == null}">
        <form action="insert" method="post">
            </c:if>

            <caption>
                <h2>
                    <c:if test="${project != null}">
                        Edit Project
                    </c:if>
                    <c:if test="${project == null}">
                        Add New Project
                    </c:if>
                </h2>
            </caption>

            <c:if test="${project != null}">
                <input type="hidden" name="projectId" value="<c:out value='${project.projectId}' />" />
            </c:if>

            <fieldset class="form-group">
                <label for="inputName">Project Name</label> <input type="text"
                                                 value="<c:out value='${project.projectName}' />" class="form-control"
                                                 name="projectName" required="required" id="inputName" placeholder="WebDev-2">
            </fieldset>

            <fieldset class="form-group">
                <label>Project Status</label> <select class="form-control"
                                                   name="projectStatus">
                <option value="false">Ongoing</option>
                <option value="true">Completed</option>
            </select>
            </fieldset>


            <fieldset class="form-group">
                <fieldset class="form-group col-md-6">
                    <label for="inputStartDate">Start date</label> <input type="date"
                                                         value="<c:out value='${project.startDate}' />" class="form-control"
                                                         name="startDate" required="required" id="inputStartDate" placeholder="YYYY-MM-DD">
                </fieldset>

                <fieldset class="form-group col-md-6">
                    <label for="inputEndDate">End Date</label> <input type="date"
                                                         value="<c:out value='${project.endDate}' />" class="form-control"
                                                         name="projectStatus" required="required" id="inputEndDate" placeholder="YYYY-MM-DD">
                </fieldset>
            </fieldset>


            <fieldset class="form-group">
            <label for="description">Description</label> <textarea type="text"
                                                  value="<c:out value='${project.description}' />" class="form-control"
                                                                   name="description" placeholder="Description...." id="description"></textarea>
            </fieldset>


            <fieldset class="form-group">
                <fieldset class="form-group text-left mile">
                    <label for="milestone">Milestones</label>
                                                        <c:forEach items="${project.milestones}" var="milestone">
                                                        <input type="text"
                                                                       value="<c:out value='${milestone.name}' />" class="form-control"
                                                                       name="milestones" required="required" id="milestone" placeholder="Milestone"
                                                                       style="margin-bottom: 10px">
                                                        </c:forEach>
                </fieldset>

                <label for="add-more">Add new Milestone</label>
                <button class="btn btn-primary" id="add-more">
                    <i class="glyphicon glyphicon-plus"></i>
                </button>
            </fieldset>


            <button type="submit" class="btn btn-primary btn-md center-block btn-lg">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                <span><strong>Add Assignment</strong></span>
            </button>
        </form>
</div>



<footer class="pt-4 my-md-5 pt-md-5 border-top">
    <div class="row">
        <div class="col-12 col-md">
            <img class="mb-2" src="/docs/4.4/assets/brand/bootstrap-solid.svg" alt="" width="24" height="24">
            <small class="d-block mb-3 text-muted">&copy; 2017-2019</small>
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
