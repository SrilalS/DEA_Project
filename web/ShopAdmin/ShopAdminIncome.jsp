<%@ page import="java.util.List" %>
<%@ page import="com.apex.shopadmin.Item" %>
<%@ page import="com.apex.shopadmin.ItemReg" %>
<%@ page import="com.apex.paymentsGateway.PaymentsReg" %>
<%@ page import="com.apex.paymentsGateway.Payment" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<jsp:include page="../HEAD.jsp"/>

<body id="page-top">
<div id="wrapper">
    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
            <jsp:include page="/ShopAdmin/NAVBTN/ShopAdminIncome.jsp"/>
            <div class="container-fluid">
                <h3 class="text-dark mb-4">Income Report</h3>
                <%

                    PaymentsReg paymentsReg = new PaymentsReg();
                    List<Payment> PaymentList = paymentsReg.GetAllAll();

                %>
                <div class="row">
                    <%
                    double ThisMonth = 0.0;
                    double FHCharge = 0.0;

                    for (Payment Payment : PaymentList){
                        ThisMonth = ThisMonth + Payment.Amount;
                        FHCharge = FHCharge + ((Payment.Amount * 10) /100);
                    }



                    %>
                    <div class="col">
                        <div class="card shadow">
                            <div class="card-header py-3">
                                <h5>This Months Income</h5>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive table mt-2">
                                    <h5>Rs <%= ThisMonth%></h5>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card shadow">
                            <div class="card-header py-3">
                                <h5>Charges by FoodHut</h5>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive table mt-2">
                                    <div>
                                        <h5>Rs <%= FHCharge%> (at 10% Rate)</h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <br>

                <div class="card shadow">
                    <div class="card-header py-3">
                        <h5>Last 50 Transactions</h5>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive table mt-2" id="dataTable" role="grid"
                             aria-describedby="dataTable_info">
                            <table class="table my-0" id="dataTable2">
                                <thead>

                                <tr>
                                    <th>Payment ID</th>
                                    <th>Order ID</th>
                                    <th>Amount (Rs)</th>
                                    <th>From</th>
                                    <th>Time</th>
                                </tr>
                                </thead>
                                <tbody>


                                <% for (Payment payment : PaymentList) { %>
                                <tr>
                                    <td>
                                        <%=payment.ID%>
                                    </td>
                                    <td>
                                        <%= payment.OrderID %>
                                    </td>
                                    <td>
                                        <%= payment.Amount %>
                                    </td>
                                    <td>
                                        <%= payment.FromEmail %>
                                    </td>
                                    <td>
                                        <%= payment.Time %>
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
    <a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a></div>
</body>

</html>

