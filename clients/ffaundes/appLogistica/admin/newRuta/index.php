<?php
	session_start();
  #echo $_SESSION['username'];
  #echo "<br>";
  #echo $_SESSION['idUser'];
  if (!$_SESSION){
	   echo '<script language = javascript>
	    self.location = "../closeConnection"
	    </script>';
  }
?>

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


    <!--DataTables [ OPTIONAL ]-->
    <link href="../plugins/datatables/media/css/dataTables.bootstrap.css" rel="stylesheet">
    <link href="../plugins/datatables/extensions/Responsive/css/responsive.dataTables.min.css" rel="stylesheet">

    <!--Bootstrap Validator [ OPTIONAL ]-->
    <link href="../plugins/bootstrap-validator/bootstrapValidator.min.css" rel="stylesheet">
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
    <link href="../plugins/spinkit/css/spinkit.min.css" rel="stylesheet">
    <script src="../plugins/bootstrap-validator/bootstrapValidator.min.js"></script>

    <!--js para handler de usuario -->
    <script src="../js/ruta/newRuta.js"></script>
    <script src="../js/ruta/loadChoferesOption.js"></script>

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
                                <div class="username hidden-xs">Vista Configuración</div>
                            </a>


                            <div class="dropdown-menu dropdown-menu-md dropdown-menu-right panel-default">

                                <!-- Dropdown footer -->
                                <div class="pad-all text-right">
                                    <a href="../closeConnection" class="btn btn-primary">
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
                      <h1 class="page-header text-overflow">Crear nueva ruta en el sistema</h1>

                  </div>
                  <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                  <!--End page title-->
              </div>


              <!--Page content-->
              <!--===================================================-->
              <div id="page-content">
                <div class="row">
                  <div class="col-sm-12 col-md-12">

                    <div class="panel panel-bordered panel-primary">

                      <div class="panel-heading">
                        <h3 class="panel-title">
                          Completa el Formulario
                        </h3>
                      </div>
                      <div class="panel-body">
                        <form id="newRuta" method="post" class="form-horizontal form-label-left">

                          <div class="form-group">
                             <label class="col-sm-3 control-label">Nombre Ruta*</label>
                              <div class="col-sm-5">
                                  <input type="text" class="form-control" id="nameRuta" name="nameRuta" />
                              </div>
                          </div>

                          <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="jornada">Tipo de Jornada <span class="required">*</span>
                            </label>

                            <div class="col-md-5 col-sm-5 col-xs-12">
                              <select id="jornada" class="form-control">
                                <option>MATUTINA</option>
                                <option>TARDE</option>
                                <option>OTROS</option>
                              </select>
                            </div>
                          </div>

                          <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="chofer">Seleccione Chofer <span class="required">*</span>
                            </label>

                            <div class="col-md-5 col-sm-5 col-xs-12">
                              <div class="selector-chofer">
            										<select id="chofer" class="form-control" required>
            										</select>
            									</div>
                            </div>
                          </div>

                          <div class="ln_solid"></div>

                          <div class="form-group">
                              <div class="col-sm-5 col-sm-offset-3">
                                <button type="submit" id="processRuta" class="btn btn-primary">Crear nueva ruta</button>
                              </div>
                          </div>
                        </form>

                        <div class="col-sm-12 col-md-12 col-lg-12" id="loading" style="display:none;">
                            <div class="panel">
                                <div class="panel-body">
                                    <div class="sk-three-bounce">
                                        <div class="sk-child sk-bounce1"></div>
                                        <div class="sk-child sk-bounce2"></div>
                                        <div class="sk-child sk-bounce3"></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-12 col-md-12 col-lg-12" id="errorResponse" style="display:none;">
                          <div class="alert alert-danger" role="alert">
                            Error durante la creación de la ruta, por favor, revisar los datos. En caso de persistencia, generar un ticket con el bug.
                          </div>
                        </div>

                      </div>
                    </div>
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
                                            <p class="mnp-name">Vista Configuración</p>
                                        </a>
                                    </div>
                                    <div id="profile-nav" class="collapse list-group bg-trans">

                                        <a href="../closeConnection" class="list-group-item">
                                            <i class="demo-pli-unlock icon-lg icon-fw"></i> Salir
                                        </a>

                                        <a href="../../client" class="list-group-item">
                                            <i class="fa fa-user"></i>
                                            <span class="menu-title">Vista Reportes</span><i class="arrow"></i>
                                        </a>

                                    </div>
                                </div>

                                <ul id="mainnav-menu" class="list-group">

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

                                  <li class="list-header">Rutas</li>

                                  <li>
                                      <a href="../newRuta/">
                                          <i class="fa fa-map"></i>
                                          <span class="menu-title">Crear nueva ruta</span><i class="arrow"></i>
                                      </a>

                                  </li>

                                  <li>
                                      <a href="../viewRuta/">
                                          <i class="fa fa-map"></i>
                                          <span class="menu-title">Ver rutas</span><i class="arrow"></i>
                                      </a>

                                  </li>

                                  <li class="list-header">Clientes</li>

                                  <li>
          						                <a href="../clientes/">
          						                    <i class="fa fa-briefcase"></i>
          						                    <span class="menu-title">Clientes</span><i class="arrow"></i>
          						                </a>

          						            </li>

                                  <li class="list-header">Tools</li>

                                  <li>
          						                <a href="../users/">
          						                    <i class="fa fa-user-times"></i>
          						                    <span class="menu-title">Password</span><i class="arrow"></i>
          						                </a>
          						            </li>

                                  <li>
          						                <a href="../pushNotifications/">
          						                    <i class="fa fa-envelope"></i>
          						                    <span class="menu-title">Notificaciones Push</span><i class="arrow"></i>
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

            <p class="pad-lft">&#0169; 2019 David Medina Ortiz, david.medina@cebib.cl</p>



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
