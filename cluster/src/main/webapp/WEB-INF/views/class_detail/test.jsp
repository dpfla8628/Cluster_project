<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="https://code.jquery.com/jquery-latest.min.js"></script>

<script>
var classNo = '${offClass.classNo}'; //게시글 번호

$('[name=commentInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시 
    var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
    commentInsert(insertData); //Insert 함수호출(아래)
});
 
 
 
//댓글 목록 
function commentList(){
    $.ajax({
        url : '/class_detail/list'+classNo,
        type : 'get',
        data : {'classNo':classNo},
        success : function(data){
            var a =''; 
            $.each(data, function(key, value){ 
                a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
                a += '<div class="commentInfo'+value.reviewNo+'">'+'댓글번호 : '+value.reviewNo+' / 작성자 : '+value.memberNick;
                a += '<a onclick="commentUpdate('+value.reviewNo+',\''+value.reviewOk+'\');"> 수정 </a>';
                a += '<a onclick="commentDelete('+value.reviewNo+');"> 삭제 </a> </div>';
                a += '<div class="commentContent'+value.reviewNo+'"> <p> 내용 : '+value.reviewOk +'</p>';
                a += '</div></div>';
            });
            
            $(".commentList").html(a);
        }
    });
}
 
//댓글 등록
function commentInsert(insertData){
    $.ajax({
        url : 'class_detail/update/'+classNo,
        type : 'post',
        data : insertData,
        success : function(data){
            if(data == 1) {
                commentList(); //댓글 작성 후 댓글 목록 reload
                $('[name=content]').val('');
            }
        }
    });
}
 
//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
function commentUpdate(reviewNo, reviewOk){
    var a ='';
    
    a += '<div class="input-group">';
    a += '<input type="text" class="form-control" name="content_'+cno+'" value="'+reviewOk+'"/>';
    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+reviewNo+');">수정</button> </span>';
    a += '</div>';
    
    $('.commentContent'+cno).html(a);
    
}
 
//댓글 수정
function commentUpdateProc(reviewNo){
    var updateContent = $('[name=content_'+reviewNo+']').val();
    
    $.ajax({
        url : 'class_detail/update/'+classNo,
        type : 'post',
        data : {'content' : updateContent, 'reviewNo' : reviewNo},
        success : function(data){
            if(data == 1) commentList(bno); //댓글 수정후 목록 출력 
        }
    });
}
 
//댓글 삭제 
function commentDelete(reviewNo){
    $.ajax({
        url : '/class_detail/delete/'+reviewNo,
        type : 'post',
        success : function(data){
            if(data == 1) commentList(classNo); //댓글 삭제후 목록 출력 
        }
    });
}
 
 
 
 
$(document).ready(function(){
    commentList(); //페이지 로딩시 댓글 목록 출력 
});
 
 


출처: https://private.tistory.com/65 [공부해서 남 주자]
   
</script>



 </head>
<body>
			 
 </body>
</html>