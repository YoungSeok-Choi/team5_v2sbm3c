<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>http://localhost:9091/</title>
<style type="text/css">
  *{ font-family: Malgun Gothic; font-size: 26px;}
</style>

<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">


<script>
$(function () {
    
});


</script>
</head>
<body>

 <jsp:include page="/WEB-INF/views/menu/top.jsp" flush='false' />
 
 <DIV class='title_line'>신규 카테고리 등록 (관리자 전용)</DIV>
    
    <DIV class='content_body'>
      <FORM name='frm' method='POST' action='/qnacate' class="form-horizontal">
        <input type="hidden" name="adminid" value="1"> 
        
        <div class="form-group">
           <label class="control-label col-md-3"> 카테고리 이름</label>
           <div class="col-md-9">
             <input type='text' name='name' value='' required="required" 
                       autofocus="autofocus" class="form-control" style='width: 50%;'>        
           </div>
        </div>
        <div class="content_body_bottom" style="padding-right: 20%;">
          <button type="submit" class="btn btn-primary">등록</button>
          <button type="button" onclick="location.href='/qnacatelist'" class="btn btn-primary">목록</button> <!-- list 구현필요 -->
        </div>
      
      </FORM>
    </DIV>
    
  <jsp:include page="/WEB-INF/views/menu/bottom.jsp" flush='false' />
  
</body>
</html>

