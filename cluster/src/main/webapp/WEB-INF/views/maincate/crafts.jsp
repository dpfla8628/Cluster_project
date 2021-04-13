<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/maintemplate/header.jsp"></jsp:include>
<!DOCTYPE html>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<style>
  
  #sidebar-wrapper {
    position: absolute;
    width: 100px;
    height: 100%;
    background: white;
    overflow-x: scroll;
    overflow-y: scroll;
    margin-left: -20px;
    margin-top: 3rem;
  }
  /* 사이드바 스타일 */
  
  .sidebar-nav {
    width: 100px;
    margin: 0;
    padding: 0;
    list-style: none;
  }
  
  .sidebar-nav li {
    text-indent: 1.5em;
    line-height: 2.8em;
  }
  
  .sidebar-nav li a {
    display: block;
    text-decoration: none;
    color: black;
  }
  
  .sidebar-nav li a:hover {
    color: #ffc107;
    background: rgba(255, 255, 255, 0.2);
  }
  
  .sidebar-nav > .sidebar-brand {
    font-size: 1.3em;
    line-height: 3em;
  }
</style>
<script>

</script>

<div class="container">
	<div class="row">
	
		<div class="col-md-2" style="height: 15rem">
  			<div id="sidebar-wrapper">
  			
    			<ul class="sidebar-nav">
      				<li class="sidebar-brand">
        				<label>공예</label>
      				</li>
      				<li><a href="#">도자기</a></li>
      				<li><a href="#">가죽</a></li>
      				<li><a href="#">액세서리</a></li>
    			</ul>
    			
  			</div>
		</div>
		
	    <div class="col-md-10">
			<select class="selectpicker" name="selected"> 
				<option selected="selected" value="new">최신순</option>
				<option value="hprice">높은 가격순</option>
				<option value="rprice">낮은 가격순</option>
				<option value="manyLike">찜이 많은순</option> 
			</select>
	    </div>
	    
	</div>
</div>


<jsp:include page="/WEB-INF/views/maintemplate/footer.jsp"></jsp:include>
