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


<script type="text/javascript">

$(function () {
  setRadioVal();
  setDropdown();
}); 
    
// DB에 저장된 값에 따라 radio, select tag 값 세팅.
 function setRadioVal() {
     var radio_ck = '${qnaVO.secret}';
     //alert(radio_ck);
     
        if (radio_ck == "Y") {
            $("#secretY").prop("checked", true);
        } else {
            $("#secretN").prop("checked",true);
        }

     }

function setDropdown() {
  var dropdown_ck = '${qnaVO.qcateno}';
  //alert(dropdown_ck); 
  
  if (dropdown_ck == 5) {
    $("#fk1").prop("selected", true);
  } else if (dropdown_ck == 6) {
    $("#fk2").prop("selected", true);
  } else if (dropdown_ck == 7) {
    $("#fk3").prop("selected", true);
  } else {
    $("#fk1").prop("selected", true);
  }
}

/* To-Do 
 *  정말로 삭제하시겠습까? 복구 안됩니다 확인하는 함수 만들어서 연결
          ㅇㄹㄴㅇㄹㄴㄹ
          
 
 */


</script>

</head>
<body>

    <!--써도 되는지 체크 -->
  <c:set var="qnano" value="${qnaVO.qnano }"></c:set>
  <c:set var="title" value="${qnaVO.title }" />
  <c:set var="text" value="${qnaVO.text }" />
  <c:set var="qdate" value="${qnaVO.qdate }" />
  <c:set var="secret" value="${qnaVO.secret }"></c:set>
  <c:set var="qcateno" value="${qnaVO.qcateno}"></c:set>


 <jsp:include page="/WEB-INF/views/menu/top.jsp" flush='false' />
        
 <DIV class='title_line'>삭제 확인창</DIV>
      <FORM name='frm' method='POST' action='/qna/${qnano }/delete.do' class="form-horizontal">
        <input type="hidden" name="adminnid" value="1"> <%-- 관리자 개발후 변경 필요 --%>
       
        
        <div class="form-group">
           <label class="control-label col-md-2">제목</label>
           <div class="col-md-10">
           <span class="form-control" style='width: 90%;'>${title }</span>
<%--              <input type='text' name='title' value='${title }' required="required" 
                       autofocus="autofocus" class="form-control" style='width: 90%;'> --%>
           </div>
        </div>
       
       
      <div class="form-group">
           <label class="control-label col-md-2">질문 카테고리</label>
           <div class="col-md-10">
               <select name="qcateno">
                      <option value="5" id="fk1">주택관련</option>  
                      <option value="6" id="fk2">홈페이지 이용</option>
                      <option value="7" id="fk3">기타 문의사항</option>
                      <%-- 데이터베이스별 지정된 FK값과 해당 옵션의 값이 다를 수 있습니다. 확인하세요! --%>
              </select>
           </div>
        </div>  

        <div class="form-group">
           <label class="control-label col-md-2">본문</label>
           <div class="col-md-10">
             <textarea name='text' required="required" class="form-control" rows="12" style='width: 90%;'>${text }</textarea>
           </div>
        </div>
        
         <div class="form-group">
           <label class="control-label col-md-2">비밀글 </label>
           <div class="col-md-10">
           <IMG src='/member/images/lock.png' width = "18px" height="18px">
            <input type="radio" name="secret" id="secretN" value="N">NO
            <input type="radio" name="secret" id="secretY" value="Y">YES
           </div>
        </div>
        
        <div class="content_body_bottom">
          <button type="submit" class="btn btn-primary">삭제하기</button>
          <button type="button" onclick="location.href='/qnalist'" class="btn btn-primary">목록</button>
        </div>
      
      </FORM>
      <jsp:include page="/WEB-INF/views/menu/bottom.jsp" flush='false' />
</body>
</html>

