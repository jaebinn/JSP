<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML>
<html>
	<head>
		<title>에브리케어</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${cp}/css/main.css" />
		<link rel="stylesheet" href="${cp}/css/expert_list.css" />
	</head>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header">

						<!-- Logo -->
							<div class="logo">
								<a href="index.html"><strong>EveryCare</strong> </a>
							</div>

						<!-- Nav -->
							<nav id="nav">
								<ul>
									<li><a href="index.html">Home</a></li>
									<li>
										<a href="#" class="icon solid fa-angle-down">내정보</a>
										<ul>
											<li><a href="#"></a></li>
											<li><a href="#">Option Two</a></li>
											<li><a href="#">Option Three</a></li>
											<li>
												<a href="#">Submenu</a>
											</li>
										</ul>
									</li>
									<li><a href="generic.html">전문가 매칭</a></li>
									<li><a href="login.html"><input type="button" value="로그인" id="login_btn"></a></li>
									<li><a href="logout.html"><input type="button" value="로그아웃" id="logout_btn"></a></li>
									<li><a href="login.html"><input type="button" value="전문가등록" id="expert_btn"></a></li>		
								</ul>
							</nav>
					</header>

				<!-- Section -->
					<section id="one" class="main alt">
						<header class="expert_banner">
							<h1>전문가 매칭</h1>
						</header>
					</section>
					<main id="content">
						<div class="div_list">
							<div class="search">
								<div class="career_name" id="area_text"><span class="exam01">지역을 선택하시려면 클릭해주세요.</span></div>
								<div class="career_name" id="sphere_text"><span class="exam01">분야를 선택하시려면 클릭해주세요.</span></div>
							</div>
							<div class="tit"><span>전문가찾기</span>
								<span class="sort01">
								<form id="sortForm" action="${cp}/expertsort.ep?&page=${page}" method="post">
								    <select name="psort" class="psort" id="psort" onchange="document.getElementById('sortForm').submit();">
								        <option value="1" <%= session.getAttribute("psort") != null && session.getAttribute("psort").equals(1) ? "selected" : "" %>>좋아요순</option>                    
								        <option value="2" <%= session.getAttribute("psort") != null && session.getAttribute("psort").equals(2) ? "selected" : "" %>>시급낮은순</option>
								        <option value="3" <%= session.getAttribute("psort") != null && session.getAttribute("psort").equals(3) ? "selected" : "" %>>시급높은순</option>
								    </select>
								</form>
								</span>
							</div>
	
							<div class="expert_list">
								<c:choose>
									<c:when test="${list != null and list.size() > 0}">
										<c:forEach var="i" begin="0" end="${list.size() - 1}">
											<c:set var="expert" value="${list[i]}"/>
												<ul class="ul01">
													<li class="li01">
														<a href="${cp}/expertview.ep?expert_idx=${expert.expert_idx}&page=${page}">
															<p class="tab01">
																<img src="/images/profile.png" class="profile">
																<p class="like" id="follow43350" data-val="43350" data-code="MXFNd3JGL29tTlc3cnJPN0JJb1lGdz09"><span class="temperate">36.5도</span><span class="heart01 ">&nbsp;</span></p>
															</p>
															<p class="tab02">
																<span class="name">이름: ${expert.name} <span class="age">/ 나이: ${expert.age}</span></span>
																<p class="location">가능 지역: ${expert.location}</p>
																<p class="cost">시급: ${expert.cost}원 /<span class="available_time"> 가능시간: ${expert.available_time}</span></p>
															</p>
															<span class="tab03">
																<span>경력 : ${expert.career_name}</span>		
																 <span>/ 분야 : ${expert.keyword_list}</span>					
															</span>
														</a>
													</li>	
												</ul>
										</c:forEach>
									</c:when>
									<c:otherwise>					
										<p>전문가가 없습니다.</p>
									</c:otherwise>
								</c:choose>			
							</div>
						</div>
						<table class="pagination">
							<tbody>
								<tr>
									<td>
										<c:if test="${startPage != 1}">
											<a class="btn" href="${cp}/expertlist.ep?page=${startPage-1}">&lt;</a>
										</c:if>
										<c:forEach begin="${startPage}" end="${endPage}" var="i">
										<c:choose>
											<c:when test="${page == i}">
												<span class="nowPage">${i}</span>
											</c:when>
											<c:otherwise>
												<a class="btn" href="${cp}/expertlist.ep?page=${i}">${i}</a>
											</c:otherwise>
										</c:choose>
										</c:forEach>
										<c:if test="${endPage != totalPage}">
											<a class="btn" href="${cp}/expertlist.ep?page=${endPage+1}">&gt;</a>
										</c:if>
									</td>
								</tr>
							</tbody>
						</table>
					</main>
				
				<!-- Footer -->
					<footer id="footer">
						<div class="inner">
							<section>
								<h3>EveryCare</h3>
								<p>EveryCare는 사용자들의 개인 정보와 상담 내용을 철저히 보호하며, 안전한 결제 시스템을 통해 사용자들이 안심하고 서비스를 이용할 수 있도록 최선을 다하고 있습니다.</p>
								<ul class="icons">
									<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
									<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
									<li><a href="#" class="icon brands fa-linkedin-in"><span class="label">LinkedIn</span></a></li>
								</ul>
							</section>
							<section class="narrow">
								<h4>EveryCare SNS</h4>
								<ul class="links">
									<li><a href="#">인스타그램</a></li>
									<li><a href="#">페이스북</a></li>
									<li><a href="#">유튜브</a></li>
								</ul>
							</section>
							<section class="narrow">
								<h4>EveryCare 오픈채팅</h4>
								<ul class="links">
									<li><a href="#">링크</a></li>
									<li><a href="#">Vulputate tristique</a></li>
									<li><a href="#">Ultrices nulla</a></li>
									<li><a href="#">Cursus sed magna</a></li>
									<li><a href="#">Sed lectus donec</a></li>
								</ul>
							</section>
							<section>
								<h3>고객센터</h3>
								<p>EveryCare 고객센터는 여러분의 궁금증이나 문의사항에 친절하고 신속하게 대응해 드립니다. 저희 팀은 24시간 365일 연중무휴로 운영되며, 다음과 같은 서비스를 제공합니다.<p>
								<p><a href="#" class="major">(000) 000-0000</a></p>
							</section>
						</div>
						<div class="copyright">
							<p>&copy; EveryCare. All rights reserved.</p>
						</div>
					</footer>

			</div>

		<!-- Scripts -->
			<script> const cp = '${cp}';</script>
			<script src="${cp}/js/jquery.min.js"></script>
			<script src="${cp}/js/jquery.dropotron.min.js"></script>
			<script src="${cp}/js/jquery.selectorr.min.js"></script>
			<script src="${cp}/js/jquery.scrollex.min.js"></script>
			<script src="${cp}/js/jquery.scrolly.min.js"></script>
			<script src="${cp}/js/browser.min.js"></script>
			<script src="${cp}/js/breakpoints.min.js"></script>
			<script src="${cp}/js/util.js"></script>
			<script src="${cp}/js/main.js"></script>
			<script>
			// 전역 변수로 전체 전문가 리스트와 정렬된 전문가 리스트를 저장합니다.
			let expertList = [];
			let sortedExpertList = [];
			// 페이지당 전문가 수를 설정합니다.
			let expertsPerPage = 4;

			// 페이지가 변경될 때마다 해당 페이지에 맞는 데이터를 표시합니다.
			function displayExperts(page) {
			    // 해당 페이지의 전문가 리스트를 가져옵니다.
			    let startIndex = (page - 1) * expertsPerPage;
			    let endIndex = startIndex + expertsPerPage;
			    let currentPageExperts = sortedExpertList.slice(startIndex, endIndex);

			    // currentPageExperts를 사용하여 전문가 리스트를 표시하는 코드를 작성합니다.
			    // 예를 들어, 해당 페이지의 HTML을 동적으로 생성하거나, 템플릿을 사용하여 리스트를 업데이트할 수 있습니다.
			}

			// 전문가 리스트를 정렬하고 페이지별로 전문가를 표시합니다.
			function sortAndDisplayExperts(selectedOption) {
			    // 전체 전문가 리스트를 복사하여 정렬합니다.
			    sortedExpertList = expertList.slice();

			    if (selectedOption === "1") {
			        // 좋아요순 정렬
			        sortedExpertList.sort(function(a, b) {
			            return b.like_cnt - a.like_cnt;
			        });
			    } else if (selectedOption === "2") {
			        // 시급낮은순 정렬
			        sortedExpertList.sort(function(a, b) {
			            return parseFloat(a.cost) - parseFloat(b.cost);
			        });
			    } else if (selectedOption === "3") {
			        // 시급높은순 정렬
			        sortedExpertList.sort(function(a, b) {
			            return parseFloat(b.cost) - parseFloat(a.cost);
			        });
			    }

			    // 정렬된 전문가 리스트를 페이지별로 표시합니다.
			    displayExperts(1); // 첫 번째 페이지를 표시합니다.
			}

			$(document).ready(function() {
			    $('#psort').change(function() {
			        let selectedOption = $(this).children("option:selected").val(); // 선택된 옵션번호

			        // 전체 전문가 리스트를 정렬하고, 해당 정렬된 리스트를 페이지별로 표시합니다.
			        sortAndDisplayExperts(selectedOption);
			    });
			});
			</script>
	</body>
</html>