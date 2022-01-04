<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<DIV class='container_main'> 
  <%-- 화면 상단 메뉴 --%>
  <DIV class='top_img'>
    <DIV class='top_menu_label'>주택 매물시스템</DIV>
    <NAV class='top_menu'>
      <span style='padding-left: 0.5%;'></span>
      <A class='menu_link'  href='/' >심슨's House</A><span class='top_menu_sep'> </span>
       
      <A class='menu_link'  href='/'>공지사항</A><span class='top_menu_sep'> </span>
      <A class='menu_link'  href='/'>주택정보 조회</A><span class='top_menu_sep'> </span>
      <A class='menu_link'  href='/'>주택 추천</A><span class='top_menu_sep'> </span>
      <A class='menu_link'  href='/'>My Q/A</A><span class='top_menu_sep'> </span>
      <A class='menu_link'  href='/faqlist'>자주묻는 질문(FAQ)</A><span class='top_menu_sep'> </span>
      <A class='menu_link'  href='/'>챗봇 서비스</A><span class='top_menu_sep'> </span>
      
      <c:choose>
        <c:when test="${sessionScope.id != null}"> <%-- 로그인 한 경우 --%>
           <A class='menu_link'  href='/member/read.do' onclick="location.href=this.href+'?memberid='+${sessionScope.memberid };return false;" >My Page</A><span class='top_menu_sep'> </span>
           ${sessionScope.id } <A class='menu_link'  href='/member/logout.do' >Logout</A><span class='top_menu_sep'> </span>           
        </c:when>
        <c:otherwise>
          <A class='menu_link'  href='/'>관리자 로그인</A><span class='top_menu_sep'> </span>
          <A class='menu_link'  href='/member/login.do' >Login</A><span class='top_menu_sep'> </span>   
        </c:otherwise>
      </c:choose>
      
    </NAV>
  </DIV>
  
  <%-- 내용 --%> 
  <DIV class='content'>