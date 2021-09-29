<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="adminhead.jsp" %>
<div id="main">
            <header class="mb-3">
                <a href="#" class="burger-btn d-block d-xl-none">
                    <i class="bi bi-justify fs-3"></i>
                </a>
            </header>

            <div class="page-heading">
                <div class="page-title">
                    <div class="row">
                        <div class="col-12 col-md-6 order-md-1 order-last">
                            <h3>Add Product</h3>
                        </div>
                        <div class="col-12 col-md-6 order-md-2 order-first">
                            <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/dashboard">Dashboard</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Add Product</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
                <!-- Basic Horizontal form layout section start -->
                <section id="basic-horizontal-layouts">
                    <div class="row match-height">
                        <div class="col-md-6 col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Add Product Form</h4>
                                </div>
                                <div class="card-content">
                                    <div class="card-body">
                                        <form class="form form-horizontal"   enctype="multipart/form-data" action="/products" method="post">
                                            <div class="form-body">
                                                <div class="row">
                                                <div class="col-md-4">
								<label>Product Category <span style="color:red">*</span></label> 
								</div>
								<div class="col-md-8  form-group">
								<select name="catid" required
									class="form-control">
									<option value="">Select Category</option>
									<c:forEach items="${cats }" var="cat">
										<option value="${cat.catid}">${cat.catName}</option>
									</c:forEach>
								</select>
							</div>
                                                    <div class="col-md-4">
                                                        <label>Product Name <span style="color:red">*</span></label>
                                                    </div>
                                                    <div class="col-md-8 form-group">
                                                        <input type="text" id="first-name" class="form-control" required
                                                            name="pname" placeholder="Product Name">
                                                    </div>
                                                     <div class="col-md-4">
                                                        <label>Product Price <span style="color:red">*</span></label>
                                                    </div>
                                                    <div class="col-md-8 form-group">
                                                        <input type="text" id="first-name" class="form-control" required
                                                            name="price" placeholder="Product Price">
                                                    </div>
                                                     <div class="col-md-4">
                                                        <label>Product Quantity <span style="color:red">*</span></label>
                                                    </div>
                                                    <div class="col-md-8 form-group">
                                                        <input type="text" id="first-name" class="form-control" required
                                                            name="qty" placeholder="Product Quantity">
                                                    </div>
                                                     <div class="col-md-4">
                                                        <label>Product 	Description	<span style="color:red">*</span></label>
                                                    </div>
                                                    <div class="col-md-8 form-group">
                                                        <textarea name="productDescription" class="form-control" placeholder="Please enter product Description here" required></textarea>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <label>Product Image</label>
                                                    </div>
                                                    <div class="col-md-8 form-group">
                                                            <input type="file" name="photo" accept=".jpg,.png" class="form-control-file">
                                                    </div>
                                                    <div class="col-sm-12 d-flex justify-content-end">
                                                        <button type="submit"
                                                            class="btn btn-primary me-1 mb-1">Submit</button>
                                                        <button type="reset"
                                                            class="btn btn-light-secondary me-1 mb-1">Reset</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- // Basic Horizontal form layout section end -->
<%@ include file="admin-footer.jsp"%>