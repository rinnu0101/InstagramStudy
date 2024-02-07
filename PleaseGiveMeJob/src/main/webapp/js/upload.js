// 화면 초기화 및 기본 기능 적용
$(document).ready(function(){
    init();
});

function init()
{ 
    //스토리 재생, 멈춤 버튼 이미지 변경
    $(".SP_contents_play_btn").click(function(){
        fn_story_btn_toggle();
    });
    $(".SP_contents_stop_btn").click(function(){
        fn_story_btn_toggle();
    });
        
    // 피드 파일 첨부시 fnPrintFileLiFeed 함수 실행
    $("#input_file_feed").on("change", fnPrintFileLiFeed);

    // 스토리 파일 첨부시 fnPrintFileLiStory 함수 실행
    $("#input_file_story").on("change", fnPrintFileLiStory);

    setTimeout(() => {        
        //이모지 라이브러리 활성화
        //vue.js와의 시간차로 인해 setTimeout 설정
        $(".input_reply_home").emojioneArea({
            pickerPosition: "top",
            tones: false,
            autocomplete: false,
            inline: true,
            hidePickerOnBlur: false
        });
        
        $("#input_upload_text").emojioneArea({
            pickerPosition: "right",
            tones: false,
            autocomplete: false,
            inline: true,
            hidePickerOnBlur: false
        });

        $(".input_reply_feed").emojioneArea({
            pickerPosition: "top",
            tones: false,
            autocomplete: false,
            inline: true,
            hidePickerOnBlur: false
        });
    }, 10);
 }

//프로필&홈 화면에서의 피드 레이어팝업 함수
function fnPopFeed()
{
    var oWidth = $("#layerPopup_feed").outerWidth();
    var cWidth = $("#feed_layerPopup_contents").width();
    var ml = (oWidth-cWidth)/2;

    var oHeight = $("#layerPopup_feed").outerHeight();
    var cHeight = $("#feed_layerPopup_contents").height();
    var mt = (oHeight-cHeight)/2;
	
    $("#feed_layerPopup_contents").css("margin-left", ml);
    $("#feed_layerPopup_contents").css("margin-top", mt);
    $("#layerPopup_feed").css("margin-top", window.scrollY);
    $('body').css("overflow-y", "hidden");
}

function fnPopFeedClose()
{
    $("#FPCP_reply_text").find("input").val("");
    $("#layerPopup_feed").hide();
    $('body').css("overflow-y", "auto");
}

//새 게시물 레이어팝업 함수
function fnUploadOpen()
{
    var oWidth = $("#upload_feed").outerWidth();
    var cWidth = $("#upload_layerPopup_contents").width();
    var ml = (oWidth-cWidth)/2;

    var oHeight = $("#upload_feed").outerHeight();
    var cHeight = $("#upload_layerPopup_contents").height();
    var mt = (oHeight-cHeight)/2;
	
    $("#upload_layerPopup_contents").css("margin-left", ml);
    $("#upload_layerPopup_contents").css("margin-top", mt);
    $("#upload_feed").css("margin-top", window.scrollY);
    $("#upload_feed").show();
    $('body').css("overflow-y", "hidden");
}

function fnUploadClose()
{
    $("#upload_feed").hide();
    fnFileReset();
    $('body').css("overflow-y", "auto");
}

//새 게시물 저장 함수
function fnSaveNewFeed()
{
    //파일 업로드
    var form = $("form")[0];
    var formData = new FormData(form);
    
    for (var x = 0; x < content_files.length; x++)
    {
        formData.append("feed_file", content_files[x]);
    }

    //본문 텍스트 업로드
    formData.append("feed_contents", $("#upload_text").find("textarea").val());
    $("#upload_loading").css("display", "flex");

    $.ajax({
        type: "POST",
        enctype: "multipart/form-data",
        //url: "/file-upload.do",
        url: "/setSaveNewFeed.do",
        data : formData,
        processData: false,
        contentType: false,
        success: function (p) {
            if(p == "OK"){
                //alert("파일업로드 성공");

                //window.app.$root -> vuejs 저장값 경로
                window.app.$root.fnGetHomeFeedUpdate();
            }
            else
            {
                alert("서버내 오류로 처리가 지연되고 있습니다. 잠시 후 다시 시도해주세요");
            }
        },
        error: function (xhr, status, error) {
            alert("서버 오류로 처리가 지연되고 있습니다. 잠시 후 다시 시도해주시기 바랍니다.");
            return false;
        }
    });
}

