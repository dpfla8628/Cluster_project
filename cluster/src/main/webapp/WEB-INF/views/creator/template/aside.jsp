<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<script src="../resources/package/swiper-bundle.min.js"></script>
<script src="../resources/vendors/js/core.js"></script>
<script src="../resources/js/template.js"></script>
<script src="../resources/js/dashboard.js"></script>
    
	<div class="page-body">
      <div class="sidebar">
        <ul class="navigation-menu">

		<li>
            <a href="#offClass" data-toggle="collapse" aria-expanded="false">
              <span class="link-title">강의</span>
              <i class="mdi mdi-palette"></i>
            </a>
            <ul class="collapse navigation-submenu" id="offClass">
              <li>
                <a href="/creator/classinfo">진행강의</a>
              </li>
              <li>
                <a href="/creator/classcheck">검수내역</a>
              </li>
            </ul>
          </li>
          
 		  <li>
            <a href="#sales" data-toggle="collapse" aria-expanded="false">
              <span class="link-title">매출</span>
              <i class="mdi mdi-chart-areaspline"></i>
            </a>
            <ul class="collapse navigation-submenu" id="sales">
              <li>
                <a href="/creator/salesbyclass">강의별</a>
              </li>
              <li>
                <a href="/creator/salesbyperiod">기간별</a>
              </li>
            </ul>
          </li>
          
          <li>
            <a href="/creator/inquiry">
              <span class="link-title">문의</span>
              <i class="mdi mdi-help-circle"></i>
            </a>
          </li>
          
        </ul>
        
     </div>