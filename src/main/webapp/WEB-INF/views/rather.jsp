<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="A front-end template that helps you build fast, modern mobile web apps.">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
    <title>Material Design Lite</title>

    <!-- Add to homescreen for Chrome on Android -->
    <meta name="mobile-web-app-capable" content="yes">
    <link rel="icon" sizes="192x192" href="images/android-desktop.png">

    <!-- Add to homescreen for Safari on iOS -->
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-title" content="Material Design Lite">
    <link rel="apple-touch-icon-precomposed" href="images/ios-desktop.png">

    <!-- Tile icon for Win8 (144x144 + tile color) -->
    <meta name="msapplication-TileImage" content="images/touch/ms-touch-icon-144x144-precomposed.png">
    <meta name="msapplication-TileColor" content="#3372DF">

    <link rel="shortcut icon" href="images/favicon.png">

    <!-- SEO: If your mobile URL is different from the desktop URL, add a canonical link to the desktop page https://developers.google.com/webmasters/smartphone-sites/feature-phones -->
    <!--
    <link rel="canonical" href="http://www.example.com/">
    -->

	<link href=“https://fonts.googleapis.com/css?family=Montserrat” rel=“stylesheet”>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.cyan-light_blue.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/styles.css"/>
    <style>
    #view-source {
      position: fixed;
      display: block;
      right: 0;
      bottom: 0;
      margin-right: 40px;
      margin-bottom: 40px;
      z-index: 900;
    }
    </style>
  </head>
  <body>
    <div class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
      <header class="demo-header mdl-layout__header">
        <div class="mdl-layout__header-row">
          <span class="mdl-layout-title">Home</span>
          <div class="mdl-layout-spacer"></div>
          <div class="mdl-textfield mdl-js-textfield mdl-textfield--expandable">
            <label class="mdl-button mdl-js-button mdl-button--icon" for="search">
              <i class="material-icons">search</i>
            </label>
            <div class="mdl-textfield__expandable-holder">
              <input class="mdl-textfield__input" type="text" id="search">
              <label class="mdl-textfield__label" for="search">Enter your query...</label>
            </div>
          </div>
          <button class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon" id="hdrbtn">
            <i class="material-icons">more_vert</i>
          </button>
          <ul class="mdl-menu mdl-js-menu mdl-js-ripple-effect mdl-menu--bottom-right" for="hdrbtn">
            <li class="mdl-menu__item">About</li>
            <li class="mdl-menu__item">Contact</li>
            <li class="mdl-menu__item">Legal information</li>
          </ul>
        </div>
      </header>
      <div class="demo-drawer mdl-layout__drawer ">
        <header class="demo-drawer-header">
          <img src="http://www.madana.io/images/animations/Animation 2/A2_3.png" class="demo-avatar">
          <div class="demo-avatar-dropdown">
            <span><h4>${msg}</h4></span>
            <div class="mdl-layout-spacer"></div>
            <button id="accbtn" class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon">
              <i class="material-icons" role="presentation">arrow_drop_down</i>
              <span class="visuallyhidden">Accounts</span>
            </button>
            <ul class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect" for="accbtn">
              <li class="mdl-menu__item"><i class="material-icons">add</i>Create account...</li>
                <li class="mdl-menu__item"><i class="material-icons">lock_open</i>Login...</li>
                  <li class="mdl-menu__item"><i class="material-icons">lock</i>Logout...</li>
            </ul>
          </div>
        </header>
        <nav class="demo-navigation mdl-navigation">
          <a class="mdl-navigation__link" href="/home"><i class=" material-icons" role="presentation">home</i>Home</a>
          <a class="mdl-navigation__link" href="/profile"><i class=" material-icons" role="presentation">person</i>Profile</a>
          <a class="mdl-navigation__link" href="/bounty"><i class=" material-icons" role="presentation">share</i>Bounty</a>
          <a class="mdl-navigation__link" href="/rather"><i class=" material-icons" role="presentation">poll</i>Rather</a>
          <a class="mdl-navigation__link" href="ranking"><i class=" material-icons" role="presentation">group</i>Ranking</a>
           <div class="mdl-layout-spacer"></div>
       
                     <div class="mdl-layout-spacer"></div>
          <a class="mdl-navigation__link" href=""><i class=" material-icons" role="presentation">help_outline</i><span class="">Help</span></a>
        </nav>
      </div>
      <main class="mdl-layout__content content">
        <div class="mdl-grid demo-content">
        
          <div class="demo-graphs mdl-shadow--2dp mdl-color--white mdl-cell mdl-cell--12-col">
        <h1>Rather</h1><br><br><br><br>
<h2>Would you rather</h2> <br><br><br><br>
<div class="row">
<div class="col-md-6" ><div class="demo-card-wide mdl-card mdl-shadow--2dp" style="width:100%;background-color:#4d7da2;color:#b2d1ef;">
  <div class="mdl-card__title">
    <h2 style="color:#b2d1ef;">Love MADANA because it's awesome!</h2>
  </div>
  <div>
    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
    Mauris sagittis pellentesque lacus eleifend lacinia...
  </div>
  <div class="mdl-card__actions mdl-card--border">
   <button class="mdl-button mdl-js-button mdl-button--icon mdl-button--colored" style="color:#f3f3f6;">
  <i class="material-icons">star-border</i>
</button>
  </div>

</div></div>
<div class="col-md-6" ><div class="demo-card-wide mdl-card mdl-shadow--2dp" style="width:100%;background-color:#b2d1ef;color:#4d7da2;">
  <div class="mdl-card__title">
    <h2 style="color:#4d7da2;">Love MADANA because it's awesome!</h2>
  </div>
  <div >
    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
    Mauris sagittis pellentesque lacus eleifend lacinia...
  </div>
  <div class="mdl-card__actions mdl-card--border">
     <button class="mdl-button mdl-js-button mdl-button--icon mdl-button--colored " style="color:#f3f3f6;">
  <i class="material-icons">star-border</i>
</button>

  </div>
  </div>
</div></div>
          </div>
   
        </div>
      </main>
    </div>
      <script src="https://code.getmdl.io/1.3.0/material.min.js"></script>
  </body>
</html>
