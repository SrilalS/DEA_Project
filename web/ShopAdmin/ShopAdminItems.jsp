<%@ page import="java.util.List" %>
<%@ page import="com.apex.shopadmin.Item" %>
<%@ page import="com.apex.shopadmin.ItemReg" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<jsp:include page="../HEAD.jsp"/>

<body id="page-top">
<div id="wrapper">
    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
            <jsp:include page="/ShopAdmin/NAVBTN/ShopAdminItems.jsp"/>
            <div class="container-fluid">
                <h3 class="text-dark mb-4">Items Manager</h3>
                <div class="card shadow">
                    <div class="card-header py-3">
                        <button type="button" class="btn btn-outline-success" data-toggle="modal" data-target="#AddItemModal">Add a Item</button>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive table mt-2" id="dataTable" role="grid"
                             aria-describedby="dataTable_info">
                            <table class="table my-0" id="dataTable2">
                                <thead>
                                <%

                                    ItemReg ItemReg = new ItemReg();
                                    List<Item> ItemsList = ItemReg.GetAllItems();

                                %>
                                <tr>
                                    <th>Photo</th>
                                    <th>Name</th>
                                    <th>Description</th>
                                    <th>Price (Rs)</th>
                                    <th>Amount Left</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <tbody>


                                <% for (Item item : ItemsList) { %>
                                <tr>
                                    <td>
                                        <img width="64px" height="64px" src="data:image/png;base64,<%=item.Base64Photo%>" alt="">
                                    </td>
                                    <td>
                                        <%= item.Name %>
                                    </td>
                                    <td>
                                        <%= item.Description %>
                                    </td>
                                    <td>
                                        <%= item.Price %>
                                    </td>
                                    <td>
                                        <%= item.Amount %>
                                    </td>
                                    <td>
                                        <div class="dropdown">
                                            <button  class="btn btn-success">Actions</button>
                                            <div class="dropdown-content">
                                                <div>
                                                    <button  data-target="#EditItemModal" data-toggle="modal"
                                                             data-id="<%=item.id%>"
                                                             data-name="<%=item.Name%>"
                                                             data-desc="<%=item.Description%>"
                                                             data-amount="<%=item.Amount%>"
                                                             data-price="<%=item.Price%>"
                                                             title="Add this item" class="btn btn-light btn-block">Edit</button>
                                                    <button style="margin: 0" data-target="#DelModal" data-toggle="modal" data-id="<%=item.id%>" title="Add this item" class="btn btn-light btn-block">Delete</button>
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
    <a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a></div>

<jsp:include page="./Modals/AddItemModel.jsp"/>
<jsp:include page="Modals/EditItemModal.jsp"/>

<div class="modal fade" id="DelModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">Delete an Item</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group col-md-12">
                    <br>
                    <form style="padding: 0;margin: 0" action="${pageContext.request.contextPath}/ShopAdmin/Items" method="post">
                        <input hidden id="itemID" type="text" name="Delete" value="">
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
        var mdlinput= document.getElementById("itemID");
        mdlinput.value = id;
    })
</script>

<script>
    $('#EditItemModal').on('shown.bs.modal', function(event) {

        var reference_tag = $(event.relatedTarget);

        var id = reference_tag.data('id');
        var name = reference_tag.data('name');
        var desc = reference_tag.data('desc');
        var amount = reference_tag.data('amount');
        var price = reference_tag.data('price');

        var idm= document.getElementById("ID");
        var namem= document.getElementById("Name");
        var descm= document.getElementById("Description");
        var amountm= document.getElementById("Amount");
        var pricem= document.getElementById("Price");

        idm.value = id;
        namem.value = name;
        descm.value = desc;
        amountm.value = amount;
        pricem.value = price;


    })
</script>

</body>

</html>

