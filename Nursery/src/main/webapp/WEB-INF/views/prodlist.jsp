 <%@ include file="adminhead.jsp" %>
  <div id="main">
<div class="page-heading">
                <div class="page-title">
                    <div class="row">
                        <div class="col-12 col-md-6 order-md-1 order-last">
                            <h3>Product List</h3>
                        </div>
                        <div class="col-12 col-md-6 order-md-2 order-first">
                            <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/dashboard">Dashboard</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Product List</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
                <section class="section">
                    <div class="card">
                        <div class="card-body">
                            <table class="table table-striped" id="table1">
                                <thead>
                                    <tr>
                                     <th>Category Id</th>
                                      <th>Category Image</th>
                                       <th>Category Name</th>
                    <th>Product Id</th>
                    <th>Product Image</th>
                    <th>Product Name</th>
                     <th>Product Price</th>
                      <th>Product Qty</th>
                     
                                     
                </tr>
                                </thead>
                       <tbody>
                <c:forEach items="${prodlist }" var="prods">
                    <tr>
                   
                     <td>${prods.category.catid}</td> 
                      <td><img src="${baseUrl}/${prods.category.catImage}" width="45" height="45"></td> 
                       <td>${prods.category.catName}</td> 
                        <td>${prods.prodid}</td>
                         
                        <td><img src="${baseUrl}/${prods.pic}" width="45" height="45"></td>
                        
                          <td>${prods.pname}</td>  
                           <td>${prods.price}</td>   
                             <td>${prods.qty}</td>     
                                                                
                    </tr>
                </c:forEach>
            </tbody>
                            </table>
                        </div>
                    </div>

                </section>
            </div>

<%@ include file="admin-footer.jsp"%>
