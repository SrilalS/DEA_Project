<%@ page import="com.apex.Shop" %>
<%@ page import="com.apex.ShopReg" %>
<%@ page import="java.util.List" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.apex.UserReg" %>
<%@ page import="com.apex.User" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<jsp:include page="../HEAD.jsp"/>

<body id="page-top">
<div id="wrapper">
    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
            <jsp:include page="./NAVBTN/CustoManager.jsp"/>
            <div class="container-fluid">
                <h3 class="text-dark mb-4">Customers Manager</h3>
                <div class="card shadow">
                    <div class="card-header py-3">
                        <button type="button" class="btn btn-outline-success" data-toggle="modal" data-target="#AddCustoModal">Add a Customer</button>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive table mt-2" id="dataTable" role="grid"
                             aria-describedby="dataTable_info">
                            <table class="table my-0" id="dataTable2">
                                <%
                                    UserReg UserReg = new UserReg();
                                    List<User> UserList = UserReg.GetAllUsers();
                                %>
                                <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Address</th>
                                    <th>Email</th>
                                    <th>BirthDay</th>
                                    <th>Tel.No</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <tbody>
                                <% for (User user : UserList) { %>
                                <tr>
                                    <td>
                                        <%= user.FName +" " + user.LName%>
                                    </td>
                                    <td>
                                        <%= user.Address%>
                                    </td>
                                    <td>
                                        <%= user.Email%>
                                    </td>
                                    <td>
                                        <%= user.BDay%>
                                    </td>
                                    <td>
                                        <%= user.Telephone%>
                                    </td>

                                    <td>


                                        <div class="dropdown">
                                            <button  class="btn btn-success">Actions</button>
                                            <div class="dropdown-content">
                                                <a data-target="#DelModal" data-toggle="modal" data-id="<%=user.Email%>" title="Add this item" class="btn btn-light btn-block">Delete</a>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <% } %>


                                </tbody>
                                <tfoot>
                                <tr>
                                    <th>Name</th>
                                    <th>Address</th>
                                    <th>Email</th>
                                    <th>BirthDay</th>
                                    <th>Tel.No</th>
                                    <th>Actions</th>
                                </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a></div>

<jsp:include page="/SuperAdmin/Modals/AddCustoModal.jsp"/>

<div class="modal fade" id="DelModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">Add A Customer</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group col-md-12">
                    <br>
                    <form style="padding: 0;margin: 0" action="${pageContext.request.contextPath}/Admin/CustomersManager" method="post">
                        <input hidden id="userdelemail" type="text" name="Delete" value="">
                        <h5 id="mdltitle" class="modal-title">Are You Sure?</h5>
                        <br>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-outline-success" data-dismiss="modal">Cancel</button>
                            <input type="submit" class="btn btn-danger" value="Delete">
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $('#DelModal').on('shown.bs.modal', function(event) {
        var reference_tag = $(event.relatedTarget);
        var id = reference_tag.data('id');
        var mdlinput= document.getElementById("userdelemail");
        mdlinput.value = id;
    })
</script>

</body>

</html>
