

<!-- AddShopModal -->
<div class="modal fade" id="AddCustoModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
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
                    <form enctype='multipart/form-data' action="${pageContext.request.contextPath}/Admin/CustomersManager" method="post">
                        <label>
                            First Name :<input type="text" name="FName" class="form-control">
                        </label>

                        <label>
                            Last Name :<input type="text" name="LName" class="form-control">
                        </label>

                        <br>

                        <label>
                            Password :<input type="password" name="Password" class="form-control">
                        </label>

                        <label>
                            Repeat Password :<input type="password" name="PasswordRepeat" class="form-control">
                        </label>

                        <br>
                        <label>
                            Email :<input type="email" name="Email" class="form-control">
                        </label>

                        <label>
                            Telephone :<input type="number" name="Telephone" class="form-control">
                        </label>
                        <br>

                        <label>
                            BirthDay :<input type="date" name="BDay" class="form-control">
                        </label>
                        <label>
                            Address :<input type="text" name="Address" class="form-control">
                        </label>

                        <br>
                        <label>
                            Profile Photo :<input type="file" name="Photo" class="form-control-file">
                        </label>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-outline-success" data-dismiss="modal">Close</button>
                            <input type="submit" class="btn btn-success" value="Add A Customer">
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>