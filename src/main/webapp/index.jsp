<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="<%=basePath%>js/vue.min.js"></script>
  </head>
  <body>
    <div id="mdiv">
  		<table>
  			<tr><td>name</td><td>hp</td></tr>
  			<tr v-for='hero,index in heros'>
  			<td>{{index+1}}</td>
  			<td>{{hero.name}}</td>
  			<td>{{hero.hp}}</td>
  			</tr>	
  		</table>
  		<a v-bind:href="page">百度一下</a>
  		
    	<input v-model='name'></input>
    	<div>{{name|filter}}</div>
    	<me v-for="hero in heros" v-bind:me="hero"></me>
    </div>
  </body>
  <script type="text/javascript">
  //准备数据
  var data = [
   		  {name:"盖伦",hp:341},
		  {name:"提莫",hp:225},
		  {name:"安妮",hp:427},
		  {name:"死歌",hp:893}
    ];
  
	//通过vue.js 把数据和对应的视图关联起来
	
	var vm = new Vue({
	      el:'#mdiv',
	      data: {
	        heros:data,page:'http://www.baidu.com',name
	      },
	      components:{
	      	'me':{
	      		props:['me'],
	      		template:'<div>{{me.name}},{{me.hp}}</div>'
	      	}
	      }
	    });
	 vm.filter('filter',function(value){
	      		if(!value) return '';
	      		value = value.toString();
	      		return value.charAt(0).toUpperCase() + value.substring(1)});
	</script>
</html>
