<%@page import="model.*"%>
<%@page import="dao.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
</head>
<body>
<%
webDaoImpl webDao=new webDaoImpl();
List<question> questions=webDao.load_question();
for(question question:questions){
	String daan1=request.getParameter(question.getQuestion_type());
	if(daan1==null){
		 session.setAttribute("err", "请答完所有题目");
		   %>
		    <<jsp:forward page="test-one.jsp"></jsp:forward>	
		    <%
	}
}
%>
<form action="test-two.jsp" method="post">
	<div class="x-n/av">
		<span class="layui-breadcrumb"> <a><cite>首页</cite></a> <a><cite>心理诊断测试</cite></a>
		</span> <a class="layui-btn layui-btn-small"
			style="line-height: 1.6em; margin-top: 3px; float: right"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="layui-icon" style="line-height: 30px">ဂ</i></a>
	</div>
	<section class="container">  
		<div class="container">
			<ul class="payment-wizard">
			<%
			
			int i=1;
		/* 	HttpSession session = request.getSession(); */
           patient patient=(patient)session.getAttribute("patient");
		   String name=patient.getPatient_name();
			for(question question:questions){
				String daan=request.getParameter(question.getQuestion_type());
			%>
				<li class="active">
					<table width="90%">
					<tr>
						<th align="left" style="background:#BBFl;margin-top:7px" colspan="4"><%=i%>.<%=question.getQuestion_type()%></th>
					</tr>
					<tr>
						<td style="margin-top:7px">&nbsp;&nbsp;&nbsp;&nbsp;<%=question.getQueston_name()%></td>
					</tr>
					<tr>
					<td><div style="background:#EEE;margin-left:15px;margin-right:15px;margin-top:7px">
					你的答案：<%=daan%><br/>&nbsp;&nbsp;&nbsp;&nbsp;
					<%
					String shuchu="";
					if(question.getQuestion_type().equals("反应力和判断力")){
						if(daan.equals("面纸")){
							shuchu="你的反应能力算是差强人意，但是由于你是个十分注重礼仪的人，所以你的观察力算不错，能由对方的一点小动作，推出他人企图及动机。";
						}
						else if(daan.equals("")){
							shuchu="由于你的观察力十分敏锐，猜测事情通常八九不离十，然而你的缺点是太爱探测他人的隐私，真正该关心的事物反而不去注意，这可会使你在做事时，放错了重点喔！";
						}
						else if(daan.equals("")){
							shuchu="一群人一起出去玩时，最能发挥你的敏锐观察力了，因为你很怕大家都不付账，于是乎你会一会一直注意他人没有掏钱的动作，若没有付账的意思，厕所和先去打个电话，就是你标准逃避藉口。";
						}
						else {
							shuchu="因为你很注意表面工夫，在乎外表得不得体，所以你对他人的观察能力很差，对事物的反应力更是差得无人可及。你这种人最容易吃亏上当";
						}
					}
					else if(question.getQuestion_type().equals("洞察力")){
						if(daan.equals("小女孩卖火柴")){
							shuchu="贫苦的小孩极需要钱过圣诞，怎么会卖火柴？在这喜气洋洋、家家狂欢的年节，再奢侈的东西人家也舍得买。这时卖火柴，够蠢，不是很不协调吗？能表达这观点的人，看人的眼光一级棒";
						}
						else if(daan.equals("小女孩不从父亲那里逃出来")){
							shuchu="在家被酗酒的父亲虐待，还要出来赚钱养他。不离开父亲，所以不断被折磨受苦。离开父亲的魔掌，就可能脱离苦海。你看出这原因与结果的矛盾表示你对别人的言行，有冷静的分析能力";
						}
						else if(daan.equals("没有一个人帮助那小女孩")){
							shuchu="以“没有人帮助小女孩”觉得奇怪，正是中了原作者的下怀。这也表示你看人的眼光稍差。为人正直是件好事。但你毫无疑人之心，人家说的话照单全收，丝毫没有防人之心，却不是好事";
						}
						else {
							shuchu="太着急于表象，重视结果甚于过程。对你来说，要紧的是结果怎样，而不是如何费心花巧思做出来。在经商上，这也许行得通。不过你会对作弊得来95分，比靠努力与实力得到的6分，给予更高的评价。";
						}
					}
					else if(question.getQuestion_type().equals("具备领导的才能")){
						if(daan.equals("两人刚认识时的甜蜜回忆")){
							shuchu="你的领导才能会发挥在小团体，一旦人变多了、关系变得复杂了，你就会掌控不住，甚至招致民怨，“宁为鸡首、不为牛尾”应该就是说明你领导力如何的最佳说法了。";
						}
						else if(daan.equals("分手时的感觉")){
							shuchu="你在团体当中通常是一个帮大家做事的角色，你的生活哲学是“平生无大志，只求有饭吃”，随遇而安的个性，让你完全没有名利之心，觉得照顾好自己最实在。";
						}
						else if(daan.equals("当初介入你们的第三者")){
							shuchu="你有领导的才能，可惜却没有领导的气度。想要让一群人对你服从，可不是很有才华就可以的，你必须懂得唯才是用、能屈能伸、善用智谋，如果只有勇气和冲劲是不够的。";
						}
						else {
							shuchu="你是天生的领导者，有指挥群众的天份和魅力。你并不会刻意表现出自己的野心和企图心，但是大家自然就会找你解决问题，喜欢和你在一起，可能就是你有一股王者的风范吧";
						}
					}
					else if(question.getQuestion_type().equals("理财观念")){
						if(daan.equals("旧衣服")){
							shuchu="你赚钱的能力很强，花钱的能力更强，尽管你收入很高，但仍然觉得自己钱不够花。";
						}
						else if(daan.equals("体积过大的老电器")){
							shuchu="你的理财观念属于冲动派，虽然买起东西来不至于浪费，但是却常常买了一些用不着的装饰品、衣服等等，而你又不擅于另开财源，因此你需要一个擅于管帐的人帮助你。";
						}
						else if(daan.equals("零零碎碎的小东西")){
							shuchu="你买东西至少考虑三次以上，但是在朋友面前又装作花钱毫不在乎的样子，所以一般人都觉得你的经济很宽裕，实际上你是个开源和节流都并重的理财大师。";
						}
						else {
							shuchu="你从不乱花钱，购买的东西通常都物美价廉。美中不足的是，你只在节流方面努力，很少思考开源的方法。";
						}
					}
					else if(question.getQuestion_type().equals("创业能力")){
						if(daan.equals("自己添些钱把大衣买回来")){
							shuchu="你的决断力还算不错，虽然有时会三心二意，犹豫徘徊，可是总是在紧要关头出决定，比起普通人来说已经算是杰出的了！";
						}
						else if(daan.equals("买运动鞋再去买些其他小东西")){
							shuchu="你是标准拿不定主意的人，做事没有主见，处处要求别人给你意见，你很少自己做判断，因为个性上你有些自卑，不能肯定自己，你这种人一定曾经受过某些心理伤害，或者周遭的任务太优秀了，因此造成你老是不如人的感觉。";
						}
						else{
							shuchu="你对家的依赖性很高，若不到必要，你是不会离家独居的，即使迫于无奈你仍和家人保持密切的联系。你是个很顾家的人，紫罗兰的话语是永恒，正是你心目中家的功能。";
						} 
						
					}
					
					%>
					<%=shuchu %>
					<%
					resultDaoImpl resultDao=new resultDaoImpl();
					result result=new result(name,daan,question.getQuestion_type(),question.getQueston_name());
					resultDao.add(result);
					%>
					
							</div></td>
						
					</tr>
				</table>
				<br/>
				</li>
				<%
				i++;
				} %>
				
			</ul>
		</div>
		
		<span style="float: right; padding-top: 20px;">
		<input type="submit" value="完成" class=""btn-green">
		</span>
	</section>
	</form>
	<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="js/js.js"></script>
	<script src="./lib/layui/layui.js" charset="utf-8"></script>
	<script src="./js/x-layui.js" charset="utf-8"></script>
	<script>
            layui.use(['element','laypage','layer','form'], function(){
                $ = layui.jquery;//jquery
              lement = layui.element();//面包导航
              laypage = layui.laypage;//分页
              layer = layui.layer;//弹出层
              form = layui.form();//弹出层
			   });
            </script>
</body>
</html>
</body>
</html>