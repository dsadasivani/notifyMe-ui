<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html">

<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

     <!-- <link type="text/css" rel="stylesheet" href="./css/bootstrap-3.3.7.min.css"> -->
	<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.min.css" /> -->
<%-- <script type="text/javascript" src="./js/bootstrap-3.3.7.min.js"></script>
<script type="text/javascript" src="./js/jquery-3.2.1.min.js"></script> --%>
<!-- <link rel="stylesheet" href="./css/font-awesome-4.7.0.css"> -->
	<!-- NotifyMe CSS -->
	<!-- <link type="text/css" rel="stylesheet" href="./css/notifyMeStyle.css"></link>
	<link type="text/css" rel="stylesheet" href="./css/style.css"> -->
	<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> -->
	
<style>

.sticky {
  position: fixed;
  top: 0;
  width: 100%;
  z-index: 100;
}
.stickynvbar{
position: fixed;
  top: 0;
  width: 100%;
  z-index: 100;
}
.navbarshadow{
box-shadow: 0 5px 30px rgba(0, 0, 0, 0.15) !important;	
}
</style>
</head>

<body style="background-color:#607d8b26;">
<jsp:include page="./NavBar.jsp" />

<div class="row mainPageDiv">

<div class="mainTabsXS" style="display:none;">
<div class="col-xs-3 mainTabsDivXS active" id="headlinesNewsXS" onclick="displayCurrentTab('headlinesNews','headlinesNewsXS')">Prime News</div>
<div class="col-xs-3 mainTabsDivXS" id="sectorNewsXS" onclick="displayCurrentTab('sectorNews','sectorNewsXS')">SectorNews</div>
<div class="col-xs-3 mainTabsDivXS" id="mostRecommendedXS" onclick="displayCurrentTab('mostRecommended','mostRecommendedXS')">Recommended</div>
</div>

<!-- <div id="marketLeadsDiv" class="col-md-12" style="border-bottom: 5px solid;border-bottom-color: #0c518c;padding-top:2rem;" >
	</div> -->
<!-- left column -->
<div class="row headlinesMainRow">
<div id="headlinesNews" class="col-lg-11 mobileTabs" style="margin-left: 6.5%;">
</div>
	
	
</div>
<div class="row globalBackground" >
	<div id="sectorNews" class="col-xs-offset-1 col-lg-7 sectorNewzXS hideDivXS mobileTabs" style="width: 54%;">
		<!--<jsp:include page="./sectorNews_newapproach.jsp" />-->
	</div>
	
	<div id="mostRecommended" class="col-lg-3 mostRecommendedXS mostRecommendedLG hideDivXS mobileTabs" >
	</div>

</div>
<!--centre column-->

<!--right side  column-->
 
