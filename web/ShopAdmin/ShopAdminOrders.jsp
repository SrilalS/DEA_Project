
<%@ page import="com.apex.shopadmin.OrderReg" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.security.MessageDigest" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page import="java.math.BigInteger" %>
<%@ page import="java.security.NoSuchAlgorithmException" %>
<%@ page import="com.apex.shopadmin.Order" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.apex.paymentsGateway.Payment" %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:include page="../HEAD.jsp"/>
<body id="page-top">
<div id="wrapper">
    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
            <jsp:include page="/ShopAdmin/NAVBTN/ShopAdminOrders.jsp"/>
            <div class="container-fluid">
                <h3 class="text-dark mb-4">Orders Manager</h3>
                <div class="card shadow">
                    <div class="card-body">
                        <div class="table-responsive table mt-2" id="dataTable" role="grid"
                             aria-describedby="dataTable_info">
                            <table class="table my-0" id="dataTable2">
                                <thead>
                                <%
                                    Cookie[] Cookies = request.getCookies();
                                    Cookie SHOP_VERIFY_COOKIE;
                                    Cookie[] VERIFIED_COOKIE_LIST;
                                    String EMAIL;
                                    List<Order> OrdersList = new ArrayList<>();

                                    /*
                                    for (Cookie cookie : Cookies){
                                        if (cookie.getName().equals("SHOP_ID_ENC")){
                                            EMAIL = cookie.getValue();
                                            OrderReg orderReg = new OrderReg();
                                            OrdersList = orderReg.GetAllOrders(EMAIL);
                                        }
                                    }
                                    */
                                    //
                                    OrderReg orderReg = new OrderReg();
                                    OrdersList = orderReg.GetAllOrdersAll();


                                %>
                                <tr>
                                    <th>Order</th>
                                    <th>Delivery</th>
                                    <th>Time</th>
                                    <th>Total Bill</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <tbody>


                                <% for (Order Order : OrdersList) { %>
                                <tr>
                                    <td>
                                        <%= Order.OrderID %>
                                    </td>
                                    <td>
                                        <%= Order.DeliveryMode %>
                                    </td>
                                    <td>
                                        <%= Order.OrderTime  %>
                                    </td>
                                    <td>
                                        <%= Order.Total %>
                                    </td>
                                    <td>
                                        <div class="dropdown">
                                            <button class="btn btn-success">Actions</button>
                                            <div class="dropdown-content">
                                                <div>
                                                    <button style="margin: 0" data-target="#CompleteModal"
                                                            data-toggle="modal" data-id="<%= Order.OrderID%>"
                                                            title="Add this item" class="btn btn-light btn-block">Mark As Completed
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>

                                <% } %>

                                </tbody>
                                <tfoot>
                                <tr>

                                </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <a class="border rounded d-inline scroll-to-top" href="#page-top">
        <i class="fas fa-angle-up">

        </i>
    </a>
</div>

<div class="modal fade" id="CompleteModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">Mark As Completed</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group col-md-12">
                    <br>
                    <form style="padding: 0;margin: 0" action="${pageContext.request.contextPath}/ShopAdmin/Orders"
                          method="post">
                        <input hidden id="OrderID" type="text" name="OrderID" value="">
                        <h5 id="mdltitle" class="modal-title">Are You Sure?</h5>
                        <br>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-outline-success" data-dismiss="modal">Cancel</button>
                            <input type="submit" class="btn btn-danger" value="Mark As Completed">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $('#CompleteModal').on('shown.bs.modal', function (event) {

        var reference_tag = $(event.relatedTarget);
        var id = reference_tag.data('id');
        var mdlinput = document.getElementById("OrderID");
        mdlinput.value = id;
    })
</script>

</body>

</html>