//새 스토리 레이어팝업 함수
function fnStoryUpload()
{
    var oWidth = $("#upload_story").outerWidth();
    var cWidth = $("#upload_story_contents").width();
    var ml = (oWidth-cWidth)/2;

    var oHeight = $("#upload_story").outerHeight();
    var cHeight = $("#upload_story_contents").height();
    var mt = (oHeight-cHeight)/2;
	
    $("#upload_story_contents").css("margin-left", ml);
    $("#upload_story_contents").css("margin-top", mt);
    
    $("#upload_story").css("margin-top", window.scrollY);
    $("#upload_story").show();
    $('body').css("overflow-y", "hidden");
}

function fnStoryUploadClose()
{
    $("#upload_story").hide();
    fnStoryFileReset();
    $('body').css("overflow-y", "auto");
}

//새 스토리 저장 함수
function fnSaveNewStory()
{
    //파일 업로드
    var form = $("form")[0];
    var formData = new FormData(form);
    
    for (var x = 0; x < S_content_files.length; x++)
    {
        formData.append("story_file", S_content_files[x]);
    }

    $.ajax({
        type: "POST",
        enctype: "multipart/form-data",
        //url: "/file-upload.do",
        url: "/setSaveNewStory.do",
        data : formData,
        processData: false,
        contentType: false,
        success: function (p) {
            if(p == "OK"){
              //alert("파일업로드 성공");
              window.app.$root.fnGetHomeStoryList();              
            }
            else
            {
                alert("서버내 오류로 처리가 지연되고 있습니다. 잠시 후 다시 시도해주세요");
            }                      
            fnStoryUploadClose();
        },
        error: function (xhr, status, error) {
            alert("서버 오류로 처리가 지연되고 있습니다. 잠시 후 다시 시도해주시기 바랍니다.");
            return false;
        }
      });

    //todo : USE YN 처리

    // var saveNewStory =
   	// 	{
   	// 		'use_yn' : "Y"
   	// 	};

    // $.ajax({
    //     url : "/setSaveNewStory.do",
    // 	type : "POST",
    // 	data : saveNewStory,
    // 	success : function(p)
    //     {
    // 		if(p == "OK")
	// 		{
    //            console.log("성공");	            			
	// 		}
    //     },
    //    	error : function(p)
    //    	{
    //        console.log("실패");		                  
    //    	}
    // });
}

//홈 화면에서의 스토리 레이어팝업 함수
function fnLayerPopupOpen()
{
    var oWidth = $("#layerPopup_story").outerWidth();
    var cWidth = $("#story_layerPopup_contents").width();
    var ml = (oWidth-cWidth)/2;

    var oHeight = $("#layerPopup_story").outerHeight();
    var cHeight = $("#story_layerPopup_contents").height();
    var mt = (oHeight-cHeight)/2;

    $("#story_layerPopup_contents").css("margin-left", ml);
    $("#story_layerPopup_contents").css("margin-top", mt);
    $("#layerPopup_story").css("margin-top", window.scrollY);
    $("#layerPopup_story").show();
    $('body').css("overflow-y", "hidden");
}

//스토리 재생&멈춤 버튼 변경
function fn_story_btn_toggle()
{  
    if($(".SP_contents_play_btn").css("display") == "none")
    {
        /*stop 클릭했을 때 play버튼으로 변경*/
        $(".SP_contents_play_btn").show();
        $(".SP_contents_stop_btn").hide();
    }
    else
    {
        /*play 클릭했을 때 stop버튼으로 변경*/
        $(".SP_contents_play_btn").hide();
        $(".SP_contents_stop_btn").show();
    }
}


//스토리 슬라이드 적용
var story = $('#main_contents_story');
var storySlider = story.find('.story_friend_ul');
var storySlideLis = storySlider.find('li')
var storyLisBtn = story.find('.story_arrow');

