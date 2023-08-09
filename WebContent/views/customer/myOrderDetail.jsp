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
    <script src="bootstrap/js/jquery-3.3.1.min.js"></script>
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
    
    	$(function(){
    		
    		$("[name='giftWrapping']").each(function(){
    			if ($(this).val() ==  "${orderMap.giftWrapping}") {
    				$(this).prop("checked" , true);
    			}
    		}); 
    		
    		$("[name='deliveryMethod']").each(function(){
    			if ($(this).val() ==  "${orderMap.deliveryMethod}") {
    				$(this).prop("checked" , true);
    			}
    		}); 
    		
    		$("[name='cardCompanyNm']").val("${orderMap.cardCompanyNm}");
    		$("[name='payMethod']").val("${orderMap.payMethod}");
    		$("[name='cardPayMonth']").val("${orderMap.cardPayMonth}");
    		
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
                        <span>My Order Detail</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->
	
	    <!-- Checkout Section Begin -->
   <section class="checkout spad">
        <div class="container">
            <form action="${contextPath }/order/orderGoods" method="post" class="checkout__form">
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
                                    <li>01. ${orderMap.bookNm } (${orderMap.orderBookQty }권) <span><fmt:formatNumber value="${orderMap.price - orderMap.price * orderMap.discountRt / 100 + orderMap.deliveryPrice}"/>원</span></li>
                                    <br>
                                    <li>Price <span><fmt:formatNumber value="${(orderMap.price - (orderMap.price * orderMap.discountRt / 100)) * orderMap.orderBookQty}"/>원</span></li>
                                    <li>DeliveryPrice <span><fmt:formatNumber value="${orderMap.deliveryPrice}"/>원</span></li>
                                    <li>Point <span><fmt:formatNumber value="${orderMap.point * orderMap.orderBookQty}"/>P 적립</span></li>
                                </ul>
                            </div>
                            <div class="checkout__order__total">
                                <c:set var="paymentAmt" value="${(orderMap.price - (orderMap.price * orderMap.discountRt / 100)) * orderBookQty + orderMap.deliveryPrice}"/>
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
                                    <input type="text" name="ordererNm" value="${orderMap.ordererNm }" disabled>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="checkout__form__input">
                                    <p>주문자 연락처 </p>
                                    <input type="text" name="orderMapHp" value="${orderMap.ordererHp }" disabled>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="checkout__form__input">
                                    <p>받는분 이름 </p>
                                    <input type="text" name="receiverNm" value="${orderMap.receiverNm }" disabled>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="checkout__form__input">
                                    <p>받는분 연락처 </p>
                                    <input type="text" name="receiverHp" value="${orderMap.receiverHp }" disabled>
                                </div>						 
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="checkout__order__widget">
                                    <p>포장여부 </p>
										<input type="radio" id="giftWrapping" name="giftWrapping" value="Y" disabled> 예 &emsp;
										<input type="radio" id="giftWrapping" name="giftWrapping" value="N" disabled> 아니요
									<p>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="checkout__order__widget">
                                     <p>배송방법 </p>
                                     <input type="radio" name="deliveryMethod" value="일반택배"  disabled> 일반택배 &emsp; 
									 <input type="radio" name="deliveryMethod" value="편의점택배" disabled> 편의점택배 &emsp;
									 <input type="radio" name="deliveryMethod" value="해외배송" disabled> 해외배송 &emsp;
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="checkout__order__widget">
                                    <p>지불방법 </p>
                                    <select name="payMethod" disabled>
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
	                                <select name="cardCompanyNm" disabled>
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
                                    <select name="cardPayMonth" disabled>
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
                                    <input type="text" name="payOrdererHp" value="${payOrdererHp }" disabled>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12">
                            </div>
                            <div class="col-lg-12">
                                <div class="checkout__form__input">
                                    <p>배송메세지 </p>
                                    <input type="text" name="deliveryMessage" value="${orderMap.deliveryMessage }" disabled>
                                </div>
                            </div>
                            <br><br>
                            <div class="col-lg-12">
                                <div class="checkout__form__input">
                                    <p>우편번호 </p>
                                    <input type="text" id="zipcode" name="zipcode" value="${orderMap.zipcode }" style="width: 10%;" disabled>
                                </div>
                                <div class="checkout__form__input">
                                    <p>도로명 주소 </p>
                                    <input type="text" id="roadAddress" name="roadAddress" value="${orderMap.roadAddress }" disabled>
                                </div>
                                <div class="checkout__form__input">
                                    <p>지번 주소 </p>
                                    <input type="text" id="jibunAddress" name="jibunAddress" value="${orderMap.jibunAddress }" disabled>
                                </div>
                                <div class="checkout__form__input">
                                    <p>나머지 주소 </p>
                                    <input type="text" id="namujiAddress" name="namujiAddress" value="${orderMap.namujiAddress }" disabled>
                                </div>
                            </div>
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