
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
                        <h3>Login</h3>
                        <div class="form-group"><label for="email">Email</label><input class="form-control item" type="email" id="email" /></div>
                        <div class="form-group"><label for="password">Password</label><input class="form-control" type="password" id="password" /></div>
                        <div class="form-group"><div class="form-check"><input class="form-check-input" type="checkbox" id="checkbox" /><label class="form-check-label" for="checkbox">Remember me</label></div>
                        </div>
                        <button class="btn btn-success btn-block" type="submit">Log In</button>
                        <button class="btn btn-outline-success btn-block" type="submit">Register</button>
                        <br>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
