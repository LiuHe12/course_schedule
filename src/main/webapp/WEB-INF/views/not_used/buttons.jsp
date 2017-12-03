<!DOCTYPE html>
<html lang="en">
<head>
<title>Matrix Admin</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="css/fullcalendar.css" />
<link rel="stylesheet" href="css/matrix-style.css" />
<link rel="stylesheet" href="css/matrix-media.css" />
<link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
</head>
<body>

<!--Header-part-->
<div id="header">
  <h1><a href="dashboard.html">Matrix Admin</a></h1>
</div>
<!--close-Header-part--> 

<!--top-Header-menu-->
<div id="user-nav" class="navbar navbar-inverse">
  <ul class="nav">
    <li  class="dropdown" id="profile-messages" ><a title="" href="#" data-toggle="dropdown" data-target="#profile-messages" class="dropdown-toggle"><i class="icon icon-user"></i>  <span class="text">Welcome User</span><b class="caret"></b></a>
      <ul class="dropdown-menu">
        <li><a href="#"><i class="icon-user"></i> My Profile</a></li>
        <li class="divider"></li>
        <li><a href="#"><i class="icon-check"></i> My Tasks</a></li>
        <li class="divider"></li>
        <li><a href="login.html"><i class="icon-key"></i> Log Out</a></li>
      </ul>
    </li>
    <li class="dropdown" id="menu-messages"><a href="#" data-toggle="dropdown" data-target="#menu-messages" class="dropdown-toggle"><i class="icon icon-envelope"></i> <span class="text">Messages</span> <span class="label label-important">5</span> <b class="caret"></b></a>
      <ul class="dropdown-menu">
        <li><a class="sAdd" title="" href="#"><i class="icon-plus"></i> new message</a></li>
        <li class="divider"></li>
        <li><a class="sInbox" title="" href="#"><i class="icon-envelope"></i> inbox</a></li>
        <li class="divider"></li>
        <li><a class="sOutbox" title="" href="#"><i class="icon-arrow-up"></i> outbox</a></li>
        <li class="divider"></li>
        <li><a class="sTrash" title="" href="#"><i class="icon-trash"></i> trash</a></li>
      </ul>
    </li>
    <li class=""><a title="" href="#"><i class="icon icon-cog"></i> <span class="text">Settings</span></a></li>
    <li class=""><a title="" href="login.html"><i class="icon icon-share-alt"></i> <span class="text">Logout</span></a></li>
  </ul>
</div>

<!--start-top-serch-->
<div id="search">
  <input type="text" placeholder="Search here..."/>
  <button type="submit" class="tip-bottom" title="Search"><i class="icon-search icon-white"></i></button>
</div>
<!--close-top-serch--> 

<!--sidebar-menu-->
<div id="sidebar"> <a href="#" class="visible-phone"><i class="icon icon-tint"></i>Buttons &amp; icons</a>
  <ul>
    <li><a href="index.html"><i class="icon icon-home"></i> <span>Dashboard</span></a> </li>
    <li><a href="charts.html"><i class="icon icon-signal"></i> <span>Charts &amp; graphs</span></a> </li>
    <li><a href="widgets.html"><i class="icon icon-inbox"></i> <span>Widgets</span></a> </li>
    <li><a href="tables.html"><i class="icon icon-th"></i> <span>Tables</span></a></li>
    <li><a href="grid.html"><i class="icon icon-fullscreen"></i> <span>Full width</span></a></li>
    <li class="submenu"> <a href="#"><i class="icon icon-list"></i> <span>Forms</span> <span class="label label-important">3</span></a>
      <ul>
        <li><a href="form-common.html">Basic Form</a></li>
        <li><a href="form-validation.html">Form with Validation</a></li>
        <li><a href="form-wizard.html">Form with Wizard</a></li>
      </ul>
    </li>
    <li class="active"><a href="buttons.html"><i class="icon icon-tint"></i> <span>Buttons &amp; icons</span></a></li>
    <li><a href="interface.html"><i class="icon icon-pencil"></i> <span>Eelements</span></a></li>
    <li class="submenu"> <a href="#"><i class="icon icon-file"></i> <span>Addons</span> <span class="label label-important">5</span></a>
      <ul>
        <li><a href="index2.html">Dashboard2</a></li>
        <li><a href="gallery.html">Gallery</a></li>
        <li><a href="calendar.html">Calendar</a></li>
        <li><a href="invoice.html">Invoice</a></li>
        <li><a href="chat.html">Chat option</a></li>
      </ul>
    </li>
    <!--<li class="submenu"> <a href="#"><i class="icon icon-info-sign"></i> <span>Error</span> <span class="label label-important">4</span></a>
      <ul>
        <li><a href="error403.html">Error 403</a></li>
        <li><a href="error404.html">Error 404</a></li>
        <li><a href="error405.html">Error 405</a></li>
        <li><a href="error500.html">Error 500</a></li>
      </ul>-->
    </li>
    <li class="content"> <span>Monthly Bandwidth Transfer</span>
      <div class="progress progress-mini progress-danger active progress-striped">
        <div style="width: 77%;" class="bar"></div>
      </div>
      <span class="percent">77%</span>
      <div class="stat">21419.94 / 14000 MB</div>
    </li>
    <li class="content"> <span>Disk Space Usage</span>
      <div class="progress progress-mini active progress-striped">
        <div style="width: 87%;" class="bar"></div>
      </div>
      <span class="percent">87%</span>
      <div class="stat">604.44 / 4000 MB</div>
    </li>
  </ul>
