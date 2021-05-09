<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>글 상세보기</title>
		<link rel="stylesheet" type="text/css" href="/include/css/board.css"/>
		<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
		<script type="text/javascript">
		
		</script>
	</head>
	<body>
		<div id="boardTit"><h3>글 상세</h3></div>
		<form name="f_data" id="f_data" method="post">
			<input type="hidden" name="b_num" value="${boardDetail.b_num}"/>
			<input type="hidden" name="b_file" id="b_file" value="${boardDetail.b_file}"/>
		</form>
		<div id="boardDetail">
			<table>
				<colgroup>
					<col width="25%"/>
					<col width="25%"/>
					<col width="25%"/>
					<col width="25%"/>
				</colgroup>
				<tbody>
					<tr>
						<td class="ac">작성자</td>
						<td> ${boardDetail.b_name}</td>
						<td class="ac">작성일</td>
						<td> ${boardDetail.b_insertdate}</td>
					</tr>
					<tr>
						<td class="ac">제목</td>
						<td colspan="3">${boardDetail.b_title}</td>
					</tr>
					<tr class="ctr">
						<td class="ac">내용</td>
						<td colspan="3">${boardDetail.b_content}</td>
					</tr>
					<tr class="ctr">
						<td class="ac">첨부파일 </td>
						<td colspan="3"><img id="fileImage" /></td>
					</tr>
				</tbody>
			</table>
		</div>
	</body>
</html>