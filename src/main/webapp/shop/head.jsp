<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 11/9/2020
  Time: 8:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Lego</title>
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="shop/css/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="shop/css/slick.css"/>
    <link type="text/css" rel="stylesheet" href="shop/css/slick-theme.css"/>
    <link type="text/css" rel="stylesheet" href="shop/css/nouislider.min.css"/>
    <link rel="stylesheet" href="shop/css/font-awesome.min.css">
    <link type="text/css" rel="stylesheet" href="shop/css/style.css"/>
    <style type="text/css">
        #brand-1
        {
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            display: inline-block;
            position: relative;
            background-color: #d1d3d1;
            color: #666;
            height: 25px;
            width: 24px;
            border: 0;
            top: 7px;
            border-radius: 50px;
            cursor: pointer;
            margin-right: 8px;
            outline: none;
        }
        #brand-1:checked::before
        {
            position: absolute;
            font: 13px/1 'Open Sans', sans-serif;
            left: 7px;
            top: 7px;
            content: '\02143';
            transform: rotate(40deg);
            font-size: 15px;
            color: black;
            font-weight: bold;
            padding-right: 5px;
        }
        #brand-1:hover
        {
            background-color: #f1f1f1;
        }
        #brand-1:checked
        {
            background-color: #d1d3d1;
        }
        .dropdown {
            position: relative;
            display: inline-block;
        }

        /* Dropdown Content (Hidden by Default) */
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 2;
        }

        /* Links inside the dropdown */
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 1040px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            padding: 10px 16px;
            z-index: 1;
        }
        .dropdown-content > li > a {
            padding: 3px 0px;
        }
        .dropdown:hover .dropdown-content {
            display: block;
        }
    </style>
</head>
<body>
<!-- HEADER -->
<header>