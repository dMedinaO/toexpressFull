<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard App Logistica</title>

    <!--STYLESHEET-->
    <!--=================================================-->

    <!--Open Sans Font [ OPTIONAL ]-->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700' rel='stylesheet' type='text/css'>


    <!--Bootstrap Stylesheet [ REQUIRED ]-->
    <link href="../css/bootstrap.min.css" rel="stylesheet">


    <!--Nifty Stylesheet [ REQUIRED ]-->
    <link href="../css/nifty.min.css" rel="stylesheet">

    <!--Nifty Premium Icon [ DEMONSTRATION ]-->
    <link href="../css/demo/nifty-demo-icons.min.css" rel="stylesheet">


    <!--Demo [ DEMONSTRATION ]-->
    <link href="../css/demo/nifty-demo.min.css" rel="stylesheet">



    <!--DataTables [ OPTIONAL ]-->
    <link href="../plugins/datatables/media/css/dataTables.bootstrap.css" rel="stylesheet">
	  <link href="../plugins/datatables/extensions/Responsive/css/responsive.dataTables.min.css" rel="stylesheet">
    <!--JSTree [ OPTIONAL ]-->
    <link href="../plugins/jstree/themes/default/style.min.css" rel="stylesheet">

    <!--JAVASCRIPT-->
    <!--=================================================-->

    <!--Pace - Page Load Progress Par [OPTIONAL]-->
    <link href="../plugins/pace/pace.min.css" rel="stylesheet">
    <script src="../plugins/pace/pace.min.js"></script>


    <!--jQuery [ REQUIRED ]-->
    <script src="../js/jquery.min.js"></script>


    <!--BootstrapJS [ RECOMMENDED ]-->
    <script src="../js/bootstrap.min.js"></script>


    <!--NiftyJS [ RECOMMENDED ]-->
    <script src="../js/nifty.min.js"></script>


    <!--=================================================-->

    <!--Demo script [ DEMONSTRATION ]-->
    <script src="../js/demo/nifty-demo.min.js"></script>

    <!--JSTree [ OPTIONAL ]-->
    <script src="../plugins/jstree/jstree.min.js"></script>

    <!--DataTables [ OPTIONAL ]-->
    <script src="../plugins/datatables/media/js/jquery.dataTables.js"></script>
	  <script src="../plugins/datatables/media/js/dataTables.bootstrap.js"></script>
	  <script src="../plugins/datatables/extensions/Responsive/js/dataTables.responsive.min.js"></script>

    <!--Font Awesome [ OPTIONAL ]-->
    <link href="../plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!--Ion Icons [ OPTIONAL ]-->
    <link href="../plugins/flag-icon-css/css/flag-icon.min.css" rel="stylesheet">
    <!--Ion Icons [ OPTIONAL ]-->
    <link href="../plugins/ionicons/css/ionicons.min.css" rel="stylesheet">
    <!--Themify Icons [ OPTIONAL ]-->
    <link href="../plugins/themify-icons/themify-icons.min.css" rel="stylesheet">
    <!--Premium Line Icons [ OPTIONAL ]-->
    <link href="../premium/icon-sets/icons/line-icons/premium-line-icons.min.css" rel="stylesheet">
</head>

