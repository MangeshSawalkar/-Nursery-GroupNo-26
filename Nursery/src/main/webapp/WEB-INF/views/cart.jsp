<%@ include file="head.jsp" %>
<div class='container' style="padding-top: 180px;">
	<c:choose>
		<c:when test="${cqty eq 0 }">
			<h5 class='text-center p-2'>Your Cart is empty. Please continue shopping.</h5>
    </c:when>
		<c:otherwise>
			<div class="row">
				<div class="col-sm-7">
					<h4 class="py-2">Cart (${cqty})</h4>
				</div>
				<div class="col-sm-5"></div>
			</div>

			<div class="row">
				<div class="col-sm-7">
					<div class='p-3 rounded bg-white'>
						<h5 class="p-2 float-right font-weight-bold">&#8377;
							${ctotal}</h5>
						<h5 class="p-2" style="border-bottom:2px solid blue;">Cart(${cqty} items)</h5>
						<c:forEach items="${items }" var="c">
							<div class="border-bottom py-2">
								<div class="p-2">
									<a
										onclick="return confirm('Are you sure to delete this item from cart ?')"
										href="/delcart/${c.id}" class="btn btn-danger btn-sm float-right">X</a>
									<h5 class="font-weight-bold p-1">${c.productName}</h5>
									
									<h6>&#8377; ${c.rate}</h6>
									<div class="float-right">Quantity: ${c.productQty}</div>
								</div>
								<div class="clearfix"></div>
							</div>
							
						</c:forEach>
					</div>
				</div>
				<div class="col-sm-5">
					<div class='rounded bg-white p-2'>
						<h5 class="p-2" style="border-bottom:2px solid blue;">Payment Details</h5>
						<form method="post" action="placeorder">
							<table class="table table-sm table-borderless border-bottom mb-2">
								<tr>
									<th>MRP Total</th>
									<th class="text-right font-weight-bold">&#8377; ${ctotal}</th>
								</tr>
								<tr>
									<th>GST@18%</th>
									<th class="text-right font-weight-bold">&#8377; ${ cgst}</th>
								</tr>
								<tr>
									<th>Total Amount</th>
									<th class="text-right font-weight-bold">&#8377;
										${netamount}</th>
								</tr>
							</table>
							<table class="table table-borderless table-sm">
							<tr>
									<th>Billing Address <span style="color:red">*</span></th>
									<th><textarea name="billAddr" id="billAddr" class="form-control" required placeholder="Enter your billing Address here."></textarea></th>
								</tr>
								<tr>
									<th>Shipping Address <span style="color:red">*</span></th>
									<th><textarea name="shipAddr" id="shipAddr" class="form-control" required placeholder="Enter your shipping or develiery Address here."></textarea></th>
								</tr>
								<tr>
									<th>Enter Card No <span style="color:red">*</span></th>
									<th><input type="text" name="cardno" required
										maxlength="16" class="form-control"></th>
								</tr>
								<tr>
									<th>Name on Card <span style="color:red">*</span></th>
									<th><input type="text" required name="nameoncard"
										class="form-control"></th>
								</tr>
								<tr>
									<th>Expiry Date <span style="color:red">*</span></th>
									<th><input type="month" required required
										class="form-control"></th>
								</tr>
								<tr>
									<th>CVV Number <span style="color:red">*</span></th>
									<th><input type="text" required maxlength="3"
										class="form-control"></th>
								</tr>
								<tr>
									<td colspan="2"><input type="submit"
										class="btn btn-primary float-right" value="Place Order">
									</td>
								</tr>
							</table>
						</form>
					</div>

				</div>
			</div>

			<div class='clearfix'></div>
			<div class='pb-3'></div>
		</c:otherwise>
	</c:choose>
</div>
<%@ include file="partial/footer.jsp" %>