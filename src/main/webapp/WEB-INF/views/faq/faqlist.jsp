<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>심슨네 가족</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>

<body>

    <DIV class='title_line'> 자주묻는 질문(FAQ) </DIV>
    
    <DIV class='content_body'>
      <TABLE class='table table-striped'>
        <colgroup>
          <col style='width: 10%;'/>
          <col style='width: 10%;'/>
          <col style='width: 35%;'/>
          <col style='width: 15%;'/>    
          <col style='width: 10%;'/>
          <col style='width: 20%;'/>
        </colgroup>
       
        <thead>  
        <TR>
          <TH class="th_bs">제목<br> 성명 </TH>
          <TH class="th_bs">본문<br> id</TH>
          <TH class="th_bs">생성일자</TH>
          <TH class="th_bs">담당 관리자 번호</TH>
        </TR>
        </thead>
        
        <tbody> 
        <c:forEach var="faq" items="${lists }">
          <c:set var="title" value="${faq.title }" />
          <c:set var="text" value="${faq.text }" />
        <c:set var="cdate" value="${faq.cdate }" />
          <c:set var="adminid" value="${faq.adminid}"/>
          
          <TR>
            <TD class="td_bs"><a href="/categories?member_id=${title }">${title }</a></TD>
            <TD class="td_bs">${text }</TD>
            <TD class="td_bs">${cdate }</TD>
            <TD class="td_bs_left">${adminid }</TD>
            <TD class="td_bs">
              <A href="/" title="수정"><span class="glyphicon glyphicon-pencil"></span></A>
              <A href="/" title="삭제"><span class="glyphicon glyphicon-trash"></span></A>
            </TD>         
          </TR>   
        </c:forEach>

        </tbody>
       
      </TABLE>
    </DIV>
    <hr>
    
    <div style="text-align:left;">
        <a href="/"  class="btn btn-info">메인페이지</a>
        <button type="button" class="btn"><a href="/faq">FAQ 등록</a></button>
    </div>
</body>
</html>