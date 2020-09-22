<%@ page import="com.apex.Shop" %>
<%@ page import="com.apex.ShopReg" %>
<%@ page import="java.util.List" %>
<%@ page import="java.io.PrintWriter" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<jsp:include page="../HEAD.jsp"/>

<body id="page-top">
<div id="wrapper">
    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
            <jsp:include page="./NAVBTN/ShopManager.jsp"/>
            <div class="container-fluid">
                <h3 class="text-dark mb-4">Shop Manager</h3>
                <div class="card shadow">
                    <div class="card-header py-3">
                        <button type="button" class="btn btn-outline-success" data-toggle="modal" data-target="#AddShopModal">Add a Shop</button>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive table mt-2" id="dataTable" role="grid"
                             aria-describedby="dataTable_info">
                            <table class="table my-0" id="dataTable2">
                                <%
                                    ShopReg ShopReg = new ShopReg();
                                    List<Shop> ShopList = ShopReg.GetAllShops();
                                %>
                                <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Shop Address </th>
                                    <th>Email</th>
                                    <th>Owner</th>
                                    <th>Tel.No</th>
                                    <th>Verified</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <tbody>
                                <% for (Shop shop : ShopList) { %>
                                <tr>
                                    <td>
                                        <%= shop.ShopName%>
                                    </td>
                                    <td>
                                        <%= shop.Address%>
                                    </td>
                                    <td>
                                        <%= shop.Email%>
                                    </td>
                                    <td>
                                        <%= shop.FName +" " + shop.LName%>
                                    </td>
                                    <td>
                                        <%= shop.Telephone%>
                                    </td>
                                    <td>
                                        <%
                                            String HiddenA= " ";
                                            String HiddenB= " ";
                                        if (shop.ISVerified){
                                            HiddenA = "hidden";
                                        } else {
                                            HiddenB = "hidden";
                                        }
                                        %>


                                        <form <%= HiddenA%> style="padding: 0;margin: 0" action="${pageContext.request.contextPath}/Admin/ShopsManager" method="post">
                                        <input hidden type="text" name="Verify" value="<%= shop.Email%>">
                                        <button class="btn btn-success" type="submit">Verify</button>
                                        </form>

                                        <p <%= HiddenB%> style="color: green">Verified<p>

                                    </td>

                                    <td>
                                     <div class="dropdown">
                                            <button  class="btn btn-success">Actions</button>
                                            <div class="dropdown-content">
                                                <a data-target="#DelModal" data-toggle="modal" data-id="<%=shop.Email%>" title="Add this item" class="btn btn-light btn-block">Delete</a>


                                                <form style="padding: 0;margin: 0" action="${pageContext.request.contextPath}/Admin/ShopsManager" method="post">
                                                    <input hidden type="text" name="DeVerify" value="<%=shop.Email%>">
                                                    <button class="btn btn-light btn-block" type="submit">De-Verify
                                                    </button>
                                                </form>

                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <% } %>


                                </tbody>
                                <tfoot>
                                <tr>
                                    <th>Name</th>
                                    <th>Shop Address </th>
                                    <th>Email</th>
                                    <th>Owner</th>
                                    <th>Tel.No</th>
                                    <th>Verified</th>
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

<jsp:include page="/SuperAdmin/Modals/AddShopModel.jsp"/>
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
                    <form style="padding: 0;margin: 0" action="${pageContext.request.contextPath}/Admin/ShopsManager" method="post">
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