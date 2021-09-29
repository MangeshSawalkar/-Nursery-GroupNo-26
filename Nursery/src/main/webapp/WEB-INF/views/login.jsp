<%@ include file="head.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="main" style="padding-top:180px">
    <div class="container">
    <div class="row">
    <div class="col-sm-6">
        <div class="login_panel" style="width: 400px;">
            <h3>Existing Customers</h3>
            <p>Sign in with the form below.</p>
          
            
            <form method="post" autocomplete="off">
            <label for="username">User Name <span style="color:red">*</span></label>
                <input name="userid" type="text" class="form-control pt-2" placeholder="User ID" required><br>
               
               <label for="password">Password <span style="color:red">*</span></label>
                <input name="pwd" type="password" class="form-control pt-2" placeholder="Password" required>    <br>
                           
                <div class="buttons "><div><button class="btn btn-success">Sign In</button></div></div>
                <jsp:include page="msg.jsp"></jsp:include>
            </form>
       
       </div>
       </div>
       <div class="col-sm-6">
        <div class="register_account" style="width:700px;">
           
            <h3>Register New Account</h3><br>
            <div class="row">
             <form:form action="/register/" method="post" modelAttribute="userRegister">
                <div class="col-sm-12">
                        <input name="fname" required type="text" class="form-control"
                                            placeholder="First Name *"> <br>
                                            
                                            <input name="lname" required type="text" class="form-control"
                                            placeholder="Last Name *"> <br>
                                           
                                            <input name="userid" required type="text" class="form-control"
                                            placeholder="User ID *"> <br>
                                           
                                            <input name="dob" required type="date" class="form-control"
                                            ><br>
                                           
                                            <select name="gender" required class="form-select"
                                            >
                                            <option>Male</option>
                                            <option>Female</option>
                                            </select>   <br><br><br>
                                                                   
                                <input type="text" required class="form-control" pattern="^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$"
                                            name="email" placeholder="Email Id *"  data-msg="Please enter a valid email"  data-rule="email"><br>
                                                                     
                                <input type="password" required name="upassword" class="form-control"
                                            placeholder="Password *"><br>
                                           
                                <input type="password" required name="cpwd" class="form-control"
                                        placeholder="Repeat Password *"><br>
                                       
                  
                   
                <div class="buttons"><div><button type="submit" class="btn btn-primary">Create Account</button></div></div>
                <p class="terms">By clicking 'Create Account' you agree to the <a href="#">Terms &amp; Conditions</a>.</p>
                <div class="clear"></div> </div>
            </form:form>
            </div>
        </div>  
        </div>	
        <div class="clear"></div>
    </div>
    </div>
</div>
 <%@ include file="partial/footer.jsp"%>