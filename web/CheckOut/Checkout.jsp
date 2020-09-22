<%@ page import="com.apex.shopadmin.ItemReg" %>
<%@ page import="com.apex.shopadmin.Item" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>

<jsp:include page="../HEAD.jsp"/>

<body id="page-top" class="bg-gradient-light">
<br>
<div class="container">
    <div class="card shadow-lg">
        <div class="card-header py-3 d-flex justify-content-center">
            <h4>Checkout</h4>
        </div>
        <div class="card-body p-0">
            <form method="post" action="https://sandbox.payhere.lk/pay/checkout?merchant_id=1213586&return_url=http://localhost:8080/DEAMongo_war_exploded/Checkout&cancel_url=http://localhost:8080/DEAMongo_war_exploded/Checkout&notify_url=http://localhost:8080/DEAMongo_war_exploded/Checkout&first_name=fname&last_name=lname&email=email@gmail.com&phone=+94711234567&address=no 1 road&city=colombo&country=Sri Lanka&order_id=1100110011&items=myitem&currency=LKR&amount=250.00">
                <div class="col">
                    <div class="row">

                        <div class="col d-flex justify-content-center">
                            <%
                            Cookie[] CookieList = request.getCookies();
                            Cookie Cart = null;

                            for (Cookie cookie : CookieList){
                                if (cookie.getName().equals("Cart")){
                                    Cart = cookie;
                                }
                            }
                                assert Cart != null;
                                String ItemID = Cart.getValue();
                                ItemID = ItemID.replace("[","");
                                ItemID = ItemID.replace("]","");

                                ItemReg itemReg = new ItemReg();
                                Item item = itemReg.getItem(ItemID);

                            %>
                            <div class="form-group">
                                <br>
                                <h5>Order</h5>
                                <label>
                                    Order : <%=item.Name%>
                                </label>
                                <br>
                                <label>
                                    Price : Rs <%=item.Price%>/=
                                </label>
                                <br>

                                <label>
                                    Delivery Method : <select id="DeliveryMethod" name="DeliveryMethod"
                                                              class="form-control" style="width: 204px">
                                    <option value="PickUp">PickUp</option>
                                    <option value="Home Delivery">Home Delivery</option>
                                </select>
                                </label>
                                <br>
                                <label id="Address" hidden disabled>
                                    Address :<input type="text" name="Address" value="user address"
                                                    class="form-control">
                                </label>
                                <br>
                                <label>
                                    Amount :<input name="Amount" type="number" id="Amount" value="1" min="1"
                                                   class="form-control">
                                </label>
                                <br>

                            </div>
                        </div>

                        <div class="col d-flex justify-content-center">
                            <div>
                                <br>
                                <h5>Payment Details</h5>
                                <br>
                                <label id="OrderPrice">
                                    Order Price : Rs <%=item.Price%>/=
                                </label>
                                <br>
                                <label id="DelCharge">
                                    Delivery Charges : Rs 0/=
                                </label>
                                <br>
                                <label id="Total">
                                    Total : Rs <%=item.Price%>/=
                                </label>
                                <br>
                                <input type="submit" class="btn btn-block btn-success" value="Pay">
                            </div>
                        </div>

                    </div>

                    <center><b>Payment Gateway Powered By</b><br><a href="https://www.payhere.lk?utm_source=logo"
                                                                    target="_blank"><img
                            src="https://www.payhere.lk/downloads/images/payhere_long_banner.png" alt="PayHere"
                            width="440"/></a></center>
                </div>
            </form>
        </div>

    </div>
</div>
</div>

<script>
    let slct = document.getElementById("DeliveryMethod");
    let address = document.getElementById("Address");
    let delcharge = document.getElementById("DelCharge");
    let total = document.getElementById("Total");
    let amount = document.getElementById("Amount");
    let OrderPrice = document.getElementById("OrderPrice");


    let original = <%=item.Price%>;

    function valchange() {
        if (slct.value === "PickUp") {
            address.setAttribute("hidden", true);
            address.setAttribute("disabled", true);
            delcharge.innerText = "Delivery Charges : Rs 0/=";
            total.innerText = "Total : Rs" + (original * amount.value) + "/=";
        } else {
            address.removeAttribute("hidden");
            address.removeAttribute("disabled");
            delcharge.innerText = "Delivery Charges : Rs 250/="
            let totaldel = (original * amount.value) + 250;
            total.innerText = "Total : Rs " + totaldel + "/=";

        }
    }

    amount.addEventListener("change", function () {
        OrderPrice.innerText = "Order Price : Rs " + (original * amount.value) + "/=";
        valchange();
    })

    slct.addEventListener("change", function () {
        valchange();
    })

</script>
</body>
</html>