</div>
<!-- Footer -->
<footer class="" style="background-color: #333;">

    <div style="border-bottom:1px solid; border-bottom-color:#fff;">
      <div class="container fontWhite">

        <!-- Grid row-->
        
        <!-- Grid row-->

      </div>
    </div>

    <!-- Footer Links -->
    <div class="text-center text-md-left mt-5">

      <!-- Grid row -->
      <div class="row mt-3" style="padding-left:10%;">

        <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-4" style="color:#fff;text-align: left;padding-top: 2%;">
			<div class="row" style="border-right: 1px solid;border-right-color: green;border-right-width: thick;font-size: small;padding-left: 15%;">
			
			<a href="" style="color: #fff;">About Us</a>&nbsp;  |  &nbsp;<a href="" style="color: #fff;">Contact</a> &nbsp; |&nbsp; <a href="" style="color: #fff;">Advertise with us</a>
			</div>
        

        </div>
        <div class="col-md-4 col-lg-8">

          <!-- Grid column -->
          <div class="col-md-6 col-lg-12 text-center text-md-left mb-4 mb-md-0" style="padding-top: 1%;color: #fff;text-align: left;padding-bottom: 1%;">
            	<div class="col-lg-5"><span class=""><b>Follow us on</b></span>
          
                <a href=""><i id="social-fb" class="fa fa-facebook" style="color: #fff;margin-left: 1%;"></i></a>
	            <a href=""><i id="social-tw" class="fa fa-twitter" style="color: #fff;margin-left: 1%;"></i></a>
	            <!-- <a href=""><i id="social-gp" class="fa fa-google-plus" style="color: #fff;margin-left: 1%;"></i></a> -->
	           <!--  <a href=""><i id="social-gp" class="fa fa-linkedin" style="color: #fff;margin-left: 1%;"></i></a> -->
   		 </div>
   		 <div class="col-lg-6" style="border-left: 1px solid;margin-top: 2%;border-left-color: green;border-left-width: thick;margin-left: 1%;">
   		 <span style="height: 15px;font-size: 9px;text-align: left;color: #fff;padding-left: 10%;font-size:small;">Copyright © 2018 NotifyMe. All rights reserved.</span>
   		 </div>
   		 	
      
   		 </div>
    

        </div>
        
        
       

      </div>
      
      <!-- Grid row -->

    </div>




  </footer>
  <!-- Footer -->



<!--Footer ends-->
<script >


var $ = jQuery.noConflict();

function displayCurrentTab(id,mtdiv){
	$(".mainTabsDivXS").removeClass("active");
	$('#'+mtdiv).addClass("active");
	$('.mobileTabs').addClass("hideDivXS");
	$('#'+id).removeClass("hideDivXS");
	
}

