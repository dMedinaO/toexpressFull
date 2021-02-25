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

    <!--Dropzone [ OPTIONAL ]-->
    <script src="../plugins/dropzone/dropzone.min.js"></script>
    <link href="../plugins/dropzone/dropzone.min.css" rel="stylesheet">
    <script src="../js/formatDropzone.js"></script>

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


    <!--DataTables [ OPTIONAL ]-->
    <link href="../plugins/datatables/media/css/dataTables.bootstrap.css" rel="stylesheet">
	  <link href="../plugins/datatables/extensions/Responsive/css/responsive.dataTables.min.css" rel="stylesheet">
    <!--JSTree [ OPTIONAL ]-->
    <link href="../plugins/jstree/themes/default/style.min.css" rel="stylesheet">

    <!--DataTables [ OPTIONAL ]-->
    <script src="../plugins/datatables/media/js/jquery.dataTables.js"></script>
	  <script src="../plugins/datatables/media/js/dataTables.bootstrap.js"></script>
	  <script src="../plugins/datatables/extensions/Responsive/js/dataTables.responsive.min.js"></script>

    <!--js para handler de usuario -->
    <script src="../js/ruta/loadDocumento.js"></script>
    <script src="../js/ruta/loadDetalleRuta.js"></script>

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
                      <h1 class="page-header text-overflow">Información en ruta:
                        <?php
                          echo $_GET['ruta'];
                        ?>
                      </h1>

                  </div>
                  <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                  <!--End page title-->
              </div>


              <!--Page content-->
              <!--===================================================-->
              <div id="page-content">
                <div class="row">
                  <div class="col-sm-12 col-md-12 col-lg-12">

                    <div class="panel panel-bordered panel-primary">

                      <div class="panel-heading">
                        <h3 class="panel-title">
                          Detalle Ruta
                        </h3>
                      </div>
                      <!-- Contact Widget -->
                    <!---------------------------------->
                    <div class="panel pos-rel">
                        <div class="pad-all ">

                            <div class="panel-body">
                              <table class="table table-hover table-vcenter">
                              <tbody>
                                <tr>
                                  <td>
                                    <span class="text-main text-semibold">Nombre Ruta</span>
                                  </td>
                                  <td>
                                    <span class="text-main text-semibold name"></span>
                                  </td>
                                 </tr>

                                  <tr>
                                      <td>
                                        <span class="text-main text-semibold">Fecha Creación</span>
                                      </td>
                                      <td>
                                          <span class="text-main text-semibold Fecha"></span>
                                      </td>
                                  </tr>

                                  <tr>
                                      <td>
                                        <span class="text-main text-semibold">Estado</span>
                                      </td>
                                      <td>
                                          <span class="text-main text-semibold estado"></span>
                                      </td>
                                  </tr>

                                  <tr>
                                      <td>
                                        <span class="text-main text-semibold">Chofer</span>
                                      </td>
                                      <td>
                                          <span class="text-main text-semibold chofer"></span>
                                      </td>
                                  </tr>
                              </tbody>
                            </table>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-sm-12 col-md-12 col-lg-12">
                    <div class="panel">

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
                          Error al cargar los datos, favor revisar el set de datos
                        </div>
                      </div>

                      <div class="col-sm-12 col-md-12 col-lg-12" id="okResponse" style="display:none;">
                        <div class="alert alert-success" role="alert">
                          Carga generada de manera exitosa
                        </div>
                      </div>

                      <div id="demo-custom-toolbar2" class="table-toolbar-left">
                      </div>

                      <div class="panel-body">
                        <table id="rutaDetalle" class="table table-striped table-bordered" cellspacing="0" width="100%">
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

    <!-- modal section -->
    <!-- modal para agregar-->
     <div class="modal fade" id="myModalManual" role="dialog" tabindex="-1" aria-labelledby="demo-default-modal" aria-hidden="true">
         <div class="modal-dialog">
           <div class="modal-content">
             <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
               <h4 class="modal-title" id="myModalLabel">Agregar Nuevo Documento</h4>
             </div>
             <div class="modal-body">
             <form id="frmAgregar" action="" method="POST" data-parsley-validate class="form-horizontal form-label-left">
               <div class="form-group">
                 <label class="control-label col-md-3 col-sm-3 col-xs-12" for="folio">Folio Documento <span class="required">*</span>
                 </label>

                 <div class="col-md-9 col-sm-9 col-xs-12">
                   <input type="text" id="folio" required="required" class="form-control col-md-7 col-xs-12" placeholder="Ingrese Folio documento">
                 </div>
               </div>

               <div class="form-group">
                 <label class="control-label col-md-3 col-sm-3 col-xs-12" for="fechaEmision">Fecha Emisión <span class="required">*</span>
                 </label>

                 <div class="col-md-9 col-sm-9 col-xs-12">
                   <input type="text" id="fechaEmision" required="required" class="form-control col-md-7 col-xs-12" placeholder="Ingrese Fecha: YYYY-MM-DD">
                 </div>
               </div>

               <div class="form-group">
                 <label class="control-label col-md-3 col-sm-3 col-xs-12" for="rut">Ingrese Rut receptor <span class="required">*</span>
                 </label>

                 <div class="col-md-9 col-sm-9 col-xs-12">
                   <input type="text" id="rut" required="required" class="form-control col-md-7 col-xs-12" placeholder="Ingrese rut, sólo numeros, sin digito verificador">
                 </div>
               </div>

               <div class="form-group">
                 <label class="control-label col-md-3 col-sm-3 col-xs-12" for="monto">Ingrese Monto <span class="required">*</span>
                 </label>
                 <div class="col-md-9 col-sm-9 col-xs-12">
                   <input type="text" id="monto" required="required" class="form-control col-md-7 col-xs-12" placeholder="Ingrese monto total">
                 </div>
               </div>

               <div class="form-group">
                 <label class="control-label col-md-3 col-sm-3 col-xs-12" for="tipoDoc">Tipo Documento <span class="required">*</span>
                 </label>

                 <div class="col-md-9 col-sm-9 col-xs-12">
                   <select id="tipoDoc" class="form-control">
                     <option value="33">Factura</option>
                     <option value="52">Guia de Despacho</option>
                     <option value="1">Otros</option>
                   </select>
                 </div>
               </div>


               <div class="ln_solid"></div>

             </div>

             <div class="modal-footer">
               <div class="form-group">
                 <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                   <button type="reset" class="btn btn-primary">Resetear</button>
                   <button type="button" id="agregar-documento" class="btn btn-success" data-dismiss="modal">Aceptar</button>
                   <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                 </div>
               </div>
             </div>
           </div>
         </div>
       </form>
     </div>

     <!-- modal para agregar mediante carga masiva -->
     <div class="modal fade" id="myModalMasiva" role="dialog" tabindex="-1" aria-labelledby="demo-default-modal" aria-hidden="true">
         <div class="modal-dialog">
           <div class="modal-content">
             <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
               <h4 class="modal-title" id="myModalLabel">Carga Masiva</h4>
             </div>
             <div class="modal-body">

               <form id="frmAgregarFile" action="../php/uploadFile.php" class="dropzone" >
                      <div class="dz-default dz-message">
                          <div class="dz-icon">
                              <i class="demo-pli-upload-to-cloud icon-5x"></i>
                          </div>
                          <div>
                            <span class="dz-text">Arrastra tu archivo aquí!</span>
                            <p class="text-sm text-muted">Has click para hacerlo de manera manual</p>
                          </div>
                      </div>
                      <div class="fallback">
                          <input name="file" type="file" multiple>
                      </div>
                  </form>
                  <br>
                  <br>


             <form id="frmAgregarMasiva" action="" method="POST" data-parsley-validate class="form-horizontal form-label-left">

               <div class="ln_solid"></div>

             </div>

             <div class="modal-footer">
               <div class="form-group">
                 <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                   <button type="reset" class="btn btn-primary">Resetear</button>
                   <button type="button" id="agregar-masiva" class="btn btn-success" data-dismiss="modal">Aceptar</button>
                   <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                 </div>
               </div>
             </div>
           </div>
         </div>
       </form>
     </div>

     <!-- modal para eliminar -->
     <div>
       <form id="frmEliminar" action="" method="POST">
         <input type="hidden" id="iddocumento" name="iddocumento" value="">
         <!-- Modal -->
         <div class="modal fade" id="modalEliminar" tabindex="-1" role="dialog" aria-labelledby="modalEliminarLabel">
           <div class="modal-dialog" role="document">
             <div class="modal-content">
               <div class="modal-header">
                 <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                 <h4 class="modal-title" id="modalEliminarLabel">Eliminar Documento</h4>
               </div>
               <div class="modal-body">
                 ¿Está seguro de eliminar el documento seleccionado?<strong data-name=""></strong>
               </div>
               <div class="modal-footer">
                 <button type="button" id="eliminar-documento" class="btn btn-primary" data-dismiss="modal">Aceptar</button>
                 <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
               </div>
             </div>
           </div>
         </div>
         <!-- Modal -->
       </form>
     </div>

     <!-- modal para editar un nuevo elemento -->
     <div>
     	<form id="frmEditar" action="" method="POST" data-parsley-validate class="form-horizontal form-label-left">
     		<input type="hidden" id="iddocumento" name="iddocumento" value="">
     		<div class="modal fade" id="myModalEditar" tabindex="-1" role="dialog" aria-labelledby="myModalLabelEdit" aria-hidden="true">
     				<div class="modal-dialog">
     					<div class="modal-content">
     						<div class="modal-header">
     							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
     							<h4 class="modal-title" id="myModalLabelEdit">Editar Documento Seleccionado</h4>
     						</div>
     						<div class="modal-body">

                  <div class="form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="folio">Folio Documento <span class="required">*</span>
                    </label>

                    <div class="col-md-9 col-sm-9 col-xs-12">
                      <input type="text" id="folio" required="required" class="form-control col-md-7 col-xs-12" placeholder="Ingrese Folio documento">
                    </div>
                  </div>

                  <div class="form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="fechaEmision">Fecha Emisión <span class="required">*</span>
                    </label>

                    <div class="col-md-9 col-sm-9 col-xs-12">
                      <input type="text" id="fechaEmision" required="required" class="form-control col-md-7 col-xs-12" placeholder="Ingrese Fecha: YYYY-MM-DD">
                    </div>
                  </div>

                  <div class="form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="monto">Ingrese Monto <span class="required">*</span>
                    </label>
                    <div class="col-md-9 col-sm-9 col-xs-12">
                      <input type="text" id="monto" required="required" class="form-control col-md-7 col-xs-12" placeholder="Ingrese monto total">
                    </div>
                  </div>

     						  <div class="ln_solid"></div>
     						  <div class="form-group">
       							<div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
       								<button type="reset" class="btn btn-primary">Resetear</button>
       								<button type="button" id="editar-documento" class="btn btn-success" data-dismiss="modal">Editar</button>
       								<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
       							</div>
     						  </div>

     						</div>

     					</div>
     				</div>
          </form>
     		</div>
     </div>
  </body>
</html>