//스토리 ul 너비 계산
var storyLiWidth = storySlideLis[0] == null ? 0 : storySlideLis[0].clientWidth;
var storySliderWidth = storyLiWidth * storySlideLis.length;
storySlider.css("width", storySliderWidth + "px");

let storyIdx = 0; // 슬라이드 현재 번호
let storyTrs = 0; // 슬라이드 위치 값
let showStoryCnt = 7; //화면 내 보이는 li 수

function fnMoveStorySlide(obj)
{
    var target = $(obj).attr("class");
    if (target == 'next')
    {
        if (storyIdx + showStoryCnt != storySlideLis.length)
        {
            storyTrs -= storyLiWidth;
            storySlider.animate({marginLeft : storyTrs});
            storyIdx += 1;
        }
    }
    else if (target == 'prev')
    {
        if (storyIdx != 0)
        {
            storyTrs += storyLiWidth;
            storySlider.animate({marginLeft : storyTrs});
            storyIdx -= 1;
        }
    }
}
    
//새 게시물 슬라이드 적용
var upload; //= $('#upload_contents');
var uploadSlider; //= upload.find('.upload_contents_ul');
var uploadSlideLis; //= uploadSlider.find('li')
var uploadLisBtn; //= upload.find('.upload_contents_arrow');

let uploadIdx = 0; // 슬라이드 현재 번호
let uploadTrs = 0; // 슬라이드 위치 값
let uploadCnt = 1; //화면 내 보이는 li 수

function fnMoveInit()
{        
    upload = $('#upload_contents');
    uploadSlider = upload.find('.upload_contents_ul');
    uploadSlideLis = uploadSlider.find('li');
    uploadLisBtn = upload.find('.upload_contents_arrow');
}

function fnMoveUploadSlide(obj)
{
    //새 게시물 ul 너비 계산
    var uploadLiWidth = uploadSlideLis[0].clientWidth;
    var uploadSliderWidth = uploadLiWidth * uploadSlideLis.length;
    uploadSlider.css("width", uploadSliderWidth + "px");

    var target = $(obj).attr("class");
    if (target == 'next')
    {
        if (uploadIdx + uploadCnt != uploadSlideLis.length)
        {
            uploadTrs -= uploadLiWidth;
            uploadSlider.animate({marginLeft : uploadTrs});
            uploadIdx += 1;
        }
    }
    else if (target == 'prev')
    {
        if (uploadIdx != 0)
        {
            uploadTrs += uploadLiWidth;
            uploadSlider.animate({marginLeft : uploadTrs});
            uploadIdx -= 1;
        }
    }
}

function fnFileSelect()
{
    $('#input_file_feed').click();
}

// 파일 현재 필드 숫자 totalCount랑 비교값
var fileCount = 0;
// 해당 숫자를 수정하여 전체 업로드 갯수를 정한다
var totalCount = 10;
// 파일 고유넘버
var fileNum = 0;
// 첨부파일 배열
var content_files = new Array();

function fnPrintFileLiFeed(e)
{
    var files = e.target.files;

    //파일 배열 담기
    var filesArr = Array.prototype.slice.call(files);

    // 파일 개수 확인 및 제한
    if (fileCount + filesArr.length > totalCount) {
        $.alert('파일은 최대 '+totalCount+'개까지 업로드 할 수 있습니다.');
        return;
    } else {
        fileCount = fileCount + filesArr.length;
    }
        
    //로딩시작
    // 각각의 파일 배열담기 및 기타
    filesArr.forEach(function (f) {     
        var reader = new FileReader();
        reader.onload = function (e) { 
            content_files.push(f);
            $('.upload_contents_ul').append(            
                '<li><img class="upload_contents_img" src="' + e.target.result + '" style="object-fit: cover;"></li>'
            );
                  
            fileNum ++;
            if(fileCount == fileNum)
            {
                //로딩끝
                $("#file_insert").hide();
                $(".upload_contents_ul").show();
                $(".upload_contents_arrow").show();
                fnMoveInit();
            }
        };
        reader.readAsDataURL(f);
    });
    console.log(content_files);

    //초기화 한다.
    $("#input_file_feed").val("");
}

