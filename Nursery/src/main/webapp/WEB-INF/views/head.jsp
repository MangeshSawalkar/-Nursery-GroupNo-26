<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="org.springframework.web.util.UrlPathHelper"%>

<c:set var="req" value="${pageContext.request}" />
<c:set var="url">${req.requestURL}</c:set>
<c:set var="uri" value="${req.requestURI}" />
<c:set var="baseUrl" value="${fn:substring(url, 0, fn:length(url) - fn:length(uri))}${req.contextPath}" />
 <% String url= new UrlPathHelper().getOriginatingRequestUri(request); %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Nursery</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="${baseUrl}/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${baseUrl}/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${baseUrl}/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${baseUrl}/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${baseUrl}/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${baseUrl}/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${baseUrl}/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${baseUrl}/css/style.css" type="text/css">
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Humberger Begin -->
    <div class="humberger__menu__overlay"></div>
    <div class="humberger__menu__wrapper">
        <div class="humberger__menu__logo">
            <a href="/">Nursery</a>
        </div>
        <div class="humberger__menu__cart">
            <ul>
                <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
            </ul> 
        </div>
        
        <nav class="humberger__menu__nav mobile-menu">
           <ul>
                            <li class=" <%= url.equals("/") ? "active" : "" %>"><a href="/">Home</a></li>
                            <c:set var="catlist" scope="session" value="${cats}"/>  
                            <c:forEach items="${catlist}" var="cl">
                            <li><a href="${cl.catid}">${cl.catName}</a>
                             
                            </li>
                            </c:forEach>
                        </ul>
        </nav>
        <div id="mobile-menu-wrap"></div>
       
        <div class="humberger__menu__contact">
            <ul>
               
                <li>Free Shipping for all Order of $99</li>
            </ul>
        </div>
    </div>
    <!-- Humberger End -->

    <!-- Header Section Begin -->
    <header class="header fixed-top" style="background:#fff;">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__right">
                            
                            
                            <div class="header__top__right__auth">
                               <nav class="navbar navbar-dark bg-primary"> 
                                <c:choose>
					<c:when test="${ sessionScope.userid ne null }">
					<li class="float-right ml-2 fa fa-sign-out"><a href="/logout">Logout</a></li>
					<li class="float-right ml-2 fa fa-key float-center"><a href="/cchangepwd">Change
							Password</a></li>
					<li class="float-right fa fa-shopping-bag ml-2"><a href="/cart">Cart 
					<c:if test="${cqty > 0 }">
					<i class="badge badge-warning">${cqty}</i></c:if>
							</a></li>
					<li class="float-right fa fa-history ml-2"><a href="/history">History</a></li>
					
					
					
					</c:when>
					<c:otherwise>
					<a href="/login"><i class="fa fa-user"></i> Login</a>
					</c:otherwise>
					</c:choose>
					</nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <div class="header__logo">
                         <a href="/">Nursery</a>
                    </div>
                </div>
                <div class="col-lg-10">
                    <nav class=" header__menu">

                        <ul>
                            <li class="active"><a href="/">Home</a></li>
                            <c:set var="catlist" scope="session" value="${cats}"/>  
                            <c:forEach items="${catlist}" var="cl">
                            <li><a href="/${cl.catid}">${cl.catName}</a>
                             
                            </li>
                            </c:forEach>
                        </ul>
                   </nav>
                </div>
                
            </div>
            <div class="humberger__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>
    <!-- Header Section End -->