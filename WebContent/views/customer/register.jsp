<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ashion Template">
    <meta name="keywords" content="Ashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Ashion | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
    rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="bootstrap/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="bootstrap/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="bootstrap/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="bootstrap/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="bootstrap/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="bootstrap/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="bootstrap/css/style.css" type="text/css">
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script src="bootstrap/js/jquery-3.3.1.min.js"></script>
    <script>
		function execDaumPostcode() {
		    new daum.Postcode({
		        oncomplete: function(data) {
		
		            var fullRoadAddr = data.roadAddress; 
		            var extraRoadAddr = ''; 
		
		            if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                extraRoadAddr += data.bname;
		            }
		            if (data.buildingName !== '' && data.apartment === 'Y'){
		               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		            }
		            if (extraRoadAddr !== ''){
		                extraRoadAddr = ' (' + extraRoadAddr + ')';
		            }
		            if (fullRoadAddr !== ''){
		                fullRoadAddr += extraRoadAddr;
		            }
		
		            document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
		            document.getElementById('roadAddress').value = fullRoadAddr;
		            document.getElementById('jibunAddress').value = data.jibunAddress;
		          
		        }
		    }).open();
		}
	</script>
	<script>
		
		function modifyMember() {
			
			if ("${sessionScope.memberId == null}" == "true") {
				alert("로그인을 먼저 진행해주세요.");
				location.href = "login";
			}
			else {
				location.href = "modifyMember";
			}
			
		}
		
		function myOrderList() {
			
			if ("${sessionScope.memberId == null}" == "true") {
				alert("로그인을 먼저 진행해주세요.");
				location.href = "login";
			}
			else {
				location.href = "myOrderList";
			}
			
		}
	
		$().ready(function(){
			
			$("form").submit(function(){
				var birthDt = $("#birthY").val() + "-" + $("#birthM").val() + "-" + $("#birthD").val();
				$("[name='birthDt']").val(birthDt);
			});
			
		});

	</script>