//파일 업로드 초기화
function fnFileReset()
{
    fileCount = 0;
    totalCount = 10;
    fileNum = 0;
	content_files = new Array();
    
    $("#upload_text").find("textarea").val(""); // 본문 텍스트 초기화
	$("#file_insert").show();
    $(".upload_contents_ul").hide();
    $(".upload_contents_arrow").hide();
    $('.upload_contents_ul').html("");
}

//새 스토리 슬라이드 적용
var S_upload;
var S_uploadSlider;
var S_uploadSlideLis;
var S_uploadLisBtn;

let S_uploadIdx = 0; // 슬라이드 현재 번호
let S_uploadTrs = 0; // 슬라이드 위치 값
let S_uploadCnt = 1; //화면 내 보이는 li 수

function fnStoryMoveInit()
{        
    S_upload = $('#upload_story_contents');
    S_uploadSlider = S_upload.find('.upload_story_contents_ul');
    S_uploadSlideLis = S_uploadSlider.find('li');
    S_uploadLisBtn = S_upload.find('.upload_story_arrow');
}

function fnStoryMoveUploadSlide(obj)
{
    //새 스토리 ul 너비 계산
    var uploadLiWidth = S_uploadSlideLis[0].clientWidth;
    var uploadSliderWidth = uploadLiWidth * S_uploadSlideLis.length;
    S_uploadSlider.css("width", uploadSliderWidth + "px");

    var target = $(obj).attr("class");
    if (target == 'next')
    {
        if (S_uploadIdx + S_uploadCnt != S_uploadSlideLis.length)
        {
            S_uploadTrs -= uploadLiWidth;
            S_uploadSlider.animate({marginLeft : S_uploadTrs});
            S_uploadIdx += 1;
        }
    }
    else if (target == 'prev')
    {
        if (S_uploadIdx != 0)
        {
            S_uploadTrs += uploadLiWidth;
            S_uploadSlider.animate({marginLeft : S_uploadTrs});
            S_uploadIdx -= 1;
        }
    }
}

function fnStoryFileSelect()
{
    $('#input_file_story').click();
}

// 파일 현재 필드 숫자 totalCount랑 비교값
var S_fileCount = 0;
// 해당 숫자를 수정하여 전체 업로드 갯수를 정한다
var S_totalCount = 10;
// 파일 고유넘버
var S_fileNum = 0;
// 첨부파일 배열
var S_content_files = new Array();

function fnPrintFileLiStory(e)
{
    var files = e.target.files;

    //파일 배열 담기
    var filesArr = Array.prototype.slice.call(files);

    // 파일 개수 확인 및 제한
    if (S_fileCount + filesArr.length > S_totalCount) {
        $.alert('파일은 최대 '+S_totalCount+'개까지 업로드 할 수 있습니다.');
        return;
    } else {
        S_fileCount = S_fileCount + filesArr.length;
    }
        
    //로딩시작
    // 각각의 파일 배열담기 및 기타
    filesArr.forEach(function (f) {     
        var reader = new FileReader();
        reader.onload = function (e) { 
            S_content_files.push(f);
            $('.upload_story_contents_ul').append(            
                '<li><img class="upload_story_img" src="' + e.target.result + '" style="object-fit: cover;"></li>'
            );
                  
            S_fileNum ++;
            if(S_fileCount == S_fileNum)
            {
                //로딩끝
                $("#story_file_insert").hide();
                $(".upload_story_contents_ul").show();
                $(".upload_story_arrow").show();
                $("#upload_story_btn").show();
                fnStoryMoveInit();
            }
        };
        reader.readAsDataURL(f);
    });
    console.log(S_content_files);

    //초기화 한다.
    $("#input_file_story").val("");
}

//파일 업로드 초기화
function fnStoryFileReset()
{
    S_fileCount = 0;
    S_totalCount = 10;
    S_fileNum = 0;
	S_content_files = new Array();
	
	$("#story_file_insert").show();
    $(".upload_story_contents_ul").hide();
    $(".upload_story_arrow").hide();
    $("#upload_story_btn").hide();
    $('.upload_story_contents_ul').html("");
}