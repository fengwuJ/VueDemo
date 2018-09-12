<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index2.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="<%=basePath%>/js/vue.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/vue-router.min.js"></script>
  </head>
  
  <body>
    <div id="app">
    	<div id=menu>
    		<router-link to="/user">用户管理</router-link>
    		<router-link to="/product">产品管理</router-link>
    		<router-link to="/order">订单管理</router-link>
    	</div>
    	<div id="linkTo">
    		<router-view></router-vsiew>
    	</div>
    </div>
  </body>

  <script type="text/javascript">
  	var user = { template: '<p>用户管理页面的内容</p>' };
    var second = { template: '<p>产品管理页面的内容</p>' };
    var order = { template: '<p>订单管理页面的内容</p>' };
    
    var routes = [
        { path: '/', redirect: '/user'}, // 这个表示会默认渲染 /user，没有这个就是空白
        { path: '/user', component: user },
        { path: '/product', component: second },
        { path: '/order', component: order }
    ];
    
    var router = new VueRouter({
        routes:routes
    });
    /*
    * 给vue对象绑定路由
    */
    new Vue({
        el:"#app",
        router
    })
 
  </script>
  
</html>
