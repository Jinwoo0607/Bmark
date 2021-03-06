<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Google Icon -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<script type="text/javascript">
	$(function(){
		/* mousehover 이벤트에 따라 GoogleIcon 변경 */	
		$('#plus1').hover(function() {
			$('#plus1').empty();
			$('#plus1').append("add_circle");
		}, function() {
			$('#plus1').empty();
			$('#plus1').append("add_circle_outline");
		});
		
		/* add_circle GoogleIcon을 클릭했을때 modal창 생성 */
		$('#plus1').click(function(){
			$('#bookaddform').css("display", "block")
		});
	});

	//자신만의 새로운 북마크 추가시, 모달 창에서 유효값 검사
	function myJJimCheck() {
		if(!mainbmark.mymodalname.value) {
			alert("사이트명을 입력하세요");
			mainbmark.mymodalname.focus();
			return false;
		}
		if(mainbmark.mymodaladdr.value == "https://") {
			alert("사이트 주소를 입력하세요");
			mainbmark.mymodaladdr.focus();
			return false;
		}
		if($('#main-catename option:selected').val() == "-") {
			alert("카테고리를 선택하세요");
			return false;
		}
		//submit으로 내용 내보내기(없으면 실행 불가)
		document.mainbmark.submit();
	}
</script>

<!-- 사이트 등록 Modal 창 -->
<div id="bookaddform" class="modal-add">

	<form class="modal-contentmain mainanimate" name="mainbmark" action="boardadd.mainbmark" method="POST">
		<div align="center">
			<h3>사이트 등록</h3>
		</div>

		<div class="container">
			<div align="left">
				<label for="uname"><b>사이트명</b></label> 
				<input type="text" placeholder="Title" name="mymodalname" class="inputinfo" required>
				<label for="addr"><b>주소</b></label>
				<input type="text" name="mymodaladdr" value="https://" class="inputinfo" required> 
				<label for="content"><b>설명</b></label>
				<input type="text" placeholder="Description" name="mymodalcontent" class="inputinfo">
				<label for="content"><b>분류</b></label>

				<!-- 분류 dropdown start  -->
				<select class="my-modal-category" id="main-catename" name="catename">
					<option value="-" selected="selected" disabled="disabled">선택하세요</option>
				</select>

				<!-- 분류 dropdown end  -->
				<br>
			</div>
			<div align="center">
				<button type="button" class="btn btn-primary" onclick="myJJimCheck();">등록</button>
				<button type="button" class="btn btn-default" onclick="document.getElementById('bookaddform').style.display='none'">
					취소</button>
			</div>
			<br>
		</div>
	</form>
</div>
<!-- 사이트 등록 Modal 창  종료 -->


<!-- My Book Mark 테이블 div -->
<div class="col-md-12 mycontainer">
	
	<div class="container" style="padding: 10px 0px 0px 0px">
		<!-- Google Book Icon -->
		<div style="float: left; width:20%">
		<i class="material-icons" style="font-size: 30px">book</i>
		</div>
		
		<div class="tablecontainer">
		<span style="color: white; font-size: 20px">My Book Mark</span>
		</div>
		
		<!-- Google add_circle_outline Icon -->
		<div style="float: right; width:20%">
		<i class="material-icons" id="plus1" style="font-size: 30px; cursor:pointer">add_circle_outline</i><br>
		</div>
		
	</div>
</div>
	
<div class="col-md-12 mycontainer">
	<!-- My Book Mark List Table -->
	<div class="mycontainertable">
		<table class="table" style="margin-bottom: 0">
			<thead>
				<tr>
					<th>로고</th>
					<th>사이트명</th>
				</tr>
			</thead>
			
		</table>
	</div>
	
	<div id="mainmyboard" class="mycontainertable myside">	
		
	</div>
</div>
	
