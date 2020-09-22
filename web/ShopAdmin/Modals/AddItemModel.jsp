

<!-- AddShopModal -->
<div class="modal fade" id="AddItemModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">Add A Item</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group col-md-12">
                    <br>
                    <form enctype='multipart/form-data' action="${pageContext.request.contextPath}/ShopAdmin/Items" method="post">
                        <label>
                            Name :<input type="text" name="NewName" class="form-control">
                        </label>

                        <label>
                            Description :<input type="text" name="Description" class="form-control">
                        </label>
                        <br>

                        <label>
                            Price (Rs) :<input type="number" name="Price" class="form-control">
                        </label>

                        <label>
                            Amount :<input type="number" name="Amount" class="form-control">
                        </label>

                        <br>

                        <label>
                            Photo :<input multiple="" type="file" name="Photo" class="form-control-file">
                        </label>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-outline-success" data-dismiss="modal">Close</button>
                            <input type="submit" class="btn btn-success" value="Add An Item">
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
