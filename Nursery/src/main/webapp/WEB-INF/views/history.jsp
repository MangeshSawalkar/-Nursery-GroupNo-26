<%@ include file="head.jsp" %>

<div class="container"  style="padding-top: 130px!important;">
    <div class="card shadow my-2">
        <div class="card-body">           
            <h4 class="p-2 text-center border border-dark mt-2">Customer Order History</h4>
            <table class="table table-bordered table-striped table-sm">
                <thead class="table-light">
                    <tr>
                        <th>Order ID</th>
                        <th>Order Date</th>              
                        <th>Order Value</th>        
                        <th>Status</th>
                        <th>Show Details</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${orders }" var="o">
                <tr>
                    <td>${o.id}</td>
                    <td>${o.orderdate}</td>   
                    <td>&#8377; ${o.totalOrderPrice}</td>  
                    <td>${o.status}</td>  
                    <td>
                        <a href="/orderdetails/${o.id}" class="btn btn-sm btn-primary"><i class="fa fa-eye"></i>Details</a>                        
                    </td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<%@ include file="partial/footer.jsp" %>