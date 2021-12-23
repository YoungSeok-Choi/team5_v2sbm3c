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
</head>
<body>
       <h1>FaQ 등록 폼</h1>
        
  <DIV class='menu_line'></DIV>
  
      <FORM name='frm' method='POST' action='/faq' class="form-horizontal">
        <input type="hidden" name="adminnid" value="1"> <%-- 관리자 개발후 변경 필요 --%>
        
        <div class="form-group">
           <label class="control-label col-md-2">제목</label>
           <div class="col-md-10">
             <input type='text' name='title' value='FAQ title' required="required" 
                       autofocus="autofocus" class="form-control" style='width: 100%;'>
           </div>
        </div>
        <div class="form-group">
           <label class="control-label col-md-2">본문</label>
           <div class="col-md-10">
             <textarea name='text' required="required" class="form-control" rows="12" style='width: 100%;'>text in box</textarea>
           </div>
        </div>

        <div class="content_body_bottom">
          <button type="submit" class="btn btn-primary">등록</button>
          <button type="button" onclick="/faqlist'" class="btn btn-primary">목록</button>
        </div>
      
      </FORM>
</body>
</html>

