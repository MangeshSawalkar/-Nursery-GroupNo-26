 <%@ include file="adminhead.jsp" %>
  <div id="main">
<div class="page-heading">
                <div class="page-title">
                    <div class="row">
                        <div class="col-12 col-md-6 order-md-1 order-last">
                            <h3>Order List</h3>
                        </div>
                        <div class="col-12 col-md-6 order-md-2 order-first">
                            <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/dashboard">Dashboard</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Order List</li>
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
                    <td>
                     <span class="badge bg-success">${o.status}</span>
                    </td>  
                   
                    <td>
                        <a href="/details/${o.id}" class="btn btn-sm btn-primary"><i class="fa fa-eye"></i>  Details</a>                        
                    </td>
                </tr>
                </c:forEach>
                </tbody>
                            </table>
                        </div>
                    </div>

                </section>
            </div>

<%@ include file="admin-footer.jsp"%>
