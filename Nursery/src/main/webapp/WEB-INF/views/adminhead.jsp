<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="org.springframework.web.util.UrlPathHelper"%>
     <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="req" value="${pageContext.request}" />
<c:set var="url">${req.requestURL}</c:set>
<c:set var="uri" value="${req.requestURI}" />
<c:set var="baseUrl" value="${fn:substring(url, 0, fn:length(url) - fn:length(uri))}${req.contextPath}" />

 <% String url= new UrlPathHelper().getOriginatingRequestUri(request); %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Narsary Admin Dashboard</title>

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${baseUrl}/assets/css/bootstrap.css">

    <link rel="stylesheet" href="${baseUrl}/assets/vendors/iconly/bold.css">

    <link rel="stylesheet" href="${baseUrl}/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="${baseUrl}/assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="${baseUrl}/assets/css/app.css">
</head>

<body>
    <div id="app">
        <div id="sidebar" class="active">
            <div class="sidebar-wrapper active">
                <div class="sidebar-header">
                    <div class="d-flex justify-content-between">
                        <div class="logo">
                            <a href="#">Nursery</a>
                        </div>
                        <div class="toggler">
                            <a href="#" class="sidebar-hide d-xl-none d-block"><i class="bi bi-x bi-middle"></i></a>
                        </div>
                    </div>
                </div>
                <div class="sidebar-menu">
                    <ul class="menu">

                        <li class="sidebar-item <%= url.equals("/dashboard") ? "active" : "" %> ">
                            <a href="/dashboard" class='sidebar-link'>
                                <i class="bi bi-grid-fill"></i>
                                <span>Dashboard</span>
                            </a>
                        </li>

                        <li class="sidebar-item   <%= url.equals("/users") ? "active" : "" %>">
                            <a href="/users" class='sidebar-link'>
                                <i class="iconly-boldProfile"></i>
                                <span>Customer List</span>
                            </a>
                        </li>
                        <li class="sidebar-item  has-sub">
                            <a href="#" class='sidebar-link'>
                                <i class="bi bi-person-badge-fill"></i>
                                <span>Category</span>
                            </a>
                            <ul class="submenu ">
                             <li class="submenu-item">
                                    <a href="addcategory">Add Category</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="categorylist">Category List</a>
                                </li>
                               
                               
                            </ul>
                        </li>
                       
                        <li class="sidebar-item  has-sub">
                            <a href="#" class='sidebar-link'>
                               <i class="bi bi-cash"></i>
                                <span>Product</span>
                            </a>
                            <ul class="submenu ">
                             <li class="submenu-item">
                                    <a href="products">Add Product</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="productslist">Product List</a>
                                </li>
                               
                               
                            </ul>
                        </li>
                         <li class="sidebar-item  <%= url.equals("/orders") ? "active" : "" %>">
                            <a href="/orders" class='sidebar-link'>
                                <i class="bi bi-life-preserver"></i>
                                <span>Order</span>
                            </a>
                        </li>
                        <li class="sidebar-item  has-sub">
                            <a href="#" class='sidebar-link'>
                                <i class="bi bi-person-badge-fill"></i>
                                <span>Authentication</span>
                            </a>
                            <ul class="submenu ">
                             <li class="submenu-item <%= url.equals("/achangepwd") ? "active" : "" %>">
                                    <a href="changepwd">Change Password</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="admin/logout">Log Out</a>
                                </li>
                               
                               
                            </ul>
                        </li>

                    </ul>
                </div>
                <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
            </div>
        </div>
