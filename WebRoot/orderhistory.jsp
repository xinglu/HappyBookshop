<%@page import="com.chinasofti.etc.happybookshop.po.OrderDetail"%>
<%@page import="com.chinasofti.etc.happybookshop.po.Order"%>
<%@page import="com.chinasofti.etc.happybookshop.po.User"%>

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import = "com.chinasofti.etc.happybookshop.vo.CartItem"%>
<%@ page import = "com.chinasofti.etc.happybookshop.po.Author"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'bookcart.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link href="style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
   <!--
   a:link { text-decoration: none;color:#006a92}
   a:active { text-decoration:blink}
   a:visited { text-decoration: none;color: green}
     img{border:0px}  
   a:hover{
 		text-decoration:underline;  /*鼠标放上去有下划线*/
		  }
   --> 
</style>
<meta http-equiv="Content-Type" content="text/html;charset=gb2312">
<title>菜单效果</title>
<style>
/* 先把这个 xmenu 的样式放到css里 */
.xmenu td
{
font-size:12px;
font-family:verdana,arial;
font-weight:bolder;
color:#ffffff;
border:1px solid #336699;
background:#336699;
filter:blendtrans(duration=0.5);
cursor:hand;
text-align:center;
}
</style>

<script language="JavaScript">
<!--
//这是把事件动作绑定到菜单上的函数
function attachXMenu(objid)
{
    var tds=objid.getElementsByTagName('td');
    for(var i=0;i<tds.length;i++)
    {
        with(tds[i])
        {
            onmouseover=function()
            {
                with(this)
                {
                    filters[0].apply();
                    style.background='#FEBD20'; //这是鼠标移上去时的背景颜色
                    style.border='1px solid #ffffff'; //边框
                    style.color='black'; //文字颜色
                    filters[0].play();
                }
            }
            onmouseout=function()
            {
                with(this)
                {
                    filters[0].apply();
                    style.background='#336699'; //这是鼠标离开时的背景颜色
                    style.border='1px solid #336699'; //边框
                    style.color='#ffffff'; //文字颜色
                    filters[0].play();
                }
            }
        }
    }
}
//-->
</script>
  </head>
  
  <body>
<!--顶部图片-->
<div id=toppic>
<img src="images/logo.png" width="70px" height="70px" style="position:absolute;visibility:visible;top:20px;left:100px" />
<font size="+5" color="white" face="华文彩云" style="position:absolute;visibility:visible;top:50px;left:180px" >
开心购书网
</font>
</div>
<div ><!--top标签开始-->
		<table width="100%" border="0" bgcolor="#C5a5a7" align="center">
		<tr><td>
		<div align="left" >
	    &nbsp;<span ><a href="index1.jsp" a ><font color="blick">欢迎光临小站</font></a></span>       
   		</td></tr></table>     
        </div>
            <!--菜单从这里开始, 注意要把class设置成和css里相同的, 还要为它设一个id-->
<table class="xmenu" id="xmenu0" width="800" cellpadding="1" cellspacing="4" border="0" bgcolor="#00000" align="center">
    <tr>
        <td>&nbsp;&nbsp;童&nbsp;&nbsp;书&nbsp;&nbsp;</td>
        <td>&nbsp;&nbsp;教&nbsp;&nbsp;材&nbsp;&nbsp;</td>
        <td>&nbsp;&nbsp;考试小说&nbsp;&nbsp;</td>
        <td>&nbsp;&nbsp;小&nbsp;&nbsp;说&nbsp;&nbsp;</td>
        <td>&nbsp;&nbsp;人文社科&nbsp;&nbsp;</td>
        <td>&nbsp;&nbsp;生&nbsp;&nbsp;活&nbsp;&nbsp;</td>
         <td>&nbsp;&nbsp;励&nbsp;&nbsp;志&nbsp;&nbsp;</td>
          <td>&nbsp;&nbsp;预&nbsp;&nbsp;售&nbsp;&nbsp;</td>
           <td>&nbsp;&nbsp;特&nbsp;&nbsp;价&nbsp;&nbsp;</td>
            <td>&nbsp;&nbsp;新书上市&nbsp;&nbsp;</td>
              <td>&nbsp;&nbsp;口碑好书&nbsp;&nbsp;</td>
    </tr>
    </table>
        <hr size="1" color="#C5a5a7">
    </div>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'havebuyedbook.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <!-- JAVA　Ｓ -->
  <%
    User user = (User)session.getAttribute("user");
  	Set<Order> orders = user.getOrders();
   %>
  <!-- JAVA E -->
   <table>
   
   		 <table border="1" cellpadding="0" width="800" bgcolor="#ffffff" align="center">
   		 		<tr> 
   		 		   <td width="116" height="50"><div align="center"><b>订单号</b></div></td>
                   <td width="116" height="50"><div align="center"><b>时间</b></div></td>
                   <td width="116" height="50"><div align="center"><b>书名</b></div></td>
                   <td width="116" height="50"><div align="center"><b>价格</b></div></td>
                   <td width="116" height="50"><div align="center"><b>购买数量</b></div></td> 
			     </tr>
   		 	<%
   		 		//枚举以后书籍
   		 		Iterator<Order> it = orders.iterator();
   		 		while (it.hasNext()){
   		 			Order order = it.next();
   		 			Set<OrderDetail> orderDetails = order.getOrderDetails();
   		 			Iterator<OrderDetail> iterator = orderDetails.iterator();
   		 			while (iterator.hasNext()){
   		 				OrderDetail orderDetail = iterator.next();
   		 			%>
   		 				<tr> 
	   		 		   <td width="116" height="50"><div align="center"><b><%=order.getOrderId() %></b></div></td>
	                   <td width="116" height="30"><div align="center"><b><%=order.getDate() %></b></div></td>
	                   <td width="116" height="30"><div align="center"><b><%=orderDetail.getBook().getBookName() %></b></div></td>
	
	                   <td width="116" height="30"><div align="center"><b><%=orderDetail.getBook().getBookPrice() %></b></div></td>
	                   <td width="116" height="30"><div align="center"><b><%=orderDetail.getBookNum()%></b></div></td> 
				      </tr>
   		 				
   		 			<% }%>
   		 			
   		 		<% }%>
   		 	
 
                  
   </table>
  </body>
</html>
