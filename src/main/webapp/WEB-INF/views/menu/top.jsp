<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">

   ul li{
    list-style: none;  /* 블렛기호(마커) 삭제 */
  }

  .link_menu_top {
    text-decoration: none;  /* 밑줄 없음 */
    color: #FFFFFF;
  }

  .link_menu_top:hover {  /* mouse hover */
    text-decoration: none;
    color: #FFFF00;
  }
    
  .link_menu_sub {
    text-decoration: none;
    color: #FFFF00;
  }

  /* id에 적용 */
  #menu {
    width: 100%;
    height: 50px;
    background: #DD0000;
    line-height: 50px; 
    margin:0 auto;
    text-align: center;
  }
  
  /* float 속성의 가운데 정렬 선언 */
  #menu ul {
    float: right; 
    position: relative; 
    left: -50%;  
  }

  /* top 메뉴 */
  #menu > ul > li {
    float: left;
    width: 130px;
    position: relative;
    left: 50%;
  }

  /* top 메뉴에 마우스가 hover되었을 때 배경색을 변경 */
  #menu > ul > li:hover {
    background-color: #EE0000;
  }

  /* 서브메뉴 속성 정의 */
  #menu > ul > li > ul {
    width: 130px;
    display: none;  /* 감춤 */
    background: #FF0000;
    position: relative;
    left: 0%;
  }
    
  /* 상단 메뉴에 마우스 hover시 하위 메뉴가 펼쳐지는 효과 발생 */
  #menu > ul > li:hover > ul {
    display: block; /* DIV 태그처럼 영역의 생성 */
  }
  
  #menu > ul > li > ul > li:hover {
    background: orange;
    transition: ease 1s; /* animation 효과 1초 발생 */
  }

</style>

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
      
      <c:choose>
        <c:when test="${sessionScope.id != null}"> <%-- 로그인 한 경우 --%>
            <A class='menu_link'  href='/qnalist'>My Q/A</A><span class='top_menu_sep'> </span>
        </c:when>
        <c:otherwise> <%-- 로그인 하지 않은경우 표시 x --%>
            <span></span>
        </c:otherwise>
      </c:choose>
      
      <A class='menu_link'  href='/faqlist'>자주묻는 질문(FAQ)</A><span class='top_menu_sep'> </span>
      <A class='menu_link'  href='/'>챗봇 서비스</A><span class='top_menu_sep'> </span>
      
      <c:choose>
        <c:when test="${sessionScope.id != null}"> <%-- 로그인 한 경우 --%>
           <A class='menu_link'  href='/member/read.do' onclick="location.href=this.href+'?memberid='+${sessionScope.memberid };return false;" >My Page</A><span class='top_menu_sep'> </span>
           [ ${sessionScope.id } ] <A class='menu_link'  href='/member/logout.do' >Logout</A><span class='top_menu_sep'> </span>           
        </c:when>
        <c:otherwise>
          <A class='menu_link'  href='/admin/login.do'>관리자 로그인</A><span class='top_menu_sep'> </span>
          <A class='menu_link'  href='/member/login.do' >Login</A><span class='top_menu_sep'> </span>   
        </c:otherwise>
      </c:choose>

      <c:choose>
        <c:when test="${sessionScope.adminid != null && sessionScope.admin_flag == true}">
          <a class='menu_link' href="/qnacatelist"><span class='menu_link' id=".">홈페이지 관리</span>  </a> 
        </c:when>
        <c:otherwise> <%-- 로그인 하지 않은경우 표시 x --%>
            <span></span>
        </c:otherwise>
      </c:choose>
      
    </NAV>
  </DIV>
  
  <%-- 내용 --%> 
  <DIV class='content'>