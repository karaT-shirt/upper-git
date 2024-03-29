<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 상세</title>
<%    
    String boardno = request.getParameter("boardno");        
%>
 
<c:set var="boardno" value="<%=boardno%>"/> <!-- 게시글 번호 -->
 
<!-- 공통 CSS -->
<link rel="stylesheet" type="text/css" href="/css/common/common.css"/>
 
<!-- 공통 JavaScript -->
<script type="text/javascript" src="/js/common/jquery.js"></script>
<script type="text/javascript">
    
    $(document).ready(function(){        
        getBoardDetail();        
    });
    
    /** 게시판 - 목록 페이지 이동 */
    function goBoardList(){                
        location.href = "/board/boardList";
    }
    
    /** 게시판 - 수정 페이지 이동 */
    function goBoardUpdate(){
        
        var boardno = $("#boardno").val();
        
        location.href = "/board/boardUpdate?boardno="+ boardno;
    }
    
    /** 게시판 - 상세 조회  */
    function getBoardDetail(boardno){
        
        var boardno = $("#boardno").val();
 
        if(boardno != ""){
            
            $.ajax({    
                
               url      : "/board/getBoardDetail",
               data     : $("#boardForm").serialize(),
               dataType : "JSON",
               cache    : false,
               async    : true,
               type     : "POST",    
               success  : function(obj) {
                    getBoardDetailCallback(obj);                
                },           
               error    : function(xhr, status, error) {}
                
             });
        } else {
            alert("오류가 발생했습니다.\n관리자에게 문의하세요.");
        }            
    }
    
    /** 게시판 - 상세 조회  콜백 함수 */
    function getBoardDetailCallback(obj){
        
        var str = "";
        
        if(obj != null){                                
                            
            var boardno        = obj.board_no; 
            var boardwriter     = obj.board_writer; 
            var boardtitle    = obj.board_title; 
            var boardcontent    = obj.board_content; 
            var boardhits       = obj.board_hits;
            var createdate         = obj.create_date; 
            var updatedate         = obj.update_date;
                    
            str += "<tr>";
            str += "<th>제목</th>";
            str += "<td>"+ boardtitle +"</td>";
            str += "<th>조회수</th>";
            str += "<td>"+ boardhits +"</td>";
            str += "</tr>";        
            str += "<tr>";
            str += "<th>작성자</th>";
            str += "<td>"+ boardwriter +"</td>";
            str += "<th>작성일시</th>";
            str += "<td>"+ createdate +"</td>";
            str += "</tr>";        
            str += "<tr>";
            str += "<th>내용</th>";
            str += "<td colspan='3'>"+ boardcontent +"</td>";
            str += "</tr>";
            
        } else {
            
            alert("등록된 글이 존재하지 않습니다.");
            return;
        }        
        
        $("#tbody").html(str);
    }
    
    /** 게시판 - 삭제  */
    function deleteBoard(){
 
        var boardno = $("#boardno").val();
        
        var yn = confirm("게시글을 삭제하시겠습니까?");        
        if(yn){
            
            $.ajax({    
                
               url      : "/board/deleteBoard",
               data     : $("#boardForm").serialize(),
               dataType : "JSON",
               cache    : false,
               async    : true,
               type     : "POST",    
               success  : function(obj) {
                    deleteBoardCallback(obj);                
                },           
               error    : function(xhr, status, error) {}
                
             });
        }        
    }
    
    /** 게시판 - 삭제 콜백 함수 */
    function deleteBoardCallback(obj){
    
        if(obj != null){        
            
            var result = obj.result;
            
            if(result == "SUCCESS"){                
                alert("게시글 삭제를 성공하였습니다.");                
                goBoardList();                
            } else {                
                alert("게시글 삭제를 실패하였습니다.");    
                return;
            }
        }
    }
    
</script>
</head>
<body>
<div id="wrap">
    <div id="container">
        <div class="inner">    
            <h2>게시글 상세</h2>
            <form id="boardForm" name="boardForm">        
                <table width="100%" class="table01">
                    <colgroup>
                        <col width="15%">
                        <col width="35%">
                        <col width="15%">
                        <col width="*">
                    </colgroup>
                    <tbody id="tbody">
                       
                    </tbody>
                </table>        
                <input type="hidden" id="board_no"        name="board_no"    value="${boardno}"/> <!-- 게시글 번호 -->
                <input type="hidden" id="search_type"    name="search_type"     value="S"/> <!-- 조회 타입 - 상세(S)/수정(U) -->
            </form>
            <div class="btn_right mt15">
                <button type="button" class="btn black mr5" onclick="javascript:goBoardList();">목록으로</button>
                <button type="button" class="btn black mr5" onclick="javascript:goBoardUpdate();">수정하기</button>
                <button type="button" class="btn black" onclick="javascript:deleteBoard();">삭제하기</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>