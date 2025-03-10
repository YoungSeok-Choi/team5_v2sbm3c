<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>
  .btn-primary {
    color: #fff;
    background-color: #2c3e50;
    border-color: #2c3e50;
  }
  
  .btn-info {
    color: #fff;
    background-color: #3498db;
    border-color: #3498db;
  }
</style>

<script type="text/javascript">
  $(function() { // 자동 실행
    $('#btn_send').on('click', send); 
    $('#btn_close').on('click', setFocus); // Dialog창을 닫은후의 focus 이동

    $('#new_passwd').keyup(function () {
      $('#chkNotice').html('');
    });

    $('#new_passwd2').keyup(function () { // 패스워드 일치여부 확인
      if ($('#new_passwd').val() != '' && $('#new_passwd2').val() == '') {
        null;
      } else if ($('#new_passwd').val() != '' && $('#new_passwd2').val() != '') {
        if ($('#new_passwd').val() != $('#new_passwd2').val()) {
          $('#chkNotice').html('패스워드가 일치하지 않습니다.<br>');
          $('#chkNotice').attr('style', 'color: #ff4114; font-size: 13px;');
        } else {
          $('#chkNotice').html('패스워드가 일치합니다<br>');
          $('#chkNotice').attr('style', 'color: #126E82; font-size: 13px;');
        }
      }
    });

  });

  function send() {
    if ($('#current_passwd').val() == "" | $('#new_passwd').val() == "" | $('#new_passwd2').val() == "") {
      msg = '항목을 입력하세요.<br>';
      $('#modal_content').attr('class', 'alert alert-danger'); // CSS 변경
      $('#modal_title').html('항목 입력 확인'); // 제목 
      $('#modal_content').html(msg); // 내용
      $('#modal_panel').modal(); // 다이얼로그 출력

      // $('#btn_send').attr('data-focus', 'email');
      return false; // submit 중지

    } else if ($('#new_passwd').val() != $('#new_passwd2').val()) {
      msg = '· 입력된 패스워드가 일치하지 않습니다.<br>';
      msg += "· 패스워드를 다시 입력해주세요.<br>"; 
      
      $('#modal_content').attr('class', 'alert alert-danger'); // CSS 변경
      $('#modal_title').html('패스워드 일치 여부  확인'); // 제목 
      $('#modal_content').html(msg);  // 내용
      $('#modal_panel').modal();         // 다이얼로그 출력
      
      $('#btn_close').attr("data-focus", "new_passwd");
      
      return false; // submit 중지
    }

    $('#frm').submit();
  }
  
  function setFocus() {  // focus 이동
    var tag = $('#btn_close').attr('data-focus'); // 포커스를 적용할 태그 id 가져오기
    $('#' + tag).focus(); // 포커스 지정
  }
  
</script>

</head> 
 
 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
 
  <!-- ---------- Modal ---------- -->
  <div class="modal fade" id="modal_panel" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title" id='modal_title'></h4>
        </div>
        <div class="modal-body">
          <p id='modal_content'></p>
        </div>
        <div class="modal-footer">
          <button type="button" id="btn_close" data-focus=""
                     class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div> <!-- ---------- Modal END ---------- -->
 
  <DIV class='title_line'>
    ${name}님 패스워드 변경    
  </DIV>

  <DIV class='content_body'>
    <FORM name='frm' id='frm' method='POST' action='./passwd_update.do' 
                class="form-horizontal">
      <input type='hidden' name='memberid' id='memberid' value='${param.memberid }'>        
      
      <div class="form-group">
        <label class="col-md-5 control-label" style="font-size: 0.9em;">현재 패스워드</label>    
        <div class="col-md-7">
          <input type='password' class="form-control" name='current_passwd' 
                    id='current_passwd' value='' required="required" 
                    style='width: 30%;' placeholder="패스워드">
        </div>
      </div>   
                      
      <div class="form-group">
        <label class="col-md-5 control-label" style="font-size: 0.9em;">새로운 패스워드</label>    
        <div class="col-md-7">
          <input type='password' class="form-control" name='new_passwd' 
                    id='new_passwd' value='' required="required" 
                    style='width: 30%;' placeholder="패스워드">
        </div>
      </div>   
   
      <div class="form-group">
        <label class="col-md-5 control-label" style="font-size: 0.9em;">새로운 패스워드 확인</label>    
        <div class="col-md-7">
          <input type='password' class="form-control" name='new_passwd2' 
                    id='new_passwd2' value='' required="required" 
                    style='width: 30%;' placeholder="패스워드">
          <font id="chkNotice" size="2"></font>
        </div>
      </div>   
      
      <div class="form-group">
        <div class="col-md-offset-5 col-md-7">
          <button type="button" id='btn_send' class="btn btn-primary btn-md">변경</button>
          <button type="button" onclick="history.go(-1);" class="btn btn-primary btn-md">취소</button>
   
        </div>
      </div>   
  </FORM>
</DIV> <%--  <DIV class='content_body'> END --%>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>