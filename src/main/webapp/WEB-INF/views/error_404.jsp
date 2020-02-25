<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<meta http-equiv="refresh" content="10; URL='/" />
<jsp:include page="components/header.jsp" />
<jsp:include page="components/loginheader.jsp" />

<style>
.login {
	position: absolute;
top: calc(50% - 50px);
	left: calc(50%);
	height: 150px;
	width: 600px;
	z-index: 2;
}
@media screen and (max-width: 767px)
 {
.login {
	position: absolute;
	top: 250px;
	    left: calc(22%);
	height: 150px;
	width: 250px;;
	z-index: 2;
}
}

</style>


<!-- Custom CSS -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
    <link rel="stylesheet" media="screen" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600" />
    <link rel="stylesheet" media="screen" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" />


    <style>
     * {
         -moz-box-sizing:border-box;
         -webkit-box-sizing:border-box;
         box-sizing:border-box;
     }

     html, body, div, span, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre,
     abbr, address, cite, code, del, dfn, em, img, ins, kbd, q, samp,
     small, strong, sub, sup, var, b, i, dl, dt, dd, ol, ul, li,
     fieldset, form, label, legend, caption, article, aside, canvas, details, figcaption, figure,  footer, header, hgroup,
     menu, nav, section, summary, time, mark, audio, video {
         margin:0;
         padding:0;
         border:0;
         outline:0;
         vertical-align:baseline;
         background:transparent;
     }

     article, aside, details, figcaption, figure, footer, header, hgroup, nav, section {
         display: block;
     }



     img {
         vertical-align:middle;
         max-width: 100%;
         height: auto;
         border: 0;
         -ms-interpolation-mode: bicubic;
     }

     body {
         min-height:100%;
         -webkit-font-smoothing: subpixel-antialiased;
     }

     .clearfix {
	       clear:both;
	       zoom: 1;
     }
     .clearfix:before, .clearfix:after {
         content: "\0020";
         display: block;
         height: 0;
         visibility: hidden;
     }
     .clearfix:after {
         clear: both;
     }
    </style>
    <style>
  .plain.error-page-wrapper {
  
    padding:0 5%;
    position:relative;
  }

  .plain.error-page-wrapper .content-container {
    -webkit-transition: left .5s ease-out, opacity .5s ease-out;
    -moz-transition: left .5s ease-out, opacity .5s ease-out;
    -ms-transition: left .5s ease-out, opacity .5s ease-out;
    -o-transition: left .5s ease-out, opacity .5s ease-out;
    transition: left .5s ease-out, opacity .5s ease-out;
    max-width:400px;
    position:relative;
    left:-30px;
    opacity:0;
  }

  .plain.error-page-wrapper .content-container.in {
    left: 0px;
    opacity:1;
  }

  .plain.error-page-wrapper .head-line {
    transition: color .2s linear;
    font-size:48px;
    line-height:60px;
    color:rgba(255,255,255,.2);
    letter-spacing: -1px;
    margin-bottom: 5px;
  }
  .plain.error-page-wrapper .subheader {
    transition: color .2s linear;
    font-size:36px;
    line-height:46px;
    color:#fff;
  }
  .plain.error-page-wrapper hr {
    height:1px;
    background-color: rgba(255,255,255,.2);
    border:none;
    width:250px;
    margin:35px 0;
  }
  .plain.error-page-wrapper .context {
    transition: color .2s linear;
    font-size:18px;
    line-height:27px;
    color:#fff;
  }
  .plain.error-page-wrapper .context p {
    margin:0;
  }
  .plain.error-page-wrapper .context p:nth-child(n+2) {
    margin-top:12px;
  }
  .plain.error-page-wrapper .buttons-container {
    margin-top: 45px;
 
  }
  .plain.error-page-wrapper .buttons-container a {
    transition: color .2s linear, border-color .2s linear;
    font-size:14px;
    text-transform: uppercase;
    text-decoration: none;
    color:#fff;
    border:2px solid white;
    border-radius: 99px;
    padding:8px 30px 9px;
    display: inline-block;
    float:left;
  }
  .plain.error-page-wrapper .buttons-container a:hover {
    background-color:rgba(255,255,255,.05);
  }
  .plain.error-page-wrapper .buttons-container a:first-child {
    margin-right:25px;
  }

  @media screen and (max-width: 485px) {
    .plain.error-page-wrapper .header {
      font-size:36px;
     }
    .plain.error-page-wrapper .subheader {
      font-size:27px;
      line-height:38px;
     }
    .plain.error-page-wrapper hr {
      width:185px;
      margin:25px 0;
     }

    .plain.error-page-wrapper .context {
      font-size:16px;
      line-height: 24px;
     }
    .plain.error-page-wrapper .buttons-container {
      margin-top:35px;
    }

    .plain.error-page-wrapper .buttons-container a {
      font-size:13px;
      padding:8px 0 7px;
      width:45%;
      text-align: center;
    }
    .plain.error-page-wrapper .buttons-container a:first-child {
      margin-right:10%;
    }
  }
