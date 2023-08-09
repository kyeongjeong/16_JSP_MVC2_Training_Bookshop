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
    
	    function orderBook(bookCd) {
			
	    	if ("${sessionScope.memberId == null}" == "true") {
				alert("로그인을 먼저 진행해주세요.");
				location.href = "login";
			}
			else {
				location.href = "orderBook?bookCd=${bookDTO.bookCd }&orderBookQty=" + $("[name='orderBookQty']").val();
			}
			
		}
	    
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
                    <div class="header__right">
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
                        <span>Book Detail</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Product Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__left product__thumb nice-scroll">
                            <a class="pt active" href="#product-1">
                                <img src="bootstrap/img/book/${bookDTO.imgNm }" alt="">
                            </a>
                            <a class="pt" href="#product-2">
                                <img src="bootstrap/img/book/${bookDTO.imgNm }" alt="">
                            </a>
                            <a class="pt" href="#product-3">
                                <img src="bootstrap/img/book/${bookDTO.imgNm }" alt="">
                            </a>
                            <a class="pt" href="#product-4">
                                <img src="bootstrap/img/book/${bookDTO.imgNm }" alt="">
                            </a>
                        </div>
                        <div class="product__details__slider__content">
                            <div class="product__details__pic__slider owl-carousel">
                                <img data-hash="product-1" class="product__big__img" src="bootstrap/img/book/${bookDTO.imgNm }" alt="">
                                <img data-hash="product-2" class="product__big__img" src="bootstrap/img/book/${bookDTO.imgNm }" alt="">
                                <img data-hash="product-3" class="product__big__img" src="bootstrap/img/book/${bookDTO.imgNm }" alt="">
                                <img data-hash="product-4" class="product__big__img" src="bootstrap/img/book/${bookDTO.imgNm }" alt="">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="product__details__text">
                        <h3>${bookDTO.bookNm } <span>출판사 : ${bookDTO.publisher } | 저자 : ${bookDTO.writer }</span></h3>
                        <div class="product__details__price"><fmt:formatNumber value="${bookDTO.price - (bookDTO.price * bookDTO.discountRt / 100)}"/>원 <span><fmt:formatNumber value="${bookDTO.price }"/>원</span></div>
                        <div class="product__details__button">
                            <div class="quantity">
                                <span>Quantity:</span>
                                <div class="pro-qty">
                                    <input type="text" name="orderBookQty" value="1">
                                </div>
                            </div>
                            <a href="javascript:orderBook();" class="cart-btn"><span class="icon_bag_alt"></span> 주문하기</a>
                        </div>
                        <div class="product__details__widget">
                            <ul>
                                <li>
                                    <span>출판일:</span>
                                    <p><fmt:formatDate value="${bookDTO.publishedDt }" pattern="yyyy-MM-dd"/> </p>
                                </li>
                                <li>
                                    <span>등록일:</span>
                                    <p><fmt:formatDate value="${bookDTO.enrollDt }" pattern="yyyy-MM-dd"/></p>
                                </li>
                                <li>
                                    <span>포인트:</span>
                                    <p>${bookDTO.point }P</p>
                                </li>
                                <li>
                                    <span>할인률:</span>
                                    <p>${bookDTO.discountRt }%</p>
                                </li>
                                <li>
                                    <span>배송비:</span>
                                    <p>${bookDTO.deliveryPrice }원</p>
                                </li>
                                <li>
                                    <span>총 페이지수:</span>
                                    <p>${bookDTO.totalPage } 페이지</p>
                                </li>
                                <li>
                                    <span>재고:</span>
                                    <p>${bookDTO.stock } 개</p>
                                </li>
                                <li>
                                    <span>ISBN:</span>
                                    <p>${bookDTO.isbn }</p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="product__details__tab">
						<ul class="nav nav-tabs" role="tablist">
                           <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">상품소개</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab">상품목차</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab">저자소개</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-4" role="tab">출판사 상품평가</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-5" role="tab">추천사</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                        	<div class="tab-pane active" id="tabs-1" role="tabpanel">
                                ${bookDTO.intro}
                            </div>
                            <div class="tab-pane" id="tabs-2" role="tabpanel">
                            	${bookDTO.contentsOrder }
                            </div>
                            <div class="tab-pane" id="tabs-3" role="tabpanel">
                            	${bookDTO.writerIntro }
                            </div>
                            <div class="tab-pane" id="tabs-4" role="tabpanel">
                            	${bookDTO.publisherComment }
                            </div>
                            <div class="tab-pane" id="tabs-5" role="tabpanel">
                            	${bookDTO.recommendation }
                            </div> 
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="related__title">
                        <h5><span style="color:red;">'${bookDTO.sort }'</span> RELATED PRODUCTS</h5>
                    </div>
                </div>
                <c:forEach var="bookDTO" items="${relatedBookList }">
	                <div class="col-lg-3 col-md-4 col-sm-6">
	                    <div class="product__item">
	                        <div class="product__item__pic set-bg" data-setbg="bootstrap/img/book/${bookDTO.imgNm }">
	                            <c:choose>
                                   	<c:when test="${bookDTO.sort eq 'new' }"> <div class="label new">New</div></c:when>
                                   	<c:when test="${bookDTO.sort eq 'best' }">  <div class="label sale">Best</div></c:when>
                                   	<c:when test="${bookDTO.sort eq 'steady' }"> <div class="label stockout stockblue">Steady</div></c:when>
                                </c:choose>
	                            <ul class="product__hover">
	                                <li><a href="bootstrap/img/book/${bookDTO.imgNm }" class="image-popup"><span class="arrow_expand"></span></a></li>
	                                <li><a href="orderBook?bookCd=${bookDTO.bookCd }&orderBookQty=1"><span class="icon_bag_alt"></span></a></li>
	                            </ul>
	                        </div>
	                        <div class="product__item__text">
	                            <h6><a href="bookDetail?bookCd=${bookDTO.bookCd }">${bookDTO.bookNm }</a></h6>
	                            <div class="product__price"><fmt:formatNumber value="${bookDTO.price }"/>원</div>
	                        </div>
	                    </div>
	                </div>
                </c:forEach>
            </div>
        </div>
    </section>
    <!-- Product Details Section End -->

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