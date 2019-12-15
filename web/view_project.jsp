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
    <link href="pricing.css" rel="stylesheet">
    <link href="/views/styles/project.css" rel="stylesheet">
</head>


<body>
<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-blue border-bottom shadow-sm">
    <img class="my-0 mr-md-auto" src="views/images/logo.png" height="45">
    <nav class="my-2 my-md-0 mr-md-3">
        <a class="p-2 text-dark" href="#">Dashboard</a>
        <a class="p-2 text-dark" href="#">Team</a>
        <a class="p-2 text-dark" href="view_project.jsp">About</a>
        <a class="p-2 text-dark" href="addProject.jsp">Help</a>
    </nav>
    <a class="btn btn-outline-primary" href="#">Sign up</a>
</div>

<div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
    <h1 class="display-4">${ project.getProjectName()}</h1>
</div>

<div class="container">
    <div class="row">
        <div class="col-sm-7" style="border-right:1px black solid;">
            <p><span style="font-weight: bold">Start date:</span> November 1st, 2019</p>
            <p><span style="font-weight: bold">End date:</span> December 31st, 2019</p>
            <p style="font-weight: bold">Project Full description:</p>
            <p>Lorem Ipsum is simply dummy text of the printing and typesetting
                industry. Lorem Ipsum has been the industry's standard dummy
                industry. Lorem Ipsum has been the industry's standard dummy
                industry. Lorem Ipsum has been the industry's standard dummy
                industry. Lorem Ipsum has been the industry's standard dummy
                industry. Lorem Ipsum has been the industry's standard dummy
                industry. Lorem Ipsum has been the industry's standard dummy
            </p>
        </div>

        <div class="col-sm-5">
            <h2>Milestones</h2>
            <table class="table table-borderless">
                <tr>
                    <th scope="col">Name</th>
                    <th scope="col">Status</th>
                </tr>
                <tr>
                    <td scope="row">Introduction</td>
                    <td class="green">Completed</td>
                </tr>
                <tr>
                    <td scope="row">Development</td>
                    <td class="red">Incomplete</td>
                </tr>
                <tr>
                    <td scope="row">Conclusion</td>
                    <td class="red">Incomplete</td>
                </tr>
            </table>
        </div>
    </div>

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
</div>
</body>
</html>
