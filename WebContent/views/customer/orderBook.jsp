<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		
			$("[name='payMethod']").change(function(){
				var method = $(this).val();
				if (method == 'card') {
					$("#cardPayMonth,#cardCompanyNm").show();
					$("#payOrdererHp").hide();
				}
				else {
					$("#cardPayMonth,#cardCompanyNm").hide();
					$("#payOrdererHp").show();
					$("[name='payOrdererHp']").val("${orderer.hp }");
				}
				
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
                <div class="col-lg-3">
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
                        <span>Order Book</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Checkout Section Begin -->
   <section class="checkout spad">
        <div class="container">
            <form action="orderBook" method="post" class="checkout__form">
                <input type="hidden" name="bookCd" value="${bookDTO.bookCd }">
                <input type="hidden" name="orderBookQty" value="${orderBookQty}">
                <input type="hidden" name="memberId" value="${memberDTO.memberId}">
                <input type="hidden" name="point" value="${bookDTO.point * orderBookQty}">
                <div class="row">
                	<div class="col-lg-12">
                        <div class="checkout__order">
                            <h5>Your order</h5>
                            <div class="checkout__order__product">
                                <ul>
                                    <li>
                                        <span class="top__text">Product</span>
                                        <span class="top__text__right">Total</span>
                                    </li>
                                    <li>01. ${bookDTO.bookNm } (${orderBookQty }권) <span><fmt:formatNumber value="${bookDTO.price - bookDTO.price * bookDTO.discountRt / 100 + bookDTO.deliveryPrice}"/>원</span></li>
                                    <br>
                                    <li>Price <span><fmt:formatNumber value="${(bookDTO.price - (bookDTO.price * bookDTO.discountRt / 100)) * orderBookQty}"/>원</span></li>
                                    <li>DeliveryPrice <span><fmt:formatNumber value="${bookDTO.deliveryPrice}"/>원</span></li>
                                    <li>Point <span><fmt:formatNumber value="${bookDTO.point * orderBookQty}"/>P 적립</span></li>
                                </ul>
                            </div>
                            <div class="checkout__order__total">
                                <c:set var="paymentAmt" value="${(bookDTO.price - (bookDTO.price * bookDTO.discountRt / 100)) * orderBookQty + bookDTO.deliveryPrice}"/>
                                <ul>
                                    <li>Total<span><fmt:formatNumber value="${paymentAmt }"/>원</span></li>
                                </ul>
                               	<input type="hidden" name="paymentAmt" value='<fmt:parseNumber integerOnly="true" value="${paymentAmt }"/>'/>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12">
	                	<br><br><br>
                        <h5>주문상세</h5>
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="checkout__form__input">
                                    <p>주문자 성함 </p>
                                    <input type="text" name="ordererNm" value="${memberDTO.memberNm }">
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="checkout__form__input">
                                    <p>주문자 연락처 </p>
                                    <input type="text" name="ordererHp" value="${memberDTO.hp }">
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="checkout__form__input">
                                    <p>받는분 이름 </p>
                                    <input type="text" name="receiverNm" value="${memberDTO.memberNm }">
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="checkout__form__input">
                                    <p>받는분 연락처 </p>
                                    <input type="text" name="receiverHp" value="${memberDTO.hp }">
                                </div>						 
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="checkout__order__widget">
                                    <p>포장여부 </p>
										<input type="radio" id="giftWrapping" name="giftWrapping" value="Y" checked > 예 &emsp;
										<input type="radio" id="giftWrapping" name="giftWrapping" value="N"> 아니요
									<p>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="checkout__order__widget">
                                     <p>배송방법 </p>
                                     <input type="radio" name="deliveryMethod" value="일반택배" checked> 일반택배 &emsp; 
									 <input type="radio" name="deliveryMethod" value="편의점택배"> 편의점택배 &emsp;
									 <input type="radio" name="deliveryMethod" value="해외배송"> 해외배송 &emsp;
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="checkout__order__widget">
                                    <p>지불방법 </p>
                                    <select name="payMethod">
                                    	<option value="card">카드결제</option>
                                    	<option value="phone">휴대폰결제</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12">
                            </div>
                            <div id="cardCompanyNm" class="col-lg-6 col-md-6 col-sm-6">
                                <div class="checkout__order__widget">
                                    <p>카드회사 </p>
	                                <select name="cardCompanyNm">
										<option value="삼성">삼성</option>
										<option value="하나SK">하나SK</option>
										<option value="현대">현대</option>
										<option value="KB">KB</option>
										<option value="신한">신한</option>
										<option value="롯데">롯데</option>
										<option value="BC">BC</option>
										<option value="시티">시티</option>
										<option value="NH농협">NH농협</option>
								   </select>
                                </div>
                            </div>
                            <div id="cardPayMonth" class="col-lg-6 col-md-6 col-sm-6">
                                <div class="checkout__order__widget">
                                    <p>할부개월 </p>
                                    <select name="cardPayMonth">
										<option value="0">일시불</option>                                    
										<option value="1">1개월</option>                                    
										<option value="2">2개월</option>                                    
										<option value="3">3개월</option>                                    
										<option value="4">4개월</option>                                    
										<option value="5">5개월</option>                                    
										<option value="6">6개월</option>                                    
                                    </select>
                                </div>
                            </div>
                            <div id="payOrdererHp" class="col-lg-6 col-md-6 col-sm-6" style="display: none">
                                <div class="checkout__form__input">
                                    <p>결제 휴대폰 번호 </p>
                                    <input type="text" name="payOrdererHp">
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12">
                            </div>
                            <div class="col-lg-12">
                                <div class="checkout__form__input">
                                    <p>배송메세지 </p>
                                    <input type="text" name="deliveryMessage" placeholder="배송메세지를 입력하세요.">
                                </div>
                            </div>
                            <br><br>
                            <div class="col-lg-12">
                                <div class="checkout__form__input">
                                    <p>우편번호 </p>
                                    <input type="text" id="zipcode" name="zipcode" value="${memberDTO.zipcode }" style="width: 10%;">
                                    <input type="button" value="주소 검색" onclick="execDaumPostcode();" style="width: 7%; padding-left: 0">
                                </div>
                                <div class="checkout__form__input">
                                    <p>도로명 주소 </p>
                                    <input type="text" id="roadAddress" name="roadAddress" value="${memberDTO.roadAddress }">
                                </div>
                                <div class="checkout__form__input">
                                    <p>지번 주소 </p>
                                    <input type="text" id="jibunAddress" name="jibunAddress" value="${memberDTO.jibunAddress }">
                                </div>
                                <div class="checkout__form__input">
                                    <p>나머지 주소 </p>
                                    <input type="text" id="namujiAddress" name="namujiAddress" value="${memberDTO.namujiAddress }">
                                </div>
                            </div>
                        </div>
	                     <div align="right">
	                        <button type="submit" class="site-btn"><span class="icon_check"></span> 주문</button>
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
                                <a href="#"><img src="bootstrap/img/payment/payment-1.png" alt=""></a>
                                <a href="#"><img src="bootstrap/img/payment/payment-2.png" alt=""></a>
                                <a href="#"><img src="bootstrap/img/payment/payment-3.png" alt=""></a>
                                <a href="#"><img src="bootstrap/img/payment/payment-4.png" alt=""></a>
                                <a href="#"><img src="bootstrap/img/payment/payment-5.png" alt=""></a>
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
        <script src="bootstrap/js/jquery-3.3.1.min.js"></script>
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