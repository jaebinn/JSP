<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	//사용자 컴퓨터의 쿠키 저장소로부터 쿠키값을 읽어드림(몇개인지 모름)
	//-> 배열을 이용하여 쿠키를 저장
	Cookie []  cookies = request.getCookies(); // 쿠키를 읽어 배열에 저장
	String id = "";
	//쿠키값이 없을 경우를 위해 null처리 
	if(cookies != null){
		for(int i = 0; i< cookies.length; i ++){
			if(cookies[i].getName().equals("id")){
				id = cookies[i].getValue();
				break; //원하는 데이터를 찾았기에 반복문 탈출
			}
		}
	}
	
%>
<center>
<h2>쿠키 로그인</h2>
	<form action ="cookieLoginProc.jsp" method="post">
		<table width="400" border ="1">
			<tr height = "50">
				<td width="150">아이디</td>
				<td width="250"><input type="text" name="id" value ="<%=id %>"></td>
			</tr>
			<tr height="50">
				<td width="150">패스워드</td>
				<td width="250"><input type="password" name="pw"></td>
			</tr>
			<tr height ="50">
				<td colspan ="2"  align="center"><input type="checkbox" name="save" value="1">아이디 저장</td>
			</tr>
			<tr height ="50">
				<td colspan ="2" align="center"><input type="submit" value="로그인"></td>
			</tr>
		</table>
	</form>
</center>

</body>
</html>