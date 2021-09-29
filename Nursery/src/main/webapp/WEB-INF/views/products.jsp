
<%@ include file="head.jsp" %>
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Products</h2>
                        <div class="breadcrumb__option">
                            <a href="/">Home</a>
                            <span>Shop</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
   
    <section class="product spad">
            <div class="row">
                
                <div class="col-lg-12 col-md-12">
                    <div class="row">
                    <c:forEach items="${products}" var="prod">
                    <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                            
                                <div class="product__item__pic set-bg" data-setbg="${baseUrl}/${prod.pic}">
                                   
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="/product/${prod.prodid}">${prod.pname}</a></h6>
                                    <h5>Rs ${prod.price}</h5>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                                           
                    </div>
                   
                </div>
            </div>
        
    </section>
 <%@ include file="partial/footer.jsp"%>