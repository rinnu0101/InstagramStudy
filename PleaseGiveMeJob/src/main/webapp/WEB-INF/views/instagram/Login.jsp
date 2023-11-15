<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- css 리셋 -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" />
        <!-- 제이쿼리 불러오기 -->
        <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
        <!-- 스타일시트 적용 -->
        <link rel="stylesheet" href="css/Login.css">
        <!-- 공통js 적용 -->
        <script src="js/common.js"></script>
        
        <script>
        	<!-- 스마트폰 화면 roof -->
            var arrImgPath = [2, 3, 4 ,1];
            var roof = 0;
            setInterval(function() {
                $(".screenshot_img").attr("src", "images/login_img/screenshot" + arrImgPath[roof] + ".png");
                roof = roof + 1;
                roof = roof == 4 ? 0 : roof;
            }, 3020);
            
            <!-- 로그인 정보 입력하기 -->
            function fnInputLoginInfo(){
            	var loginInfo =
	           		{
	           			'user_id' : $(".login_ID").find("input").val()
	   	            ,   'user_pw' : $(".login_PW").find("input").val()
	           		};
            	
            	//POST
                $.ajax({
                	url : "/getLoginInfo.do",
                	type : "POST",
                	data : loginInfo,
                	success : function(p)
		            {
                	   if(p==""){
                		   $(".pw_miss").show();
                		   $(".info_login").css("height", "400px");
                		   $(".login_forgot").css("margin-top", "0px");
                	   }
                	   else{
                		   //alert("로그인 성공");
                		   window.location.href = "/home.do";
                	   }
 		               console.log(p);
		               console.log("성공");
		            },
	               	error : function(p)
	               	{
			           console.log("실패");		                  
	               	}
                });
            }
            
            function test()
            {
            	$.ajax({
                	url : "/fileTest.do",
                	type : "POST",
                	data : loginInfo,
                	success : function(p)
		            {
                	   if(p==""){
                		   $(".pw_miss").show();
                		   $(".info_login").css("height", "400px");
                		   $(".login_forgot").css("margin-top", "0px");
                	   }
                	   else{
                		   alert("로그인 성공");
                		   window.location.href = "/home.do";
                	   }
 		               console.log(p);
		               console.log("성공");
		            },
	               	error : function(p)
	               	{
			           console.log("실패");		                  
	               	}
                });
            	
            }
            
        </script>
    </head>

    <body>
        <div id="main">
            <div class="main_top">
                <div class="main_area">
                    <div class="img_area">
                        <div class="phones">
                            <div class="screenshot">
                                <ul>
                                    <li>
                                        <img class="screenshot_img" src="images\login_img\screenshot1.png">
                                    </li>
                                </ul>
                            </div>
                            <img class="phones_img" src="images\login_img\home-phones.png">
                        </div>
                    </div>
                    <div class="info_area">
                        <div class="info_login">
                            <div class="login_logo">
                                <img class="login_logo_img" src="images\icon\logo.png">
                            </div>
                            <div class="login_ID">
                                <input type="text" placeholder="전화번호, 사용자 이름 또는 이메일"/>
                            </div>
                            <div class="login_PW">
                                <input type="password" placeholder="비밀번호"/>
                            </div>
                            <div class="login_btn" onclick="fnInputLoginInfo();">
                                	로그인
                                	<!-- todo : 로그인버튼 클릭시 DB값이 틀리면 pw_miss 클래스 보이게 한 후
                                				info_login height 400px / login_forgot margin-top 0px로 수정 -->
                            </div>
                            <div class="login_info_text">
                                -------------------- 또는 --------------------
                            </div>
                            <div class="login_fb">
                                <img class="login_fb_icon" src="images\icon\fb_logo.png">
                                Facebook으로 로그인
                            </div>
                            <div class="pw_miss">
                                	계정 정보를 다시 확인하세요.
                            </div>
                            <div class="login_forgot" onclick="goPage('findPW');">
                                	비밀번호를 잊으셨나요?
                            </div>
                        </div>
                        <div class="info_join">
                            	계정이 없으신가요?
                            <div id="join_btn" onclick="goPage('join');">가입하기</div>
                        </div>
                        <div class="info_download">
                            <div class="download_text">앱을 다운로드하세요.</div>
                            <div class="download_btn">
                                <div id="googleplay_btn">
                                    <img id='googleplay_btn_img' src="images\login_img\googleplay_btn.png"/>
                                </div>
                                <div id="microsoft_btn">
                                    <img id='microsoft_btn_img' src="images\login_img\microsoft_btn.png"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
           	<!-- 파일 업로드 테스트 --> 
            <!-- <form action="fileTest.do" method="post">
	            <input type="file" name="uploadFiles" multiple="multiple">
	            <input type="submit" value="전달">
            </form>
            
            <div class="container">
			  <h2>파일업로드</h2>
			  <form name="dataForm" id="dataForm" onsubmit="return registerAction()">
			  	<button id="btn-upload" type="button" style="border: 1px solid #ddd; outline: none;">파일 추가</button>
			  	<input id="input_file" multiple="multiple" type="file" style="display:none;">
			  	<span style="font-size:10px; color: gray;">※첨부파일은 최대 10개까지 등록이 가능합니다.</span>
			  	<div class="data_file_txt" id="data_file_txt" style="margin:40px;">
					<span>첨부 파일</span>
					<br />
					<div id="articlefileChange">
					</div>
				</div>
			  	<button type="submit" style="border: 1px solid #ddd; outline: none;">전송</button>
			  </form>
			</div> -->
            
            <div class="main_footer"></div>
        </div>
    </body>
    
	<!-- 파일업로드 test -->
	<script>
	$(document).ready(function()
	// input file 파일 첨부시 fileCheck 함수 실행
	{
		$("#input_file").on("change", fileCheck);
	});
	
	/* 첨부파일로직 */
	$(function () {
	    $('#btn-upload').click(function (e) {
	        e.preventDefault();
	        $('#input_file').click();
	    });
	});
	
	// 파일 현재 필드 숫자 totalCount랑 비교값
	var fileCount = 0;
	// 해당 숫자를 수정하여 전체 업로드 갯수를 정한다.
	var totalCount = 10;
	// 파일 고유넘버
	var fileNum = 0;
	// 첨부파일 배열
	var content_files = new Array();
	
	function fileCheck(e) {
	    var files = e.target.files;
	    
	    // 파일 배열 담기
	    var filesArr = Array.prototype.slice.call(files);
	    
	    // 파일 개수 확인 및 제한
	    if (fileCount + filesArr.length > totalCount) {
	      $.alert('파일은 최대 '+totalCount+'개까지 업로드 할 수 있습니다.');
	      return;
	    } else {
	    	 fileCount = fileCount + filesArr.length;
	    }
	    
	    // 각각의 파일 배열담기 및 기타
	    filesArr.forEach(function (f) {
	      var reader = new FileReader();
	      reader.onload = function (e) {
	        content_files.push(f);
	        $('#articlefileChange').append(
	       		'<div id="file' + fileNum + '" onclick="fileDelete(\'file' + fileNum + '\')">'
	       		+ '<font style="font-size:12px">' + f.name + '</font>'  
	       		+ '<img src="/img/icon_minus.png" style="width:20px; height:auto; vertical-align: middle; cursor: pointer;"/>' 
	       		+ '<div/>'
			);
	        fileNum ++;
	      };
	      reader.readAsDataURL(f);
	    });
	    console.log(content_files);
	    //초기화 한다.
	    $("#input_file").val("");
	  }
	
	// 파일 부분 삭제 함수
	function fileDelete(fileNum){
	    var no = fileNum.replace(/[^0-9]/g, "");
	    content_files[no].is_delete = true;
		$('#' + fileNum).remove();
		fileCount --;
	    console.log(content_files);
	}
	
	/*
	 * 폼 submit 로직
	 */
		function registerAction(){
			
		var form = $("form")[0];        
	 	var formData = new FormData(form);
			for (var x = 0; x < content_files.length; x++) {
				// 삭제 안한것만 담아 준다. 
				if(!content_files[x].is_delete){
					 formData.append("article_file", content_files[x]);
				}
			}
	   /*
	   * 파일업로드 multiple ajax처리
	   */    
		$.ajax({
	   	      type: "POST",
	   	   	  enctype: "multipart/form-data",
	   	      url: "/file-upload.do",
	       	  data : formData,
	       	  processData: false,
	   	      contentType: false,
	   	      success: function (data) {
	   	    	if(JSON.parse(data)['result'] == "OK"){
	   	    		alert("파일업로드 성공");
				} else
					alert("서버내 오류로 처리가 지연되고있습니다. 잠시 후 다시 시도해주세요");
	   	      },
	   	      error: function (xhr, status, error) {
	   	    	alert("서버오류로 지연되고있습니다. 잠시 후 다시 시도해주시기 바랍니다.");
	   	     return false;
	   	      }
	   	    });
	   	    return false;
		}
	</script>
</html>