$(document).ready(function() {
	$('#exampleModal').modal('toggle');
	
	function marketLeads(){
		 $.ajax({
				type : "GET",
				url : "refreshMarketDataAction",
				success : function(data) {
					var html = "" + data.msg;
					//alert(data);
					//$("#info").html(html);
					$("#marketLeadsDiv").html(data);
				},
				error : function(data) {
					//alert("Some error occured.");
				}
			});
	}
	 
	  function getInternationalNews(){
		  $.ajax({
				type : "GET",
				url : "intrntlnewsLoad",
				success : function(data) {
					var html = "" + data.msg;
					//alert(data);
					//$("#info").html(html);
					$("#internationalNews").html(data);
				},
				error : function(data) {
					//alert("Some error occured.");
				}
			});
	  }
	  
	  function getHeadlinesNews(){
		  $.ajax({
				type : "GET",
				url : "primeNewsLoad",
				success : function(data) {
					var html = "" + data.msg;
					//alert(data);
					//$("#info").html(html);
					$("#headlinesNews").html(data);
				},
				error : function(data) {
					//alert("Some error occured.");
				}
			});
	  }
	  
	  function getStockNews(){
		  $.ajax({
				type : "GET",
				url : "sectorNewsLoad",
				success : function(data) {
					var html = "" + data.msg;
					//alert(data);
					//$("#info").html(html);
					$("#sectorNews").html(data);
				},
				error : function(data) {
					//alert("Some error occured.");
				}
			});
	  }
	  
	  function getFeeds(){
		  $.ajax({
				type : "GET",
				url : "commoditiesFeeds",
				success : function(data) {
					var html = "" + data.msg;
					//alert(data);
					//$("#info").html(html);
					$("#commodityFeedsDiv").html(data);
				},
				error : function(data) {
					//alert("Some error occured.");
				}
			});
	  }
	  
	  function getCurrencyFeeds(){
		  $.ajax({
				type : "GET",
				url : "currencyFeeds",
				success : function(data) {
					var html = "" + data.msg;
					//alert(data);
					//$("#info").html(html);
					$("#currencyFeedsDiv").html(data);
				},
				error : function(data) {
					//alert("Some error occured.");
				}
			});
	  }
	  
	  function getWorldNewsFeeds(){
		  $.ajax({
				type : "GET",
				url : "worldNewsFeeds",
				success : function(data) {
					var html = "" + data.msg;
					//alert(data);
					//$("#info").html(html);
					$("#worldNewsFeedsDiv").html(data);
				},
				error : function(data) {
					//alert("Some error occured.");
				}
			});
	  }
	  
	  function getMostRecommended(){
		  $.ajax({
				type : "GET",
				url : "mostRecommended",
				success : function(data) {
					var html = "" + data.msg;
					//alert(data);
					//$("#info").html(html);
					$("#mostRecommended").html(data);
				},
				error : function(data) {
					//alert("Some error occured.");
				}
			});
	  }
	  marketLeads();
	  getInternationalNews();
	  getHeadlinesNews();
	  getFeeds();
	  getCurrencyFeeds();
	  getWorldNewsFeeds();
	  getStockNews();
	  getMostRecommended();
   //below  ajax call is to get the indices
   setInterval(function()
{ 
    $.ajax({
			type : "GET",
			url : "refreshMarketDataAction",
			success : function(data) {
				var html = "" + data.msg;
				//alert(data);
				//$("#info").html(html);
				$("#marketLeadsDiv").html(data);
			},
			error : function(data) {
				//alert("Some error occured.");
			}
		});
    //for one sec its 1000
}, 1000000000);
   
   
   
   var didScroll;
	var lastScrollTop = 0;
	var delta = 20;
	var navbarHeight = $('.appHeader').outerHeight();

	$(window).scroll(function(event){
	    didScroll = true;
	});

	setInterval(function() {
	    if (didScroll) {
	        hasScrolled();
	        didScroll = false;
	    }
	}, 250);

	function hasScrolled() {
	    var st = $(this).scrollTop();
	    
	    // Make sure they scroll more than delta
	    if(Math.abs(lastScrollTop - st) <= delta)
	        return;
	    
	    // If they scrolled down and are past the navbar, add class .nav-up.
	    // This is necessary so you never see what is "behind" the navbar.
	    if (st > lastScrollTop && st > navbarHeight){
	        // Scroll Down
	        $('.appHeader').removeClass('appHeaderOnScrollStyle');
	    } else {
	        // Scroll Up
	        if(st + $(window).height() < $(document).height()) {
	            $('.appHeader').addClass('appHeaderOnScrollStyle');
	        }
	    }
	    
	    lastScrollTop = st;
	}
	
	
	
	
	
    
    
    $("#toggle-btn").click(function() {
        $(".sf-menu").slideToggle("slow"); 
    });

    $('.toggle-subarrow').click(
        function() {
            $(this).parent().toggleClass("mob-drop");
    });
		
		var header = $(".header-inner");
    $(window).scroll(function() {
        var scroll = $(window).scrollTop();
        if (scroll >= 100 && $(this).width() > 769) {
            header.addClass("navbar-fixed-top");
			header.addClass("navbarshadow");
        } else {
            header.removeClass('navbar-fixed-top');
			header.removeClass("navbarshadow");
        }
    });	  
	  $(this).find(".h4 i").each(function(){
            $(this).addClass("green");
    }); 
	  
	  
	  
});  
 
 




$(document).ready(function () {
	
	
	    

    $('#closeArrow').on('click', function () {
        $('#sidebar').toggleClass('active');
        $('#closeArrow').hide();
        $('#openArrow').show();
    });
    $('#openArrow').on('click', function () {
        $('#sidebar').toggleClass('active');
        $('#closeArrow').show();
        $('#openArrow').hide();
    });
  
});
	$(document).ready(function(){
		var finalData = "";
		 var ajaxJson = {
			 		'url':	 "HomeController",
			 		'type': "GET",
			 		'dataType': null,
			 		'success':function(){
			 			$('#form2 input,select').prop("disabled", true);
			 			$("#intkqSuccessMessage").css("display","block");
			 			
			 		}
			 	 };

	});

</script>

</body>

</html>