<!--TIPS-->
<!--You may remove all ID or Class names which contain "demo-", they are only used for demonstration. -->
<body>
    <div id="container" class="effect aside-float aside-bright mainnav-lg">

        <!--NAVBAR-->
        <!--===================================================-->
        <header id="navbar">
            <div id="navbar-container" class="boxed">

                <!--Brand logo & name-->
                <!--================================-->
                <div class="navbar-header">
                    <a href="../" class="navbar-brand">
                        <img src="../img/logo.png" alt="Nifty Logo" class="brand-icon">
                        <div class="brand-title">
                            <span class="brand-text">App Logística</span>
                        </div>
                    </a>
                </div>
                <!--================================-->
                <!--End brand logo & name-->


                <!--Navbar Dropdown-->
                <!--================================-->
                <div class="navbar-content clearfix">
                    <ul class="nav navbar-top-links pull-left">

                        <!--Navigation toogle button-->
                        <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                        <li class="tgl-menu-btn">
                            <a class="mainnav-toggle" href="#">
                                <i class="demo-pli-view-list"></i>
                            </a>
                        </li>
                        <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                        <!--End Navigation toogle button-->

                    </ul>
                    <ul class="nav navbar-top-links pull-right">

                        <!--User dropdown-->
                        <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                        <li id="dropdown-user" class="dropdown">
                            <a href="#" data-toggle="dropdown" class="dropdown-toggle text-right">
                                <span class="ic-user pull-right">
                                    <!--<img class="img-circle img-user media-object" src="img/profile-photos/1.png" alt="Profile Picture">-->
                                    <i class="demo-pli-male"></i>
                                </span>
                                <div class="username hidden-xs">Root User</div>
                            </a>


                            <div class="dropdown-menu dropdown-menu-md dropdown-menu-right panel-default">

                                <!-- Dropdown footer -->
                                <div class="pad-all text-right">
                                    <a href="http://toexpress.cl" class="btn btn-primary">
                                        <i class="demo-pli-unlock"></i> Salir!
                                    </a>
                                </div>
                            </div>
                        </li>
                        <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                        <!--End user dropdown-->

                    </ul>
                </div>
                <!--================================-->
                <!--End Navbar Dropdown-->

            </div>
        </header>
        <!--===================================================-->
        <!--END NAVBAR-->

        <div class="boxed">

          <!--CONTENT CONTAINER-->
          <!--===================================================-->
          <div id="content-container">
              <div id="page-head">

                  <!--Page Title-->
                  <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                  <div id="page-title">
                      <h1 class="page-header text-overflow">Roles Disponibles en el Sistema</h1>

                  </div>
                  <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                  <!--End page title-->
              </div>


              <!--Page content-->
              <!--===================================================-->
              <div id="page-content">

        <div class="row">

          <div class="col-sm-6 col-md-6">

                  <!-- Contact Widget -->
                  <!---------------------------------->
                  <div class="panel pos-rel">
                      <div class="pad-all text-center">
                          <div class="widget-control">

                          </div>
                          <a href="#">
                              <img alt="Profile Picture" class="img-lg img-circle mar-ver" src="../img/profile-photos/11.png">
                              <p class="text-lg text-semibold mar-no text-main">ROOT</p>

                              <p class="text-sm">Administrador del sistema. Posee todas las facultades asociadas al manejo de información relevante en
                                el sistema. Además de acciones asociadas a la configuración de mensajes, envío de notificaciones, etc.</p>
                          </a>
                      </div>
                  </div>
                  <!---------------------------------->
            </div>

            <div class="col-sm-6 col-md-6">

                    <!-- Contact Widget -->
                    <!---------------------------------->
                    <div class="panel pos-rel">
                        <div class="pad-all text-center">
                            <div class="widget-control">

                            </div>
                            <a href="#">
                                <img alt="Profile Picture" class="img-lg img-circle mar-ver" src="../img/profile-photos/9.png">
                                <p class="text-lg text-semibold mar-no text-main">BODEGUERO</p>

                                <p class="text-sm">Encargado de gestionar las rutas en el sistema, ingresar pedidos y monitorear el estado de éstos,
                                  corroborar si los pedidos han sido entregados y visualizar a los choferes para determinar en qué parte de la ruta se encuentran.</p>
                            </a>
                        </div>
                    </div>
                    <!---------------------------------->
            </div>

            <div class="col-sm-6 col-md-6">

                    <!-- Contact Widget -->
                    <!---------------------------------->
                    <div class="panel pos-rel">
                        <div class="pad-all text-center">
                            <div class="widget-control">

                            </div>
                            <a href="#">
                                <img alt="Profile Picture" class="img-lg img-circle mar-ver" src="../img/profile-photos/1.png">
                                <p class="text-lg text-semibold mar-no text-main">CHOFER</p>

                                <p class="text-sm">Encargado de despachar los productos y repartir la mercadería a cada cliente, debe registrar los pedidos que entregue
                                  y los mensajes que estos posean, además de enviar fotos a través de la app que corroboren que el trabajo se efectuó.</p>
                            </a>
                        </div>
                    </div>
                    <!---------------------------------->
              </div>

              <div class="col-sm-6 col-md-6">

                      <!-- Contact Widget -->
                      <!---------------------------------->
                      <div class="panel pos-rel">
                          <div class="pad-all text-center">
                              <div class="widget-control">

                              </div>
                              <a href="#">
                                  <img alt="Profile Picture" class="img-lg img-circle mar-ver" src="../img/profile-photos/2.png">
                                  <p class="text-lg text-semibold mar-no text-main">CLIENTE</p>

                                  <p class="text-sm">Encargado de visualizar sus pedidos y dejar comentarios sobre los productos recibidos, puede monitorear el estado
                                  de la ruta y ver dónde viene su pedido y el estado de éste durante el día.</p>
                              </a>
                          </div>
                      </div>
                      <!---------------------------------->
                </div>
              </div>
              </div>
              <!--===================================================-->
              <!--End page content-->

          </div>
          <!--===================================================-->
          <!--END CONTENT CONTAINER-->


            <!--MAIN NAVIGATION-->
            <!--===================================================-->
            <nav id="mainnav-container">
                <div id="mainnav">

                    <!--Menu-->
                    <!--================================-->
                    <div id="mainnav-menu-wrap">
                        <div class="nano">
                            <div class="nano-content">

                                <!--Profile Widget-->
                                <!--================================-->
                                <div id="mainnav-profile" class="mainnav-profile">
                                    <div class="profile-wrap text-center">
                                        <div class="pad-btm">
                                            <img class="img-circle img-md" src="../img/profile-photos/11.png" alt="Profile Picture">
                                        </div>
                                        <a href="#profile-nav" class="box-block" data-toggle="collapse" aria-expanded="false">
                                            <span class="pull-right dropdown-toggle">
                                                <i class="dropdown-caret"></i>
                                            </span>
                                            <p class="mnp-name">Root</p>
                                        </a>
                                    </div>
                                    <div id="profile-nav" class="collapse list-group bg-trans">

                                        <a href="http://toexpress.cl" class="list-group-item">
                                            <i class="demo-pli-unlock icon-lg icon-fw"></i> Salir
                                        </a>
                                    </div>
                                </div>

                                <ul id="mainnav-menu" class="list-group">

          						            <!--Category name-->
          						            <li class="list-header">Users</li>

																	<li>
          						                <a href="../roles/">
          						                    <i class="fa fa-user-times"></i>
          						                    <span class="menu-title">Roles</span><i class="arrow"></i>
          						                </a>

          						            </li>

                                  <li>
          						                <a href="../users/">
          						                    <i class="fa fa-users"></i>
          						                    <span class="menu-title">Usuarios</span><i class="arrow"></i>
          						                </a>

          						            </li>

                                  <li class="list-header">Bodega y Despacho</li>

                                  <li>
          						                <a href="../bodega/">
          						                    <i class="fa fa-home"></i>
          						                    <span class="menu-title">Bodega</span><i class="arrow"></i>
          						                </a>

          						            </li>

																	<li>
          						                <a href="../bodegueros/">
          						                    <i class="fa fa-users"></i>
          						                    <span class="menu-title">Bodegueros</span><i class="arrow"></i>
          						                </a>

          						            </li>

                                  <li class="list-header">Vehículos</li>

                                  <li>
          						                <a href="../vehiculos/">
          						                    <i class="fa fa-car"></i>
          						                    <span class="menu-title">Vehículos</span><i class="arrow"></i>
          						                </a>

          						            </li>

                                  <li>
          						                <a href="../choferes/">
          						                    <i class="fa fa-user"></i>
          						                    <span class="menu-title">Choferes</span><i class="arrow"></i>
          						                </a>

          						            </li>

                                  <li>
          						                <a href="../vehiculosAsignados/">
          						                    <i class="fa fa-car"></i>
          						                    <span class="menu-title">Vehículos Asignados</span><i class="arrow"></i>
          						                </a>

          						            </li>


                                  <li class="list-header">Clientes</li>

                                  <li>
          						                <a href="../clientes/">
          						                    <i class="fa fa-briefcase"></i>
          						                    <span class="menu-title">Clientes</span><i class="arrow"></i>
          						                </a>

          						            </li>

						            </ul>
                    <!--================================-->
                    <!--End menu-->

                </div>
            </nav>
            <!--===================================================-->
            <!--END MAIN NAVIGATION-->

        </div>



        <!-- FOOTER -->
        <!--===================================================-->
        <footer id="footer">

            <!-- Visible when footer positions are fixed -->
            <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
            <div class="show-fixed pad-rgt pull-right">
                You have <a href="#" class="text-main"><span class="badge badge-danger">3</span> pending action.</a>
            </div>






            <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
            <!-- Remove the class "show-fixed" and "hide-fixed" to make the content always appears. -->
            <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

            <p class="pad-lft">&#0169; 2018 David Medina Ortiz, david.medina@cebib.cl</p>



        </footer>
        <!--===================================================-->
        <!-- END FOOTER -->


        <!-- SCROLL PAGE BUTTON -->
        <!--===================================================-->
        <button class="scroll-top btn">
            <i class="pci-chevron chevron-up"></i>
        </button>
        <!--===================================================-->



    </div>
    <!--===================================================-->
    <!-- END OF CONTAINER -->

</body>
</html>