</style>

    <style>


    .primary-text-color {
      color: #FFFFFF !important;
    }

    .secondary-text-color {
      color: rgba(160, 195, 232, 1) !important;
    }




    .border-button {
      color: rgba(178, 209, 239, 1) !important;
      border-color: rgba(178, 209, 239, 1) !important;
    }
    .button {
      background-color: rgba(178, 209, 239, 1) !important;
      color:  !important;
    }


</style>


<body>

	<div
		class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
		<div id="container" style="    height: 100%;
    width: 100%;
    justify-content: center;
    align-items: center;

    position: fixed;
    top: 0;
    left: 0;
    min-width: 100%;
    min-height: 100%;
    background-color: rgba(39,72,99,1.0);
    background-image: url(https://cdn.madana.io/commonvisuals/backgrounds/hero-grid.jpg);
    background-size: cover;
    background-blend-mode: multiply;
    -webkit-filter: blur(5px);">
		

		
			<br>

		</div>


	</div>
		<div class="header">
				<div>
				 <img src="https://cdn.madana.io/commonvisuals/logos/logo-madana@3x.png"
						alt="MADANA Logo" width="175" height="175"
						style="text-align: center; display: block;"> 
						<span style="   font-family: Montserrat;
    font-style: normal;
    font-variant: normal;
    font-size: 36px;
    color: #a0c3e8 !important;
    position: absolute;
    top: 120px;
    left: -30px;
">Community </span>
				</div>
			</div>
			<div class="content">
				<div class="login plain error-page-wrapper">
									    <div class="content-container">
	<div class="head-line secondary-text-color">
		404
	</div>
	<div class="subheader primary-text-color">
		Oops, the page you're <br>
		looking for does not exist.
	</div>
    <hr>
    <div class="clearfix"></div>
    <div class="context primary-text-color">
       <p>Our status page is currently reporting a status of <strong id="replace-with-fetched-data"><em>fetching from status page...</em></strong>.</p>
        <p>
      You may want to head back to the homepage.<br />
      If you think something is broken, report a problem.
    </p>
   


    </div>
	<div class="buttons-container">
		 <a class="border-button" href="/home" target="_blank">Go to homepage</a> 
		
	</div>
</div>
		

 <script>
     function ErrorPage(container, pageType, templateName) {
       this.$container = $(container);
       this.$contentContainer = this.$container.find(templateName == 'sign' ? '.sign-container' : '.content-container');
       this.pageType = pageType;
       this.templateName = templateName;
     }

     ErrorPage.prototype.centerContent = function () {
       var containerHeight = this.$container.outerHeight()
         , contentContainerHeight = this.$contentContainer.outerHeight()
         , top = (containerHeight - contentContainerHeight) / 2
         , offset = this.templateName == 'sign' ? -100 : 0;

       this.$contentContainer.css('top', top + offset);
     };

     ErrorPage.prototype.initialize = function () {
       var self = this;

       this.centerContent();
       this.$container.on('resize', function (e) {
         e.preventDefault();
         e.stopPropagation();
         self.centerContent();
       });

       // fades in content on the plain template
       if (this.templateName == 'plain') {
         window.setTimeout(function () {
           self.$contentContainer.addClass('in');
         }, 500);
       }

       // swings sign in on the sign template
       if (this.templateName == 'sign') {
         $('.sign-container').animate({textIndent : 0}, {
           step : function (now) {
             $(this).css({
               transform : 'rotate(' + now + 'deg)',
               'transform-origin' : 'top center'
             });
           },
           duration : 1000,
           easing : 'easeOutBounce'
         });
       }
     };


     ErrorPage.prototype.createTimeRangeTag = function(start, end) {
       return (
         '<time utime=' + start + ' simple_format="MMM DD, YYYY HH:mm">' + start + '</time> - <time utime=' + end + ' simple_format="MMM DD, YYYY HH:mm">' + end + '</time>.'
       )
     };


     ErrorPage.prototype.handleStatusFetchSuccess = function (pageType, data) {
       if (pageType == '503') {
         $('#replace-with-fetched-data').html(data.status.description);
       } else {
         if (!!data.scheduled_maintenances.length) {
           var maint = data.scheduled_maintenances[0];
           $('#replace-with-fetched-data').html(this.createTimeRangeTag(maint.scheduled_for, maint.scheduled_until));
           $.fn.localizeTime();
         }
         else {
           $('#replace-with-fetched-data').html('<em>(there are no active scheduled maintenances)</em>');
         }
       }
     };


     ErrorPage.prototype.handleStatusFetchFail = function (pageType) {
       $('#replace-with-fetched-data').html('<em>(enter a valid Statuspage url)</em>');
     };


     ErrorPage.prototype.fetchStatus = function (pageUrl, pageType) {
       //console.log('in app.js fetch');
       if (!pageUrl || !pageType || pageType == '404') return;

       var url = ''
         , self = this;

       if (pageType == '503') {
         url = pageUrl + '/api/v2/status.json';
       }
       else {
         url = pageUrl + '/api/v2/scheduled-maintenances/active.json';
       }

       $.ajax({
         type : "GET",
         url : url,
       }).success(function (data, status) {
         //console.log('success');
         self.handleStatusFetchSuccess(pageType, data);
       }).fail(function (xhr, msg) {
         //console.log('fail');
         self.handleStatusFetchFail(pageType);
       });

     };
     var ep = new ErrorPage('body', "503", "plain");
     ep.initialize();

     // hack to make sure content stays centered >_<
     $(window).on('resize', function() {
       $('body').trigger('resize')
     });

     $(function () {
       ep.fetchStatus("https://<c:out value="${STATUSPAGE_PAGEID}"/>.statuspage.io", "503");
     });
    </script>
			</div>

	<jsp:include page="components/snackbar.jsp" />
				</div>

			</div>
	<c:if test="${not empty STATUSPAGE_PAGEID}">
		<div class="mobilehide" id="status">
			<a href="<c:out value="${STATUSPAGE_PAGELINK}"/>" target="_blank"
				style="text-decoration: none;"> <span class="color-dot"></span>
				<span class="color-description"></span>
			</a>
		</div>
		<jsp:include page="components/widgets/StatusPage.jsp" />
	</c:if>
	<jsp:include page="components/footer.jsp" />


</body>
<script type="text/javascript">
$("#container").mousemove(function(e) {
  parallaxIt(e, ".slide", -100);
  parallaxIt(e, "img", -30);
});

function parallaxIt(e, target, movement) {
  var $this = $("#container");
  var relX = e.pageX - $this.offset().left;
  var relY = e.pageY - $this.offset().top;

  TweenMax.to(target, 1, {
    x: (relX - $this.width() / 2) / $this.width() * movement,
    y: (relY - $this.height() / 2) / $this.height() * movement
  });
}
	</script>
</html>

