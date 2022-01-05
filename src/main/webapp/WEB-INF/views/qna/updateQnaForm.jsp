<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>http://localhost:9091/</title>
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

</head>
<body>

 <jsp:include page="/WEB-INF/views/menu/top.jsp" flush='false' />
        
  <DIV class='menu_line'></DIV>
    <h1>QnA 등록하기</h1>
      <FORM name='frm' method='POST' action='/qna' class="form-horizontal">
        <input type="hidden" name="adminnid" value="1"> <%-- 관리자 개발후 변경 필요 --%>
        
        <div class="form-group">
           <label class="control-label col-md-2">제목</label>
           <div class="col-md-10">
             <input type='text' name='title' value='FAQ title' required="required" 
                       autofocus="autofocus" class="form-control" style='width: 90%;'>
           </div>
        </div>
       
       
      <div class="form-group">
           <label class="control-label col-md-2">질문 카테고리 선택</label>
           <div class="col-md-10">
               <select name="travel2">
                      <option value="1" selected="selected">주택관련</option>  
                      <option value="2">홈페이지 이용</option>
                      <option value="3">기타 문의사항</option>
              </select>
           </div>
        </div>  

        <div class="form-group">
           <label class="control-label col-md-2">본문</label>
           <div class="col-md-10">
             <textarea name='text' required="required" class="form-control" rows="12" style='width: 90%;'>text in box</textarea>
           </div>
        </div>
        
         <div class="form-group">
          <IMG src='/member/images/lock.png' width = "18px" height="18px">
           <label class="control-label col-md-2">비밀글 </label>
           <div class="col-md-10">
            <input type="radio" name="secret" value="Y">YES
            <input type="radio" name="secret" value="N">NO
           </div>
        </div>
        
        <div class="content_body_bottom">
          <button type="submit" class="btn btn-primary">등록</button>
          <button type="button" onclick="/qnalist'" class="btn btn-primary">목록</button>
        </div>
      
      </FORM>
      <jsp:include page="/WEB-INF/views/menu/bottom.jsp" flush='false' />
</body>
</html>