</div>

<!--main-container-part-->
<div id="content">
  <div id="content-header">
    <div id="breadcrumb"><a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a> <a href="#" class="current">Buttons &amp; icons</a></div>
    <h1>Buttons &amp; icons</h1>
  </div>
  <div class="container-fluid">
    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
          <div class="widget-title"><span class="icon"><i class="icon-bookmark"></i></span>
            <h5>All Buttons</h5>
          </div>
          <div class="widget-content">
            <h5>Mini Buttons </h5>
            <code>(class="btn btn-mini")</code>
            <p>
              <button class="btn btn-mini">Button</button>
              <button class="btn btn-primary btn-mini">btn-primary</button>
              <button class="btn btn-info btn-mini">btn-info</button>
              <button class="btn btn-success btn-mini">btn-success</button>
              <button class="btn btn-warning btn-mini">btn-warning</button>
              <button class="btn btn-danger btn-mini">btn-danger</button>
              <button class="btn btn-inverse btn-mini">btn-inverse</button>
            </p>
            <hr>
            </hr>
            <h4>General Buttons </h4>
            <code>(class="btn")</code>
            <p>
              <button class="btn">Button</button>
              <button class="btn btn-primary">btn-primary</button>
              <button class="btn btn-info">btn-info</button>
              <button class="btn btn-success">btn-success</button>
              <button class="btn btn-warning">btn-warning</button>
              <button class="btn btn-danger">btn-danger</button>
              <button class="btn btn-inverse">btn-inverse</button>
            </p>
            <hr>
            </hr>
            <h3>Large Buttons </h3>
            <code>(class="btn btn-large")</code>
            <p>
              <button class="btn btn-large">Button</button>
              <button class="btn btn-primary btn-large">btn-primary</button>
              <button class="btn btn-info btn-large">btn-info</button>
              <button class="btn btn-success btn-large">btn-success</button>
              <button class="btn btn-warning btn-large">btn-warning</button>
              <button class="btn btn-danger btn-large">btn-danger</button>
              <button class="btn btn-inverse btn-large">btn-inverse</button>
            </p>
          </div>
        </div>
        <div class="widget-box">
          <div class="widget-title"><span class="icon"><i class="icon-bookmark"></i></span>
            <h5>All Buttons</h5>
          </div>
          <div class="widget-content">
            <h3>Button dropdowns<code>(class="btn-group", "btn dropdown-toggle")</code></h3>
            <div class="btn-group">
              <button data-toggle="dropdown" class="btn dropdown-toggle">btn-group <span class="caret"></span></button>
              <ul class="dropdown-menu">
                <li><a href="#">Action</a></li>
                <li><a href="#">Another action</a></li>
                <li><a href="#">Something else here</a></li>
                <li class="divider"></li>
                <li><a href="#">Separated link</a></li>
              </ul>
            </div>
            <div class="btn-group">
              <button data-toggle="dropdown" class="btn btn-primary dropdown-toggle">Action <span class="caret"></span></button>
              <ul class="dropdown-menu">
                <li><a href="#">Action</a></li>
                <li><a href="#">Another action</a></li>
                <li><a href="#">Something else here</a></li>
                <li class="divider"></li>
                <li><a href="#">Separated link</a></li>
              </ul>
            </div>
            <div class="btn-group">
              <button data-toggle="dropdown" class="btn btn-danger dropdown-toggle">Danger <span class="caret"></span></button>
              <ul class="dropdown-menu">
                <li><a href="#">Action</a></li>
                <li><a href="#">Another action</a></li>
                <li><a href="#">Something else here</a></li>
                <li class="divider"></li>
                <li><a href="#">Separated link</a></li>
              </ul>
            </div>
            <div class="btn-group">
              <button data-toggle="dropdown" class="btn btn-warning dropdown-toggle">Warning <span class="caret"></span></button>
              <ul class="dropdown-menu">
                <li><a href="#">Action</a></li>
                <li><a href="#">Another action</a></li>
                <li><a href="#">Something else here</a></li>
                <li class="divider"></li>
                <li><a href="#">Separated link</a></li>
              </ul>
            </div>
            <div class="btn-group">
              <button data-toggle="dropdown" class="btn btn-success dropdown-toggle">Success <span class="caret"></span></button>
              <ul class="dropdown-menu">
                <li><a href="#">Action</a></li>
                <li><a href="#">Another action</a></li>
                <li><a href="#">Something else here</a></li>
                <li class="divider"></li>
                <li><a href="#">Separated link</a></li>
              </ul>
            </div>
            <div class="btn-group">
              <button data-toggle="dropdown" class="btn btn-info dropdown-toggle">Info <span class="caret"></span></button>
              <ul class="dropdown-menu">
                <li><a href="#">Action</a></li>
                <li><a href="#">Another action</a></li>
                <li><a href="#">Something else here</a></li>
                <li class="divider"></li>
                <li><a href="#">Separated link</a></li>
              </ul>
            </div>
            <div class="btn-group">
              <button data-toggle="dropdown" class="btn btn-inverse dropdown-toggle">Inverse <span class="caret"></span></button>
              <ul class="dropdown-menu">
                <li><a href="#">Action</a></li>
                <li><a href="#">Another action</a></li>
                <li><a href="#">Something else here</a></li>
                <li class="divider"></li>
                <li><a href="#">Separated link</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <div class="widget-box">
        <div class="widget-title"><span class="icon"><i class="icon-bookmark"></i></span>
          <h5>All Buttons</h5>
        </div>
        <div class="widget-content">
          <h3>Split button dropdowns</h3>
          <p>Building on the button group styles and markup, we can easily create a split button. Split buttons feature a standard action on the left and a dropdown toggle on the right with contextual links.</p>
          <div class="btn-group">
            <button class="btn">Action</button>
            <button data-toggle="dropdown" class="btn dropdown-toggle"><span class="caret"></span></button>
            <ul class="dropdown-menu">
              <li><a href="#">Action</a></li>
              <li><a href="#">Another action</a></li>
              <li><a href="#">Something else here</a></li>
              <li class="divider"></li>
              <li><a href="#">Separated link</a></li>
            </ul>
          </div>
          <div class="btn-group">
            <button class="btn btn-primary">Action</button>
            <button data-toggle="dropdown" class="btn btn-primary dropdown-toggle"><span class="caret"></span></button>
            <ul class="dropdown-menu">
              <li><a href="#">Action</a></li>
              <li><a href="#">Another action</a></li>
              <li><a href="#">Something else here</a></li>
              <li class="divider"></li>
              <li><a href="#">Separated link</a></li>
            </ul>
          </div>
          <div class="btn-group">
            <button class="btn btn-danger">Danger</button>
            <button data-toggle="dropdown" class="btn btn-danger dropdown-toggle"><span class="caret"></span></button>
            <ul class="dropdown-menu">
              <li><a href="#">Action</a></li>
              <li><a href="#">Another action</a></li>
              <li><a href="#">Something else here</a></li>
              <li class="divider"></li>
              <li><a href="#">Separated link</a></li>
            </ul>
          </div>
          <div class="btn-group">
            <button class="btn btn-warning">Warning</button>
            <button data-toggle="dropdown" class="btn btn-warning dropdown-toggle"><span class="caret"></span></button>
            <ul class="dropdown-menu">
              <li><a href="#">Action</a></li>
              <li><a href="#">Another action</a></li>
              <li><a href="#">Something else here</a></li>
              <li class="divider"></li>
              <li><a href="#">Separated link</a></li>
            </ul>
          </div>
          <div class="btn-group">
            <button class="btn btn-success">Success</button>
            <button data-toggle="dropdown" class="btn btn-success dropdown-toggle"><span class="caret"></span></button>
            <ul class="dropdown-menu">
              <li><a href="#">Action</a></li>
              <li><a href="#">Another action</a></li>
              <li><a href="#">Something else here</a></li>
              <li class="divider"></li>
              <li><a href="#">Separated link</a></li>
            </ul>
          </div>
          <div class="btn-group">
            <button class="btn btn-info">Info</button>
            <button data-toggle="dropdown" class="btn btn-info dropdown-toggle"><span class="caret"></span></button>
            <ul class="dropdown-menu">
              <li><a href="#">Action</a></li>
              <li><a href="#">Another action</a></li>
              <li><a href="#">Something else here</a></li>
              <li class="divider"></li>
              <li><a href="#">Separated link</a></li>
            </ul>
          </div>
          <div class="btn-group">
            <button class="btn btn-inverse">Inverse</button>
            <button data-toggle="dropdown" class="btn btn-inverse dropdown-toggle"><span class="caret"></span></button>
            <ul class="dropdown-menu">
              <li><a href="#">Action</a></li>
              <li><a href="#">Another action</a></li>
              <li><a href="#">Something else here</a></li>
              <li class="divider"></li>
              <li><a href="#">Separated link</a></li>
            </ul>
          </div>
        </div>
      </div>
      <div class="row-fluid">
        <div class="span12">
          <div class="widget-box">
            <div class="widget-title"> <span class="icon"> <i class="icon-play-circle"></i> </span>
              <h5>Font Awesome icons</h5>
            </div>
            <div class="widget-content">
              <div class="row-fluid">
                <div class="span12 btn-icon-pg">
                  <ul>
                    <li><i class="icon-adjust"></i> icon-adjust</li>
                    <li><i class="icon-asterisk"></i> icon-asterisk</li>
                    <li><i class="icon-ban-circle"></i> icon-ban-circle</li>
                    <li><i class="icon-bar-chart"></i> icon-bar-chart</li>
                    <li><i class="icon-barcode"></i> icon-barcode</li>
                    <li><i class="icon-beaker"></i> icon-beaker</li>
                    <li><i class="icon-bell"></i> icon-bell</li>
                    <li><i class="icon-bolt"></i> icon-bolt</li>
                    <li><i class="icon-book"></i> icon-book</li>
                    <li><i class="icon-bookmark"></i> icon-bookmark</li>
                    <li><i class="icon-bookmark-empty"></i> icon-bookmark-empty</li>
                    <li><i class="icon-briefcase"></i> icon-briefcase</li>
                    <li><i class="icon-bullhorn"></i> icon-bullhorn</li>
                    <li><i class="icon-calendar"></i> icon-calendar</li>
                    <li><i class="icon-camera"></i> icon-camera</li>
                    <li><i class="icon-camera-retro"></i> icon-camera-retro</li>
                    <li><i class="icon-certificate"></i> icon-certificate</li>
                    <li><i class="icon-check"></i> icon-check</li>
                    <li><i class="icon-check-empty"></i> icon-check-empty</li>
                    <li><i class="icon-cloud"></i> icon-cloud</li>
                    <li><i class="icon-cog"></i> icon-cog</li>
                    <li><i class="icon-cogs"></i> icon-cogs</li>
                    <li><i class="icon-comment"></i> icon-comment</li>
                    <li><i class="icon-comment-alt"></i> icon-comment-alt</li>
                    <li><i class="icon-comments"></i> icon-comments</li>
                    <li><i class="icon-comments-alt"></i> icon-comments-alt</li>
                    <li><i class="icon-credit-card"></i> icon-credit-card</li>
                    <li><i class="icon-dashboard"></i> icon-dashboard</li>
                    <li><i class="icon-download"></i> icon-download</li>
                    <li><i class="icon-download-alt"></i> icon-download-alt</li>
                    <li><i class="icon-edit"></i> icon-edit</li>
                    <li><i class="icon-envelope"></i> icon-envelope</li>
                    <li><i class="icon-envelope-alt"></i> icon-envelope-alt</li>
                    <li><i class="icon-exclamation-sign"></i> icon-exclamation-sign</li>
                    <li><i class="icon-external-link"></i> icon-external-link</li>
                    <li><i class="icon-eye-close"></i> icon-eye-close</li>
                    <li><i class="icon-eye-open"></i> icon-eye-open</li>
                    <li><i class="icon-facetime-video"></i> icon-facetime-video</li>
                    <li><i class="icon-film"></i> icon-film</li>
                    <li><i class="icon-filter"></i> icon-filter</li>
                    <li><i class="icon-fire"></i> icon-fire</li>
                    <li><i class="icon-flag"></i> icon-flag</li>
                    <li><i class="icon-folder-close"></i> icon-folder-close</li>
                    <li><i class="icon-folder-open"></i> icon-folder-open</li>
                    <li><i class="icon-gift"></i> icon-gift</li>
                    <li><i class="icon-glass"></i> icon-glass</li>
                    <li><i class="icon-globe"></i> icon-globe</li>
                    <li><i class="icon-group"></i> icon-group</li>
                    <li><i class="icon-hdd"></i> icon-hdd</li>
                    <li><i class="icon-headphones"></i> icon-headphones</li>
                    <li><i class="icon-heart"></i> icon-heart</li>
                    <li><i class="icon-heart-empty"></i> icon-heart-empty</li>
                    <li><i class="icon-home"></i> icon-home</li>
                    <li><i class="icon-inbox"></i> icon-inbox</li>
                    <li><i class="icon-info-sign"></i> icon-info-sign</li>
                    <li><i class="icon-key"></i> icon-key</li>
                    <li><i class="icon-leaf"></i> icon-leaf</li>
                    <li><i class="icon-legal"></i> icon-legal</li>
                    <li><i class="icon-lemon"></i> icon-lemon</li>
                    <li><i class="icon-lock"></i> icon-lock</li>
                    <li><i class="icon-unlock"></i> icon-unlock</li>
                    <li><i class="icon-magic"></i> icon-magic</li>
                    <li><i class="icon-magnet"></i> icon-magnet</li>
                    <li><i class="icon-map-marker"></i> icon-map-marker</li>
                    <li><i class="icon-minus"></i> icon-minus</li>
                    <li><i class="icon-minus-sign"></i> icon-minus-sign</li>
                    <li><i class="icon-money"></i> icon-money</li>
                    <li><i class="icon-move"></i> icon-move</li>
                    <li><i class="icon-music"></i> icon-music</li>
                    <li><i class="icon-off"></i> icon-off</li>
                    <li><i class="icon-ok"></i> icon-ok</li>
                    <li><i class="icon-ok-circle"></i> icon-ok-circle</li>
                    <li><i class="icon-ok-sign"></i> icon-ok-sign</li>
                    <li><i class="icon-pencil"></i> icon-pencil</li>
                    <li><i class="icon-picture"></i> icon-picture</li>
                    <li><i class="icon-plane"></i> icon-plane</li>
                    <li><i class="icon-plus"></i> icon-plus</li>
                    <li><i class="icon-plus-sign"></i> icon-plus-sign</li>
                    <li><i class="icon-print"></i> icon-print</li>
                    <li><i class="icon-pushpin"></i> icon-pushpin</li>
                    <li><i class="icon-qrcode"></i> icon-qrcode</li>
                    <li><i class="icon-question-sign"></i> icon-question-sign</li>
                    <li><i class="icon-random"></i> icon-random</li>
                    <li><i class="icon-refresh"></i> icon-refresh</li>
                    <li><i class="icon-remove"></i> icon-remove</li>
                    <li><i class="icon-remove-circle"></i> icon-remove-circle</li>
                    <li><i class="icon-remove-sign"></i> icon-remove-sign</li>
                    <li><i class="icon-reorder"></i> icon-reorder</li>
                    <li><i class="icon-resize-horizontal"></i> icon-resize-horizontal</li>
                    <li><i class="icon-resize-vertical"></i> icon-resize-vertical</li>
                    <li><i class="icon-retweet"></i> icon-retweet</li>
                    <li><i class="icon-road"></i> icon-road</li>
                    <li><i class="icon-rss"></i> icon-rss</li>
                    <li><i class="icon-screenshot"></i> icon-screenshot</li>
                    <li><i class="icon-search"></i> icon-search</li>
                    <li><i class="icon-share"></i> icon-share</li>
                    <li><i class="icon-share-alt"></i> icon-share-alt</li>
                    <li><i class="icon-shopping-cart"></i> icon-shopping-cart</li>
                    <li><i class="icon-signal"></i> icon-signal</li>
                    <li><i class="icon-signin"></i> icon-signin</li>
                    <li><i class="icon-signout"></i> icon-signout</li>
                    <li><i class="icon-sitemap"></i> icon-sitemap</li>
                    <li><i class="icon-sort"></i> icon-sort</li>
                    <li><i class="icon-sort-down"></i> icon-sort-down</li>
                    <li><i class="icon-sort-up"></i> icon-sort-up</li>
                    <li><i class="icon-star"></i> icon-star</li>
                    <li><i class="icon-star-empty"></i> icon-star-empty</li>
                    <li><i class="icon-star-half"></i> icon-star-half</li>
                    <li><i class="icon-tag"></i> icon-tag</li>
                    <li><i class="icon-tags"></i> icon-tags</li>
                    <li><i class="icon-tasks"></i> icon-tasks</li>
                    <li><i class="icon-thumbs-down"></i> icon-thumbs-down</li>
                    <li><i class="icon-thumbs-up"></i> icon-thumbs-up</li>
                    <li><i class="icon-time"></i> icon-time</li>
                    <li><i class="icon-tint"></i> icon-tint</li>
                    <li><i class="icon-trash"></i> icon-trash</li>
                    <li><i class="icon-trophy"></i> icon-trophy</li>
                    <li><i class="icon-truck"></i> icon-truck</li>
                    <li><i class="icon-umbrella"></i> icon-umbrella</li>
                    <li><i class="icon-upload"></i> icon-upload</li>
                    <li><i class="icon-upload-alt"></i> icon-upload-alt</li>
                    <li><i class="icon-user"></i> icon-user</li>
                    <li><i class="icon-user-md"></i> icon-user-md</li>
                    <li><i class="icon-volume-off"></i> icon-volume-off</li>
                    <li><i class="icon-volume-down"></i> icon-volume-down</li>
                    <li><i class="icon-volume-up"></i> icon-volume-up</li>
                    <li><i class="icon-warning-sign"></i> icon-warning-sign</li>
                    <li><i class="icon-wrench"></i> icon-wrench</li>
                    <li><i class="icon-zoom-in"></i> icon-zoom-in</li>
                    <li><i class="icon-zoom-out"></i> icon-zoom-out</li>
                    <li><i class="icon-file"></i> icon-file</li>
                    <li><i class="icon-cut"></i> icon-cut</li>
                    <li><i class="icon-copy"></i> icon-copy</li>
                    <li><i class="icon-paste"></i> icon-paste</li>
                    <li><i class="icon-save"></i> icon-save</li>
                    <li><i class="icon-undo"></i> icon-undo</li>
                    <li><i class="icon-repeat"></i> icon-repeat</li>
                    <li><i class="icon-paper-clip"></i> icon-paper-clip</li>
                    <li><i class="icon-text-height"></i> icon-text-height</li>
                    <li><i class="icon-text-width"></i> icon-text-width</li>
                    <li><i class="icon-align-left"></i> icon-align-left</li>
                    <li><i class="icon-align-center"></i> icon-align-center</li>
                    <li><i class="icon-align-right"></i> icon-align-right</li>
                    <li><i class="icon-align-justify"></i> icon-align-justify</li>
                    <li><i class="icon-indent-left"></i> icon-indent-left</li>
                    <li><i class="icon-indent-right"></i> icon-indent-right</li>
                    <li><i class="icon-font"></i> icon-font</li>
                    <li><i class="icon-bold"></i> icon-bold</li>
                    <li><i class="icon-italic"></i> icon-italic</li>
                    <li><i class="icon-strikethrough"></i> icon-strikethrough</li>
                    <li><i class="icon-underline"></i> icon-underline</li>
                    <li><i class="icon-link"></i> icon-link</li>
                    <li><i class="icon-columns"></i> icon-columns</li>
                    <li><i class="icon-table"></i> icon-table</li>
                    <li><i class="icon-th-large"></i> icon-th-large</li>
                    <li><i class="icon-th"></i> icon-th</li>
                    <li><i class="icon-th-list"></i> icon-th-list</li>
                    <li><i class="icon-list"></i> icon-list</li>
                    <li><i class="icon-list-ol"></i> icon-list-ol</li>
                    <li><i class="icon-list-ul"></i> icon-list-ul</li>
                    <li><i class="icon-list-alt"></i> icon-list-alt</li>
                    <li><i class="icon-arrow-down"></i> icon-arrow-down</li>
                    <li><i class="icon-arrow-left"></i> icon-arrow-left</li>
                    <li><i class="icon-arrow-right"></i> icon-arrow-right</li>
                    <li><i class="icon-arrow-up"></i> icon-arrow-up</li>
                    <li><i class="icon-chevron-down"></i> icon-chevron-down</li>
                    <li><i class="icon-circle-arrow-down"></i> icon-circle-arrow-down</li>
                    <li><i class="icon-circle-arrow-left"></i> icon-circle-arrow-left</li>
                    <li><i class="icon-circle-arrow-right"></i> icon-circle-arrow-right</li>
                    <li><i class="icon-circle-arrow-up"></i> icon-circle-arrow-up</li>
                    <li><i class="icon-chevron-left"></i> icon-chevron-left</li>
                    <li><i class="icon-caret-down"></i> icon-caret-down</li>
                    <li><i class="icon-caret-left"></i> icon-caret-left</li>
                    <li><i class="icon-caret-right"></i> icon-caret-right</li>
                    <li><i class="icon-caret-up"></i> icon-caret-up</li>
                    <li><i class="icon-chevron-right"></i> icon-chevron-right</li>
                    <li><i class="icon-hand-down"></i> icon-hand-down</li>
                    <li><i class="icon-hand-left"></i> icon-hand-left</li>
                    <li><i class="icon-hand-right"></i> icon-hand-right</li>
                    <li><i class="icon-hand-up"></i> icon-hand-up</li>
                    <li><i class="icon-chevron-up"></i> icon-chevron-up</li>
                    <li><i class="icon-play-circle"></i> icon-play-circle</li>
                    <li><i class="icon-play"></i> icon-play</li>
                    <li><i class="icon-pause"></i> icon-pause</li>
                    <li><i class="icon-stop"></i> icon-stop</li>
                    <li><i class="icon-step-backward"></i> icon-step-backward</li>
                    <li><i class="icon-fast-backward"></i> icon-fast-backward</li>
                    <li><i class="icon-backward"></i> icon-backward</li>
                    <li><i class="icon-forward"></i> icon-forward</li>
                    <li><i class="icon-fast-forward"></i> icon-fast-forward</li>
                    <li><i class="icon-step-forward"></i> icon-step-forward</li>
                    <li><i class="icon-eject"></i> icon-eject</li>
                    <li><i class="icon-fullscreen"></i> icon-fullscreen</li>
                    <li><i class="icon-resize-full"></i> icon-resize-full</li>
                    <li><i class="icon-resize-small"></i> icon-resize-small</li>
                    <li><i class="icon-phone"></i> icon-phone</li>
                    <li><i class="icon-phone-sign"></i> icon-phone-sign</li>
                    <li><i class="icon-facebook"></i> icon-facebook</li>
                    <li><i class="icon-facebook-sign"></i> icon-facebook-sign</li>
                    <li><i class="icon-twitter"></i> icon-twitter</li>
                    <li><i class="icon-twitter-sign"></i> icon-twitter-sign</li>
                    <li><i class="icon-github"></i> icon-github</li>
                    <li><i class="icon-github-sign"></i> icon-github-sign</li>
                    <li><i class="icon-linkedin"></i> icon-linkedin</li>
                    <li><i class="icon-linkedin-sign"></i> icon-linkedin-sign</li>
                    <li><i class="icon-pinterest"></i> icon-pinterest</li>
                    <li><i class="icon-pinterest-sign"></i> icon-pinterest-sign</li>
                    <li><i class="icon-google-plus"></i> icon-google-plus</li>
                    <li><i class="icon-google-plus-sign"></i> icon-google-plus-sign</li>
                    <li><i class="icon-sign-blank"></i> icon-sign-blank</li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!--End-main-container-part-->
<!--Footer-part-->
<!--Footer-part-->
<div class="row-fluid">
  <div id="footer" class="span12"> 2013 &copy; Matrix Admin. Brought to you by <a href="http://themedesigner.in">Themedesigner.in</a> </div>
</div>
<!--end-Footer-part-->
<!--end-Footer-part-->

<script src="js/jquery.min.js"></script> 
<script src="js/jquery.ui.custom.js"></script> 
<script src="js/bootstrap.min.js"></script> 
<script src="js/matrix.js"></script>
</body>
</html>
