 <%@ include file="adminhead.jsp" %>
  <div id="main">
<div class="page-heading">
                <div class="page-title">
                    <div class="row">
                        <div class="col-12 col-md-6 order-md-1 order-last">
                            <h3>Customer List</h3>
                        </div>
                        <div class="col-12 col-md-6 order-md-2 order-first">
                            <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/dashboard">Dashboard</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Customer List</li>
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
                    <th>User Id</th>
                    <th>User Name</th>
                    <th>Gender</th>                    
                    <th>Email Id</th>                    
                    <th>Date of Birth</th>                    
                </tr>
                                </thead>
                       <tbody>
                <c:forEach items="${users }" var="u"> <!-- jstl library for each loop -->
                    <tr>
                        <td>${u.userid}</td> 
                        <td>${u.fname} ${u.lname }</td>
                        <td>${u.gender}</td>                                         
                        <td>${u.email}</td>                                         
                        <td>${u.dob}</td>                                         
                    </tr>
                </c:forEach>
            </tbody>
                            </table>
                        </div>
                    </div>

                </section>
            </div>

<%@ include file="admin-footer.jsp"%>
