<%@ include file="adminhead.jsp" %>
<div id="main">
<h5 class="p-2" style="border-bottom: 2px solid green;">Order
	Details</h5>
<div class="row">
	<div class="col-sm-6">
		<table class="table table-bordered">
			<tr>
				<td>Customer Name :</td>
				<th>${o.customer.fname}${o.customer.lname}</th>
			</tr>
			<tr>
				<td>Order Date :</td>
				<th>${o.orderdate}</th>
			</tr>
		</table>
	</div>
</div>

<table class="table table-bordered table-striped">
	<thead class="bg-red">
		<th>Product</th>
		<th>Price</th>
		<th>Quantity</th>
		<th>Amount</th>
	</thead>
	<tbody>
		<c:forEach items="${items }" var="od">
			<tr>
				<td>${od.product.pname}</td>
				<td>&#8377; ${od.price}</td>
				<td>${od.qty}</td>
				<td>&#8377; ${od.amount}</td>
			</tr>
		</c:forEach>
	</tbody>
	<tfoot>
		<tr>
			<th colspan="3">Total</th>
			<th>&#8377; ${o.totalOrderPrice}</th>
		</tr>
	</tfoot>
</table>
<c:set var="status" value="Pending" />
<c:set var="ostatus" value="Confirmed"/>
<c:choose>
	<c:when test="${o.status eq status }">
		<div class="row">
			
			<div class="col-sm-2">
				<a class="btn btn-primary" href="/confirm/${o.id}">Confirm Order</a>
			</div>
			<div class="col-sm-2">
				<a class="btn btn-danger" href="/ocancel/${o.id}">Cancel Order</a>
			</div>
		</div>
	</c:when>
	<c:otherwise>
		<p class="p-2 text-success font-weight-bold text-center"
			style="border: 1px solid green">Order has been ${o.status}</p>
	</c:otherwise>
</c:choose>

<c:choose>
<c:when test="${o.status eq ostatus }">
		<div class="row">
			<div class="col-sm-2">
				<a class="btn btn-success" href="/deliver/${o.id}">Deliver Order </a>
			</div>
			
		</div>
	</c:when>
	<c:otherwise>
	
	</c:otherwise>
	</c:choose>
<%@ include file="admin-footer.jsp"%>