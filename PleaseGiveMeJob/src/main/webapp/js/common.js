// 스택 추가
history.pushState(null, null, location.href); 

// 뒤로가기 이벤트감지 -> 현재페이지로 이동
window.onpopstate = function() { 
	history.go(1); 
}

var goPage = function(type)
{
    if(type == "logo")
    {
        window.location.href = "/main.do"
    }
    else if(type == "main")
    {
        window.location.href = "/main.do"
    }
    else if(type == "login")
    {
        window.location.href = "/instagram.do"
    }
    else if(type == "join")
    {
        window.location.href = "/join.do"
    }
    else if(type == "findPW")
    {
        window.location.href = "/findPW.do"
    }
}