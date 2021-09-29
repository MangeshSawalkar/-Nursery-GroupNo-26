<%@ include file="head.jsp" %>

    <!-- Hero Section Begin -->
    <section class="hero">
        <div class="container">
            <div class="row">
                
                <div class="col-lg-12">
                    
                    <div class="hero__item set-bg" data-setbg="img/hero/banner.jpg">
                        <div class="hero__text">
                           
                            <h2 style="color:green">Plant a little love <br />Watch a miracle grow</h2>
                            <p style="color:red;font-weight:bold;font-size:20px">Free Pickup and Delivery Available</p>
                            <a href="/productlist" class="primary-btn">SHOP NOW</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Categories Section Begin -->
    <section class="categories">
        <div class="container">
            <div class="row">
                <div class="categories__slider owl-carousel">
                
                <c:forEach items="${cats}" var="cats">
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="${baseUrl}/${cats.catImage}">
                            <h5><a href="/${cats.catid}">${cats.catName}</a></h5>
                        </div>
                    </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </section>

        <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
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
        </div>
    </section>
   <%@ include file="partial/footer.jsp"%>