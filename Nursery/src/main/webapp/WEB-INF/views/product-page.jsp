
<%@ include file="head.jsp" %>

    <!-- Hero Section End -->

   

    <!-- Product Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                            <img class="product__details__pic__item--large"
                                src="${baseUrl}/${product.pic}" alt="">
                        </div>
                        <div class="product__details__pic__slider owl-carousel">
                            
                            <img data-imgbigurl="${baseUrl}/${product.pic}"
                                src="${baseUrl}/${product.pic}" alt="">
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                        <h3> ${product.pname}</h3>
                       
                        <div class="product__details__price">Rs ${product.price }</div>
                        <p>${product.productDescription}</p>
                          <c:set var="quantity" scope="session" value="${product.qty}" />
                        <c:choose>
                <c:when test="${sessionScope.userid ne null }">
                       
                        <form:form action="addtocart" method="post" modelAttribute="cart">
                        <form:hidden path="productId" value="${product.prodid}"/>
                        <form:hidden path="productName" value="${product.pname}"/>
                        <form:hidden path="rate" value="${product.price }"/>
                        <form:hidden path="userId" value="${sessionScope.userid}"/>                   
                        <div class="product__details__quantity">
                        <c:choose>
                        <c:when test="${quantity gt 0}">
                        <div class="product_details_quantity ">
                            <div class="quantity">
                                <div class="pro-qty">
                                   <form:input value="1" path="productQty"/>
                                    
                                </div>
                            </div>
                        </div>
                     
                        
                        <input type="submit" class="primary-btn" value="ADD TO CART">
                           </c:when>
             <c:otherwise>
										<div class="alert alert-danger text-center font-weight-bold">
											Sorry this product is currently not available.</div>
									</c:otherwise>
             
                        </c:choose>
                       </form:form>
                       
                        </c:when>
                <c:otherwise>
                <div class="alert alert-danger text-center font-weight-bold">
                    Please login to buy products..!!
                </div>
                </c:otherwise>
                </c:choose>       
                        <ul>
                            
                            <li><b>Shipping</b> <span>01 day shipping. <samp>Free pickup today</samp></span></li>
                            
                        </ul>
                    </div>
                </div>
                
            </div>
        </div>
    </section>
 <%@ include file="partial/footer.jsp"%>
   