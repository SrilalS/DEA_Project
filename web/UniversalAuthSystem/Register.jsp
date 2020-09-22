
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:include page="../HEAD.jsp"/>
<body>
<div id="wrapper">
    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
            <jsp:include page="../Home/NAVBTN/SECONAV.jsp"/>
            <div class="col">
                <br><br>
                <div class="container shadow" style="width: 25vw">
                    <form>
                        <br>
                        <h3>Register</h3>
                        <div class="dropdown">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Select User Type
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <a class="dropdown-item" href="#">Shop</a>
                                <a class="dropdown-item" href="#">Customer</a>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input class="form-control item" type="email" id="email" />
                        </div>
                        <div class="form-group">
                            <label for="fname">Full Name</label>
                            <input class="form-control item" type="email" id="fname" />
                        </div>
                        <div class="form-group">
                            <label for="pno">Phone No.</label>
                            <input class="form-control item" type="email" id="pno" />
                        </div>
                        <div class="form-group">
                            <label for="address">Address</label>
                            <input class="form-control item" type="email" id="address" />
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input class="form-control" type="password" id="password" />
                        </div>
                        <div class="form-group">
                            <label for="password">Retype Password</label>
                            <input class="form-control" type="password" id="rpassword" />
                        </div>
                        <button class="btn btn-success btn-block" type="submit">Register</button>
                        <button class="btn btn-outline-success btn-block" type="submit">Log In</button>
                        <br>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
