<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
   <head>
      <!-- basic -->
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <!-- mobile metas -->
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <!-- site metas -->
      <title>Eflyer</title>
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">
      <!-- bootstrap css -->
      <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css1/bootstrap.min.css'></c:url>">
      <!-- style css -->
      <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css1/style.css'></c:url>">
      <!-- Responsive-->
      <link rel="stylesheet" href="<c:url value='/resources/css1/responsive.css'></c:url>">
      <!-- fevicon -->
      <link rel="icon" href="<c:url value='/resources/images1/fevicon.png'></c:url>" type="image/gif" /> 
      <!-- Scrollbar Custom CSS -->
      <link rel="stylesheet" href="<c:url value='/resources/css1/jquery.mCustomScrollbar.min.css'></c:url>">
      <!-- Tweaks for older IEs-->
      <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
      <!-- fonts -->
      <link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
      <!-- font awesome -->
      <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
      <!--  -->
      <!-- owl stylesheets -->
      <link href="https://fonts.googleapis.com/css?family=Great+Vibes|Poppins:400,700&display=swap&subset=latin-ext" rel="stylesheet">
      <link rel="stylesheet" href="<c:url value='/resources/css1/owl.carousel.min.css'></c:url>">
      <link rel="stylesoeet" href="<c:url value='/resources/css1/owl.theme.default.min.css'></c:url>">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
   </head>
   <body>
      <!-- banner bg main start -->
      <div class="banner_bg_main">
         <!-- header top section start -->
         <div class="container">
            <div class="header_section_top">
               <div class="row">
                  <div class="col-sm-12">
                     <div class="custom_menu">
                        <ul>
                           
                        </ul>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <!-- header top section start -->
         <!-- logo section start -->
         <div class="logo_section">
            <div class="container">
               <div class="row">
                  <div class="col-sm-12">
                     
                  </div>
               </div>
            </div>
         </div>
         <!-- logo section end -->
         <!-- header section start -->
         <div class="header_section">
            <div class="container">
               
            </div>
         </div>
         <!-- header section end -->
         <!-- banner section start -->
         <div class="banner_section layout_padding">
            <div class="container">
               <div id="my_slider" class="carousel slide" data-ride="carousel">
                  <div class="carousel-inner">
                     <div class="carousel-item active">
                        <div class="row">
                           <div class="col-sm-12">
                              <h1 class="banner_taital">Get Start <br>Your favorite fashion</h1>
                              <div class="buynow_bt"><a href="<c:url value='/login'></c:url>">Buy Now</a></div>
                           </div>
                        </div>
                     </div>
                     <div class="carousel-item">
                        <div class="row">
                           <div class="col-sm-12">
                              <h1 class="banner_taital">Get Start <br>Your favorite electronic</h1>
                              <div class="buynow_bt"><a href="<c:url value='/login'></c:url>">Buy Now</a></div>
                           </div>
                        </div>
                     </div>
                     <div class="carousel-item">
                        <div class="row">
                           <div class="col-sm-12">
                              <h1 class="banner_taital">Get Start <br>Your favorite product</h1>
                              <div class="buynow_bt"><a href="<c:url value='/login'></c:url>">Buy Now</a></div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <a class="carousel-control-prev" href="#my_slider" role="button" data-slide="prev">
                  <i class="fa fa-angle-left"></i>
                  </a>
                  <a class="carousel-control-next" href="#my_slider" role="button" data-slide="next">
                  <i class="fa fa-angle-right"></i>
                  </a>
               </div>
            </div>
         </div>
         <!-- banner section end -->
      </div>
      <!-- banner bg main end -->
      <!-- fashion section start -->
      <div class="fashion_section">
         <div id="main_slider" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
            <c:if test="${clothList.size() >= 3}">
               <div class="carousel-item active">
                  <div class="container">
                     <h1 class="fashion_taital">브랜드 패션</h1>
                     <div class="fashion_section_2">
                        <div class="row">
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">${clothList.get(0).getPr_name()}</h4>
                                 <p class="price_text">입찰 시작가  <span style="color: #262626;">₩ ${clothList.get(0).getPr_start_price()}</span></p>
                                 <div class="tshirt_img"><img src="<c:url value='/download${clothFiles_0.get(0).fi_save_name}'></c:url>" style="height: 310px;"></div> 
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="<c:url value='/login'></c:url>">Buy Now</a></div>
                                    <div class="seemore_bt"><a href="<c:url value='/login'></c:url>">See More</a></div>
                                 </div>
                              </div>
                           </div>
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">${clothList.get(1).getPr_name()}</h4>
                                 <p class="price_text">입찰 시작가  <span style="color: #262626;">₩ ${clothList.get(1).getPr_start_price()}</span></p>
                                 <div class="tshirt_img"><img src="<c:url value='/download${clothFiles_1.get(0).fi_save_name}'></c:url>" style="height: 310px;"></div>
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="<c:url value='/login'></c:url>">Buy Now</a></div>
                                    <div class="seemore_bt"><a href="<c:url value='/login'></c:url>">See More</a></div>
                                 </div>
                              </div>
                           </div>
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">${clothList.get(2).getPr_name()}</h4>
                                 <p class="price_text">입찰 시작가  <span style="color: #262626;">₩ ${clothList.get(2).getPr_start_price()}</span></p>
                                 <div class="tshirt_img"><img src="<c:url value='/download${clothFiles_2.get(0).fi_save_name}'></c:url>" style="height: 310px;"></div> 
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="<c:url value='/login'></c:url>">Buy Now</a></div>
                                    <div class="seemore_bt"><a href="<c:url value='/login'></c:url>">See More</a></div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               </c:if>
               <c:if test="${clothList.size() >= 6}">
               <div class="carousel-item">
                  <div class="container">
                     <h1 class="fashion_taital">브랜드 패션</h1>
                     <div class="fashion_section_2">
                        <div class="row">
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">${clothList.get(3).getPr_name()}</h4>
                                 <p class="price_text">입찰 시작가  <span style="color: #262626;">₩ ${clothList.get(3).getPr_start_price()}</span></p>
                                 <div class="tshirt_img"><img src="<c:url value='/download${clothFiles_3.get(0).fi_save_name}'></c:url>" style="height: 310px;"></div> 
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="<c:url value='/login'></c:url>">Buy Now</a></div>
                                    <div class="seemore_bt"><a href="<c:url value='/login'></c:url>">See More</a></div>
                                 </div>
                              </div>
                           </div>
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">${clothList.get(4).getPr_name()}</h4>
                                 <p class="price_text">입찰 시작가  <span style="color: #262626;">₩ ${clothList.get(4).getPr_start_price()}</span></p>
                                 <div class="tshirt_img"><img src="<c:url value='/download${clothFiles_4.get(0).fi_save_name}'></c:url>" style="height: 310px;"></div> 
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="<c:url value='/login'></c:url>">Buy Now</a></div>
                                    <div class="seemore_bt"><a href="<c:url value='/login'></c:url>">See More</a></div>
                                 </div>
                              </div>
                           </div>
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">${clothList.get(5).getPr_name()}</h4>
                                 <p class="price_text">입찰 시작가  <span style="color: #262626;">₩ ${clothList.get(5).getPr_start_price()}</span></p>
                                 <div class="tshirt_img"><img src="<c:url value='/download${clothFiles_5.get(0).fi_save_name}'></c:url>" style="height: 310px;"></div>
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="<c:url value='/login'></c:url>">Buy Now</a></div>
                                    <div class="seemore_bt"><a href="<c:url value='/login'></c:url>">See More</a></div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               </c:if>
               <c:if test="${clothList.size() >= 9}">
               <div class="carousel-item">
                  <div class="container">
                     <h1 class="fashion_taital">브랜드 패션</h1>
                     <div class="fashion_section_2">
                        <div class="row">
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">${clothList.get(6).getPr_name()}</h4>
                                 <p class="price_text">입찰 시작가  <span style="color: #262626;">₩ ${clothList.get(6).getPr_start_price()}</span></p>
                                 <div class="tshirt_img"><img src="<c:url value='/download${clothFiles_6.get(0).fi_save_name}'></c:url>" style="height: 310px;"></div>
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="<c:url value='/login'></c:url>">Buy Now</a></div>
                                    <div class="seemore_bt"><a href="<c:url value='/login'></c:url>">See More</a></div>
                                 </div>
                              </div>
                           </div>
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">${clothList.get(7).getPr_name()}</h4>
                                 <p class="price_text">입찰 시작가  <span style="color: #262626;">₩ ${clothList.get(7).getPr_start_price()}</span></p>
                                 <div class="tshirt_img"><img src="<c:url value='/download${clothFiles_7.get(0).fi_save_name}'></c:url>" style="height: 310px;"></div>
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="<c:url value='/login'></c:url>">Buy Now</a></div>
                                    <div class="seemore_bt"><a href="<c:url value='/login'></c:url>">See More</a></div>
                                 </div>
                              </div>
                           </div>
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">${clothList.get(8).getPr_name()}</h4>
                                 <p class="price_text">입찰 시작가  <span style="color: #262626;">₩ ${clothList.get(8).getPr_start_price()}</span></p>
                                 <div class="tshirt_img"><img src="<c:url value='/download${clothFiles_8.get(0).fi_save_name}'></c:url>" style="height: 310px;"></div>
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="<c:url value='/login'></c:url>">Buy Now</a></div>
                                    <div class="seemore_bt"><a href="<c:url value='/login'></c:url>">See More</a></div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               </c:if>   
            </div>
            <a class="carousel-control-prev" href="#main_slider" role="button" data-slide="prev">
            <i class="fa fa-angle-left"></i>
            </a>
            <a class="carousel-control-next" href="#main_slider" role="button" data-slide="next">
            <i class="fa fa-angle-right"></i>
            </a>
         </div>
      </div>
      <!-- fashion section end -->
      <!-- electronic section start -->
      <div class="fashion_section">
         <div id="electronic_main_slider" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
               <c:if test="${digitalList.size() >= 3}">
               <div class="carousel-item active">
                  <div class="container">
                     <h1 class="fashion_taital">디지털</h1>
                     <div class="fashion_section_2">
                        <div class="row">
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">${digitalList.get(0).getPr_name()}</h4>
                                 <p class="price_text">입찰 시작가  <span style="color: #262626;">₩ ${digitalList.get(0).getPr_start_price()}</span></p>
                                 <div class="electronic_img"><img src="<c:url value='/download${digitalFiles_0.get(0).fi_save_name}'></c:url>"></div> 
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="<c:url value='/login'></c:url>">Buy Now</a></div>
                                    <div class="seemore_bt"><a href="<c:url value='/login'></c:url>">See More</a></div>
                                 </div>
                              </div>
                           </div>
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">${digitalList.get(1).getPr_name()}</h4>
                                 <p class="price_text">입찰 시작가  <span style="color: #262626;">₩ ${digitalList.get(1).getPr_start_price()}</span></p>
                                 <div class="electronic_img"><img src="<c:url value='/download${digitalFiles_1.get(0).fi_save_name}'></c:url>"></div> 
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="<c:url value='/login'></c:url>">Buy Now</a></div>
                                    <div class="seemore_bt"><a href="<c:url value='/login'></c:url>">See More</a></div>
                                 </div>
                              </div>
                           </div>
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">${digitalList.get(2).getPr_name()}</h4>
                                 <p class="price_text">입찰 시작가  <span style="color: #262626;">₩ ${digitalList.get(2).getPr_start_price()}</span></p>
                                 <div class="electronic_img"><img src="<c:url value='/download${digitalFiles_2.get(0).fi_save_name}'></c:url>"></div> 
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="<c:url value='/login'></c:url>">Buy Now</a></div>
                                    <div class="seemore_bt"><a href="<c:url value='/login'></c:url>">See More</a></div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               </c:if>
               <c:if test="${digitalList.size() >= 6}">
               <div class="carousel-item">
                  <div class="container">
                     <h1 class="fashion_taital">디지털</h1>
                     <div class="fashion_section_2">
                        <div class="row">
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">${digitalList.get(3).getPr_name()}</h4>
                                 <p class="price_text">입찰 시작가  <span style="color: #262626;">₩ ${digitalList.get(3).getPr_start_price()}</span></p>
                                 <div class="electronic_img"><img src="<c:url value='/download${digitalFiles_3.get(0).fi_save_name}'></c:url>"></div>
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="<c:url value='/login'></c:url>">Buy Now</a></div>
                                    <div class="seemore_bt"><a href="<c:url value='/login'></c:url>">See More</a></div>
                                 </div>
                              </div>
                           </div>
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">${digitalList.get(4).getPr_name()}</h4>
                                 <p class="price_text">입찰 시작가  <span style="color: #262626;">₩ ${digitalList.get(4).getPr_start_price()}</span></p>
                                 <div class="electronic_img"><img src="<c:url value='/download${digitalFiles_4.get(0).fi_save_name}'></c:url>"></div>
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="<c:url value='/login'></c:url>">Buy Now</a></div>
                                    <div class="seemore_bt"><a href="<c:url value='/login'></c:url>">See More</a></div>
                                 </div>
                              </div>
                           </div>
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">${digitalList.get(5).getPr_name()}</h4>
                                 <p class="price_text">입찰 시작가  <span style="color: #262626;">₩ ${digitalList.get(5).getPr_start_price()}</span></p>
                                 <div class="electronic_img"><img src="<c:url value='/download${digitalFiles_5.get(0).fi_save_name}'></c:url>"></div>
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="<c:url value='/login'></c:url>">Buy Now</a></div>
                                    <div class="seemore_bt"><a href="<c:url value='/login'></c:url>">See More</a></div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               </c:if>
               <c:if test="${digitalList.size() >= 9}">
               <div class="carousel-item">
                  <div class="container">
                     <h1 class="fashion_taital">디지털</h1>
                     <div class="fashion_section_2">
                        <div class="row">
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">${digitalList.get(6).getPr_name()}</h4>
                                 <p class="price_text">입찰 시작가  <span style="color: #262626;">₩ ${digitalList.get(6).getPr_start_price()}</span></p>
                                 <div class="electronic_img"><img src="<c:url value='/download${digitalFiles_6.get(0).fi_save_name}'></c:url>"></div>
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="<c:url value='/login'></c:url>">Buy Now</a></div>
                                    <div class="seemore_bt"><a href="<c:url value='/login'></c:url>">See More</a></div>
                                 </div>
                              </div>
                           </div>
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">${digitalList.get(7).getPr_name()}</h4>
                                 <p class="price_text">입찰 시작가  <span style="color: #262626;">₩ ${digitalList.get(7).getPr_start_price()}</span></p>
                                 <div class="electronic_img"><img src="<c:url value='/download${digitalFiles_7.get(0).fi_save_name}'></c:url>"></div>
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="<c:url value='/login'></c:url>">Buy Now</a></div>
                                    <div class="seemore_bt"><a href="<c:url value='/login'></c:url>">See More</a></div>
                                 </div>
                              </div>
                           </div>
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">${digitalList.get(8).getPr_name()}</h4>
                                 <p class="price_text">입찰 시작가  <span style="color: #262626;">₩ ${digitalList.get(8).getPr_start_price()}</span></p>
                                 <div class="electronic_img"><img src="<c:url value='/download${digitalFiles_8.get(0).fi_save_name}'></c:url>"></div>
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="<c:url value='/login'></c:url>">Buy Now</a></div>
                                    <div class="seemore_bt"><a href="<c:url value='/login'></c:url>">See More</a></div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               </c:if>
            </div>
            <a class="carousel-control-prev" href="#electronic_main_slider" role="button" data-slide="prev">
            <i class="fa fa-angle-left"></i>
            </a>
            <a class="carousel-control-next" href="#electronic_main_slider" role="button" data-slide="next">
            <i class="fa fa-angle-right"></i>
            </a>
         </div>
      </div>
      <!-- electronic section end -->
      <!-- jewellery  section start -->
      <div class="jewellery_section">
         <div id="jewellery_main_slider" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
               <c:if test="${foodList.size() >= 3}">
               <div class="carousel-item active">
                  <div class="container">
                     <h1 class="fashion_taital">식품</h1>
                     <div class="fashion_section_2">
                        <div class="row">
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">${foodList.get(0).getPr_name()}</h4>
                                 <p class="price_text">입찰 시작가  <span style="color: #262626;">₩ ${foodList.get(0).getPr_start_price()}</span></p>
                                 <div class="jewellery_img"><img src="<c:url value='/download${foodFiles_0.get(0).fi_save_name}'></c:url>"></div> 
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="<c:url value='/login'></c:url>">Buy Now</a></div>
                                    <div class="seemore_bt"><a href="<c:url value='/login'></c:url>">See More</a></div>
                                 </div>
                              </div>
                           </div>
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">${foodList.get(1).getPr_name()}</h4>
                                 <p class="price_text">입찰 시작가  <span style="color: #262626;">₩ ${foodList.get(1).getPr_start_price()}</span></p>
                                 <div class="jewellery_img"><img src="<c:url value='/download${foodFiles_1.get(0).fi_save_name}'></c:url>"></div> 
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="<c:url value='/login'></c:url>">Buy Now</a></div>
                                    <div class="seemore_bt"><a href="<c:url value='/login'></c:url>">See More</a></div>
                                 </div>
                              </div>
                           </div>
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">${foodList.get(2).getPr_name()}</h4>
                                 <p class="price_text">입찰 시작가  <span style="color: #262626;">₩ ${foodList.get(2).getPr_start_price()}</span></p>
                                 <div class="jewellery_img"><img src="<c:url value='/download${foodFiles_2.get(0).fi_save_name}'></c:url>"></div> 
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="<c:url value='/login'></c:url>">Buy Now</a></div>
                                    <div class="seemore_bt"><a href="<c:url value='/login'></c:url>">See More</a></div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               </c:if>
               <c:if test="${foodList.size() >= 6}">
               <div class="carousel-item">
                  <div class="container">
                     <h1 class="fashion_taital">식품</h1>
                     <div class="fashion_section_2">
                        <div class="row">
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">${foodList.get(3).getPr_name()}</h4>
                                 <p class="price_text">입찰 시작가  <span style="color: #262626;">₩ ${foodList.get(3).getPr_start_price()}</span></p>
                                 <div class="jewellery_img"><img src="<c:url value='/download${foodFiles_3.get(0).fi_save_name}'></c:url>"></div>
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="<c:url value='/login'></c:url>">Buy Now</a></div>
                                    <div class="seemore_bt"><a href="<c:url value='/login'></c:url>">See More</a></div>
                                 </div>
                              </div>
                           </div>
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">${foodList.get(4).getPr_name()}</h4>
                                 <p class="price_text">입찰 시작가  <span style="color: #262626;">₩ ${foodList.get(4).getPr_start_price()}</span></p>
                                 <div class="jewellery_img"><img src="<c:url value='/download${foodFiles_4.get(0).fi_save_name}'></c:url>"></div>
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="<c:url value='/login'></c:url>">Buy Now</a></div>
                                    <div class="seemore_bt"><a href="<c:url value='/login'></c:url>">See More</a></div>
                                 </div>
                              </div>
                           </div>
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">${foodList.get(5).getPr_name()}</h4>
                                 <p class="price_text">입찰 시작가  <span style="color: #262626;">₩ ${foodList.get(5).getPr_start_price()}</span></p>
                                 <div class="jewellery_img"><img src="<c:url value='/download${foodFiles_5.get(0).fi_save_name}'></c:url>"></div>
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="<c:url value='/login'></c:url>">Buy Now</a></div>
                                    <div class="seemore_bt"><a href="<c:url value='/login'></c:url>">See More</a></div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               </c:if>
               <c:if test="${foodList.size() >= 9}">
               <div class="carousel-item">
                  <div class="container">
                     <h1 class="fashion_taital">식품</h1>
                     <div class="fashion_section_2">
                        <div class="row">
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">${foodList.get(6).getPr_name()}</h4>
                                 <p class="price_text">Start Price  <span style="color: #262626;">₩ ${foodList.get(6).getPr_start_price()}</span></p>
                                 <div class="jewellery_img"><img src="<c:url value='/download${foodFiles_6.get(0).fi_save_name}'></c:url>"></div>
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="<c:url value='/login'></c:url>">Buy Now</a></div>
                                    <div class="seemore_bt"><a href="<c:url value='/login'></c:url>">See More</a></div>
                                 </div>
                              </div>
                           </div>
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">${foodList.get(7).getPr_name()}</h4>
                                 <p class="price_text">Start Price  <span style="color: #262626;">₩ ${foodList.get(7).getPr_start_price()}</span></p>
                                 <div class="jewellery_img"><img src="<c:url value='/download${foodFiles_7.get(0).fi_save_name}'></c:url>"></div>
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="<c:url value='/login'></c:url>">Buy Now</a></div>
                                    <div class="seemore_bt"><a href="<c:url value='/login'></c:url>">See More</a></div>
                                 </div>
                              </div>
                           </div>
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">${foodList.get(8).getPr_name()}</h4>
                                 <p class="price_text">Start Price  <span style="color: #262626;">₩ ${foodList.get(8).getPr_start_price()}</span></p>
                                 <div class="jewellery_img"><img src="<c:url value='/download${foodFiles_8.get(0).fi_save_name}'></c:url>"></div>
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="<c:url value='/login'></c:url>">Buy Now</a></div>
                                    <div class="seemore_bt"><a href="<c:url value='/login'></c:url>">See More</a></div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               </c:if>
            </div>
            <a class="carousel-control-prev" href="#jewellery_main_slider" role="button" data-slide="prev">
            <i class="fa fa-angle-left"></i>
            </a>
            <a class="carousel-control-next" href="#jewellery_main_slider" role="button" data-slide="next">
            <i class="fa fa-angle-right"></i>
            </a>
            <div class="loader_main">
               <div class="loader"></div>
            </div>
         </div>
      </div>
      <!-- copyright section end -->
      <!-- Javascript files-->
      <!--  <script src="<c:url value='/resources/js1/jquery.min.js'></c:url>"></script> -->
      <!--<script src="<c:url value='/resources/js1/popper.min.js'></c:url>"></script>-->
      <!--<script src="<c:url value='/resources/js1/bootstrap.bundle.min.js'></c:url>"></script>-->
      <!-- <script src="<c:url value='/resources/js1/jquery-3.0.0.min.js'></c:url>"></script>-->
      <!--  <script src="<c:url value='/resources/js1/plugin.js'></c:url>"></script>-->
     
      
      <!-- sidebar -->
      <!-- <script src="<c:url value='/resources/js1/jquery.mCustomScrollbar.concat.min.js'></c:url>"></script>-->
      <!--  <script src="<c:url value='/resources/js1/custom.js'></c:url>"></script>-->
      
      <script>
         function openNav() {
           document.getElementById("mySidenav").style.width = "250px";
         }
         
         function closeNav() {
           document.getElementById("mySidenav").style.width = "0";
         }
      </script>
   </body>
</html>
