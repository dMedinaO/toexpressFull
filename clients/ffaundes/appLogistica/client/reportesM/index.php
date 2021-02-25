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

    <!-- para los higcharts-->
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/series-label.js"></script>

    <script src="https://cdn.plot.ly/plotly-latest.min.js"></script>

    <script src="../js/reportesM/loadDataPanel.js"></script>
    <script src="../js/reportesM/loadDataTableReports.js"></script>
    <script src="../js/reportesM/loadBarChart.js"></script>
    <script src="../js/reportesM/loadPieChart.js"></script>
    <script src="../js/reportesM/loadLineChart.js"></script>

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
                                <div class="username hidden-xs">Vista Reportes</div>
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
                      <h1 class="page-header text-overflow">Reporte Mensual</h1>

                  </div>
                  <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                  <!--End page title-->
              </div>


              <!--Page content-->
              <!--===================================================-->
              <div id="page-content">

                <div class="row">

                  <div class="col-lg-3 col-md-3">
                    <div class="panel media middle pad-all">
                        <div class="media-left">
                            <span class="icon-wrap icon-wrap-sm icon-circle bg-success">
                            <i class="fa fa-file fa-2x"></i>
                            </span>
                        </div>
                        <div class="media-body">
                            <p class="text-2x mar-no text-semibold text-main panel1"></p>
                            <p class="text-muted mar-no">Rutas Generadas</p>
                        </div>
                    </div>
                  </div>
                  <div class="col-lg-3 col-md-3">
                    <div class="panel media middle pad-all">
                        <div class="media-left">
                            <span class="icon-wrap icon-wrap-sm icon-circle bg-success">
                            <i class="fa fa-car fa-2x"></i>
                            </span>
                        </div>
                        <div class="media-body">
                            <p class="text-2x mar-no text-semibold text-main panel2"></p>
                            <p class="text-muted mar-no">Documentos Entregados</p>
                        </div>
                    </div>
                  </div>
                  <div class="col-lg-3 col-md-3">
                    <div class="panel media middle pad-all">
                        <div class="media-left">
                            <span class="icon-wrap icon-wrap-sm icon-circle bg-success">
                            <i class="fa fa-archive fa-2x"></i>
                            </span>
                        </div>
                        <div class="media-body">
                            <p class="text-2x mar-no text-semibold text-main panel3"></p>
                            <p class="text-muted mar-no">Rutas de Emergencia</p>
                        </div>
                    </div>
                  </div>
                  <div class="col-lg-3 col-md-3">
                    <div class="panel media middle pad-all">
                        <div class="media-left">
                            <span class="icon-wrap icon-wrap-sm icon-circle bg-success">
                            <i class="fa fa-smile-o fa-2x"></i>
                            </span>
                        </div>
                        <div class="media-body">
                            <p class="text-2x mar-no text-semibold text-main panel4"></p>
                            <p class="text-muted mar-no">Comentarios Positivos</p>
                        </div>
                    </div>
                  </div>
                </div>

                <div class="row">
                  <div class="col-sm-6 col-md-6 col-lg-6">
                    <div class="panel">
                      <div class="panel-heading">
                        <h3 class="panel-title">Comentarios Recibidos</h3>
                      </div>
                      <div class="panel-body">
                        <div id="negativeComment">
                        </div>
                      </div>
                    </div>
                  </div>

                  <div class="col-sm-6 col-md-6 col-lg-6">
                    <div class="panel">
                      <div class="panel-heading">
                        <h3 class="panel-title">Distribución de documentos por tipo de ruta</h3>
                      </div>
                      <div class="panel-body">
                        <div id="barChart">
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="row">
                  <div class="col-sm-12 col-md-12 col-lg-12">
                    <div class="panel">
                      <div class="panel-heading">
                        <h3 class="panel-title">Documentos procesados por cliente</h3>
                      </div>
                      <div class="panel-body">
                        <div id="documentProcess">
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="row">
                  <div class="col-sm-12 col-md-12 col-lg-12">
                    <div class="panel">
                      <div class="panel-heading">
                        <h3 class="panel-title">Rutas Generadas</h3>
                      </div>
                      <div class="panel-body">
                        <table id="rutaData" class="table table-striped table-bordered" cellspacing="0" width="100%">
                          <thead>
                            <tr>
                              <th class="min-tablet">Nombre Ruta</th>
                              <th class="min-tablet">Tipo Jornada</th>
                              <th class="min-tablet">Fecha Inicio</th>
                              <th class="min-tablet">Fecha Término</th>
                              <th class="min-tablet">Chofer</th>
                              </tr>
                            </thead>
                          </table>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="row">
                  <div class="col-sm-12 col-md-12 col-lg-12">
                    <div class="panel">
                      <div class="panel-heading">
                        <h3 class="panel-title">Documentos Pendientes</h3>
                      </div>
                      <div class="panel-body">
                        <table id="documentosPendientes" class="table table-striped table-bordered" cellspacing="0" width="100%">
                          <thead>
                            <tr>
                              <th class="min-tablet">Cliente</th>
                              <th class="min-tablet">Rut Cliente</th>
                              <th class="min-tablet">Tipo Documento</th>
                              <th class="min-tablet">Folio</th>
                              <th class="min-tablet">Fecha Emisión</th>
                              <th class="min-tablet">Monto</th>
                              </tr>
                            </thead>
                          </table>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="row">
                  <div class="col-sm-12 col-md-12 col-lg-12">
                    <div class="panel">
                      <div class="panel-heading">
                        <h3 class="panel-title">Documentos Entregados</h3>
                      </div>
                      <div class="panel-body">
                        <table id="documentosFinales" class="table table-striped table-bordered" cellspacing="0" width="100%">
                          <thead>
                            <tr>
                              <th class="min-tablet">Cliente</th>
                              <th class="min-tablet">Folio</th>
                              <th class="min-tablet">Recibido por</th>
                              <th class="min-tablet">Estado</th>
                              <th class="min-tablet">Comentario</th>
                              </tr>
                            </thead>
                          </table>
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
                                            <p class="mnp-name">Vista Reportes</p>
                                        </a>
                                    </div>
                                    <div id="profile-nav" class="collapse list-group bg-trans">

                                      <a href="../closeConnection" class="list-group-item">
                                          <i class="demo-pli-unlock icon-lg icon-fw"></i> Salir
                                      </a>

                                      <a href="../../admin" class="list-group-item">
                                          <i class="fa fa-user"></i>
                                          <span class="menu-title">Vista Configuración</span><i class="arrow"></i>
                                      </a>
                                    </div>
                                </div>

                                <ul id="mainnav-menu" class="list-group">

          						            <!--Category name-->
          						            <li class="list-header">Mi Información</li>

																	<li>
          						                <a href="../profile/">
          						                    <i class="fa fa-user"></i>
          						                    <span class="menu-title">Mi Perfil</span><i class="arrow"></i>
          						                </a>

          						            </li>

                                  <li>
          						                <a href="../sucursales/">
          						                    <i class="fa fa-institution"></i>
          						                    <span class="menu-title">Mis Sucursales</span><i class="arrow"></i>
          						                </a>

          						            </li>

                                  <li class="list-header">Rutas y Documentos</li>

                                  <li>
          						                <a href="../rutasI/">
          						                    <i class="fa fa-file"></i>
          						                    <span class="menu-title">Rutas Iniciadas</span><i class="arrow"></i>
          						                </a>

          						            </li>

																	<li>
          						                <a href="../rutasP/">
          						                    <i class="fa fa-map"></i>
          						                    <span class="menu-title">Rutas Pendientes</span><i class="arrow"></i>
          						                </a>

          						            </li>

                                  <li>
          						                <a href="../rutasF/">
          						                    <i class="fa fa-car"></i>
          						                    <span class="menu-title">Rutas Finalizadas</span><i class="arrow"></i>
          						                </a>

          						            </li>

                                  <li class="list-header">Reportes</li>

                                  <li>
                                      <a href="../reportesD/">
                                          <i class="fa fa-file"></i>
                                          <span class="menu-title">Reportes Diarios</span><i class="arrow"></i>
                                      </a>

                                  </li>

                                  <li>
                                      <a href="../reportesM/">
                                          <i class="fa fa-file"></i>
                                          <span class="menu-title">Reporte Mensual</span><i class="arrow"></i>
                                      </a>

                                  </li>

                                  <li>
                                      <a href="../reportesF/">
                                          <i class="fa fa-file"></i>
                                          <span class="menu-title">Reporte Full</span><i class="arrow"></i>
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