</head>
<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Header Section Begin -->
    <header class="header">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xl-3 col-lg-2">
                    <div class="header__logo">
                        <a href="bookList"><img src="bootstrap/img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-xl-6 col-lg-7">
                    <nav class="header__menu">
                         <ul>
                            <li><a href="bookList">Home</a></li>
                            <li><a href="#">Pages</a>
                                <ul class="dropdown">
                                    <li><a href="javascript:modifyMember()">My Page</a></li>
                                    <li><a href="javascript:myOrderList()">My Order List</a></li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
                 <c:choose>
              		<c:when test="${sessionScope.memberId == null}">
                        <div class="header__right__auth">
                            <a href="login">Login</a>
                            <a href="register">Register</a>
                        </div>
                  		</c:when>
               		<c:otherwise>
                        <div class="header__right__auth">
                            로그인 계정 : '${sessionScope.memberId }' / 
                            <a href="logout">Logout</a>
                        </div>
               		</c:otherwise>
               	</c:choose>
            </div>
            <div class="canvas__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>
    <!-- Header Section End -->

    <!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="bookList"><i class="fa fa-home"></i> Home</a>
                        <span>Register</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <form action="register" method="post" class="checkout__form">
                    <div class="col-lg-8">
                        <h5>회원가입</h5>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="checkout__form__input">
                                    <p>아이디 </p>
                                    <input type="text" name="memberId" placeholder="아이디를 입력하세요.">
                                </div>
                                <div class="checkout__form__input">
                                    <p>비밀번호 </p>
                                    <input type="password" name="passwd" placeholder="비밀번호를 입력하세요.">
                                </div>
                                <div class="checkout__form__input">
                                    <p>이름 </p>
                                    <input type="text" name="memberNm" placeholder="이름을 입력하세요." >
                                </div>
                                <div>
                                    <p>성별 </p>
                                  	 남 &nbsp;<input type="radio" name="sex" value="m" checked> &emsp;
									 여 &nbsp;<input type="radio" name="sex" value="f">
                                </div><br>
                                <div>
                                   <p>생년월일 </p>
                                   <select id="birthY">
							        	<c:forEach var="i" begin="0" end="2023" >
							        		<option>${2023 - i}</option>
							        	</c:forEach>
							        </select>년 
						          	<select id="birthM">
							          	<c:forEach var="i" begin="1" end="12" >
							          		<c:choose>
							           		<c:when test="${i < 10 }">
							            		<option>0${i}</option>
							           		</c:when>
							           		<c:otherwise>
							            		<option>${i}</option>
							           		</c:otherwise>
							          		</c:choose>
							          	</c:forEach>
							         </select>월
							         <select id="birthD">
							          	<c:forEach var="i" begin="1" end="31" >
							          		<c:choose>
							           		<c:when test="${i < 10 }">
							            		<option>0${i}</option>
							           		</c:when>
							           		<c:otherwise>
							            		<option>${i}</option>
							           		</c:otherwise>
							          		</c:choose>
							          	</c:forEach>
							         </select>일
							         <input type="hidden" name="birthDt"/>
                                </div><br>
                                 <div class="checkout__form__input">
                                    <p>연락처 </p>
                                    <input type="text" name="hp" placeholder="-를 포함해서 입력하세요." ><br>
                                </div>
                                <div class="checkout__form__checkbox">
                                    <label for="smsstsYn">
                                        SMS 수신에 동의하시겠습니까?
                                        <input type="checkbox" id="smsstsYn" name="smsstsYn" value="Y" checked>
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                 <div class="checkout__form__input">
                                    <p>이메일 </p>
                                    <input type="text" name="email" placeholder="-를 포함해서 입력하세요." ><br>
                                </div>
                                <div class="checkout__form__checkbox">
                                    <label for="emailstsYn">
                                        이메일 수신에 동의하시겠습니까?
                                        <input type="checkbox" id="emailstsYn" name="emailstsYn" value="Y" checked>
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <br>
                                 <div class="checkout__form__input">
	                                우편번호 : <input type="text" id="zipcode" name="zipcode" style="width: 20%;">
									<input type="button" value="검색" onclick="execDaumPostcode();"style="width: 10%; padding-left: 0"><br>
									도로명 주소 <input type="text" id="roadAddress" name="roadAddress" placeholder="도로명주소를 입력하세요."><br>
									지번 주소 <input type="text" id="jibunAddress" name="jibunAddress" placeholder="지번주소를 입력하세요."><br>
									나머지 주소 <input type="text" id="namujiAddress" name="namujiAddress" placeholder="나머지주소를 입력하세요.">
                                </div>
                             </div>
                             <div align="right">
	                             <button type="submit" class="site-btn">가입하기</button>
                             </div>
                        </div>
                    </div>
                </form>
            </div>
        </section>
        <!-- Checkout Section End -->

        <!-- Footer Section Begin -->
        <footer class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-6 col-sm-7">
                        <div class="footer__about">
                            <div class="footer__logo">
                                <a href="bookList"><img src="bootstrap/img/logo.png" alt=""></a>
                            </div>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
                            cilisis.</p>
                            <div class="footer__payment">
                                <a href="#"><img src="img/payment/payment-1.png" alt=""></a>
                                <a href="#"><img src="img/payment/payment-2.png" alt=""></a>
                                <a href="#"><img src="img/payment/payment-3.png" alt=""></a>
                                <a href="#"><img src="img/payment/payment-4.png" alt=""></a>
                                <a href="#"><img src="img/payment/payment-5.png" alt=""></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-3 col-sm-5">
                        <div class="footer__widget">
                            <h6>Quick links</h6>
                            <ul>
                                <li><a href="#">About</a></li>
                                <li><a href="#">Blogs</a></li>
                                <li><a href="#">Contact</a></li>
                                <li><a href="#">FAQ</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-3 col-sm-4">
                        <div class="footer__widget">
                            <h6>Account</h6>
                            <ul>
                                <li><a href="#">My Account</a></li>
                                <li><a href="#">Orders Tracking</a></li>
                                <li><a href="#">Checkout</a></li>
                                <li><a href="#">Wishlist</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-8 col-sm-8">
                        <div class="footer__newslatter">
                            <h6>NEWSLETTER</h6>
                            <form action="#">
                                <input type="text" placeholder="Email">
                                <button type="submit" class="site-btn">Subscribe</button>
                            </form>
                            <div class="footer__social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-youtube-play"></i></a>
                                <a href="#"><i class="fa fa-instagram"></i></a>
                                <a href="#"><i class="fa fa-pinterest"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        <div class="footer__copyright__text">
                            <p>Copyright &copy; <script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a></p>
                        </div>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    </div>
                </div>
            </div>
        </footer>
        <!-- Footer Section End -->

        <!-- Search Begin -->
        <div class="search-model">
            <div class="h-100 d-flex align-items-center justify-content-center">
                <div class="search-close-switch">+</div>
                <form class="search-model-form">
                    <input type="text" id="search-input" placeholder="Search here.....">
                </form>
            </div>
        </div>
        <!-- Search End -->

        <!-- Js Plugins -->
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="bootstrap/js/jquery.magnific-popup.min.js"></script>
        <script src="bootstrap/js/jquery-ui.min.js"></script>
        <script src="bootstrap/js/mixitup.min.js"></script>
        <script src="bootstrap/js/jquery.countdown.min.js"></script>
        <script src="bootstrap/js/jquery.slicknav.js"></script>
        <script src="bootstrap/js/owl.carousel.min.js"></script>
        <script src="bootstrap/js/jquery.nicescroll.min.js"></script>
        <script src="bootstrap/js/main.js"></script>
    </body>

    </html>