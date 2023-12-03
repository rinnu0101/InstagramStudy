<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- css 리셋 -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" />
        <!-- 제이쿼리 불러오기 -->
        <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
        <!-- 스타일시트 적용 -->
        <link rel="stylesheet" href="css/ProfileChange.css">
        <link rel="stylesheet" href="css/LeftMenu.css">
        <!-- 공통js 적용 -->
        <script src="js/common.js"></script>

		<script>
			var profileImgChg = "N";
			var userNicknameChg = "N";
			var userPWChg = "N";

			//프로필 이미지 파일 선택 함수
			function fnProfileImgSelect()
			{
				$('#input_file_Profile').click();
			}

			var file;

			//선택한 프로필 이미지 반영 함수
			function fnProfileImgPrint(e)
			{
				file = e.target.files;
				
				//선택한 이미지 미리보기
				var reader = new FileReader();
				reader.onload = function (e) {
					$('#profile_img img').attr('src', e.target.result);
				};
				reader.readAsDataURL(file[0]);
				
				profileImgChg = "Y";
			}

			//프로필 정보 저장 함수
			function fnSaveProfile()
			{
				//파일 업로드
				var form = $("form")[0];
				var formData = new FormData(form);
				
				var nickname = $(".profile_nickname").find("input").val().replace(/\s/gi, "");
				var pw = $(".profile_PW").find("input").val().replace(/\s/gi, "");
				//.replace(/\s/gi, "") --> 입력값의 모든 공백 제거

				if(nickname != "")
				{
					userNicknameChg = "Y";	
				}
				else
				{
					userNicknameChg = "N";					
				}
				if(pw != "")
				{
					userPWChg = "Y";
				}
				else
				{
					userPWChg = "N";					
				}

				formData.append("profile_img_chg", profileImgChg);
				formData.append("user_nickname_chg", userNicknameChg);
				formData.append("user_pw_chg", userPWChg);

				formData.append("file", file != null ? file[0] : null);
				formData.append("user_nickname", nickname);
				formData.append("user_pw", pw);

				$.ajax({
					type: "POST",
					enctype: "multipart/form-data",
					//url: "/file-upload.do",
					url: "/setProfileInfo.do",
					data : formData,
					processData: false,
					contentType: false,
					success : function(p)
					{
						console.log(p);
						console.log("성공");
						if(p == "OK")
						{
							alert("회원정보가 변경되었습니다.");
							window.location.href = "/profile.do";
						}
						else if(p == "DUPL")
						{
							alert("닉네임이 중복입니다.");
						}
						else
						{
							alert("회원정보를 다시 확인하세요.");
						}
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
	    <div id="app">
	    	<!-- 파일 전송용 form -->
	    	<form name="tempForm" id="tempForm"></form>
	    	
	    	<div id="main">
	            <!-- 좌측 공통 메뉴영역 추가 -->
		        <jsp:include page="LeftMenu.jsp"></jsp:include>
	            
	            <!-- 프로필 레이어팝업 콘텐츠 html-->
	            <div id="profile_Change">            
	                <div id="profile_area">
	                    <div id="profile_info">
	                        <div id="profile_img">
				                <!-- todo : 계정 기존 이미지 없으면 하단 기본 프로필 적용 -->
	                            <img src="${file_name}" style="object-fit: cover;">	                            
	                            <div id="profile_img_change" onclick="fnProfileImgSelect();"> 프로필 사진 변경 </div>
	                            <!-- todo : onclick시 프로필 이미지 변경 & DB변경 -->
	                            <div style="display: none;">
	                                <input id="input_file_Profile" type="file"/>
	                            </div>
	                        </div>
	                        <div class="profile_info_text">
	                            -------------------- 내 프로필 --------------------
	                        </div>
	                        <div class="profile_ID">
	                            ID : <span> ${ user_id } </span>
	                        </div>
	                        <div class="profile_name">
	                            NAME : <span> ${ user_name } </span>
	                        </div>
	                        <div class="profile_nickname">
	                            <input type="text" placeholder="현재 닉네임 : ${ user_nickname }" />
	                            <div class="confirm">
	                                <img class="confirm_check" src="images\icon\check.png">
	                                <img class="confirm_error" src="images\icon\error.png">
	                            </div>
	                        </div>
	                        <div class="profile_PW">
	                            <input type="password" placeholder="비밀번호를 변경하려면 입력하세요."/>
	                            <!-- todo : 비밀번호 입력해야 저장되도록 하기 -->
	                            <!-- todo : 비밀번호 변경시 변경된 비밀번호로 DB 교체하기  -->
	                            <div class="confirm">
	                                <img class="confirm_show" src="images\icon\show.png">
	                                <img class="confirm_hide" src="images\icon\hide.png">
	                            </div>
	                        </div>
	                        <div class="profile_btn" onclick="fnSaveProfile();">
	                            	내 프로필 변경하기
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
        </div>
    </body>
</html>

<script src="js/upload.js"></script>
<script>
	//화면 초기화 및 기본 기능 적용
	$(document).ready(function(){
		// 프로필 이미지 파일 첨부시 fnProfileImgPrint 함수 실행
		$("#input_file_Profile").on("change", fnProfileImgPrint); 
	});
</script>