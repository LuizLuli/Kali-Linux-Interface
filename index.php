<!DOCTYPE html>
<html>
  <?php 
  	include("assets/includes/head.php"); 
  ?>
<body>
	<?php
		include("assets/includes/header.php")
	?>

	<!-- Page content -->
    <div class="container-fluid mt--7">
      <!-- Table -->
      <div class="row">
        <div class="col">
          	<div class="card shadow">
	            <div class="card-header bg-transparent">
	              <h2 class="mb-0">Home</h2>
	            </div>

                <div class="card-body">
                	<div class="row">



                  <div class="col-xl-6 col-lg-6">
                    <div class="card card-stats">
                      <div class="card-body">
                        <div class="row">
                          <div class="col">
                            <h5 class="card-title text-uppercase text-muted mb-0">Ferramentas disponíveis</h5>
                            <span class="h3 font-weight-bold mb-0">

                            	<?php
                            		$con = getConnectionDB() or die ("Could not connect to database.");
      					                $sql = $con->prepare("SELECT * FROM tools WHERE released = 'Yes'");
      					                $sql->execute();

                            		echo $sql->rowCount();
                            	?>

                             FERRAMENTAS</span>
                          </div>
                          <div class="col-auto">
                            <div class="icon icon-shape bg-default text-white rounded-circle shadow">
                              <i class="ni ni-bullet-list-67"></i>
                            </div>
                          </div>
                        </div>
                        <p class="mt-3 mb-0 text-muted text-sm">
                        </p>

                    <a href="tools-list.php" class="btn btn-success">Ver todas</a>
                      </div>
                    </div>
                  </div>



                  <div class="col-xl-6 col-lg-6">
                    <div class="card card-stats">
                      <div class="card-body">
                        <div class="row">
                          <div class="col">
                            <h5 class="card-title text-uppercase text-muted mb-0">Relatórios</h5>
                            <span class="h3 font-weight-bold mb-0">
                              <?php
                                $con = getConnectionDB() or die ("Could not connect to database.");
                                $sql = $con->prepare("SELECT * FROM reports");
                                $sql->execute();

                                echo $sql->rowCount();
                              ?>


                            RELATÓRIOS</span>
                          </div>
                          <div class="col-auto">
                            <div class="icon icon-shape bg-yellow text-white rounded-circle shadow">
                              <i class="ni ni-single-copy-04"></i>
                            </div>
                          </div>
                        </div>
                        <p class="mt-3 mb-0 text-muted text-sm">
                        </p>

                    <a href="reports.php" class="btn btn-danger">Ver todos</a>
                      </div>
                    </div>
                  </div>





	</div>
</div>













							<?php
								// $ssh = getConnectionSSH();
								//echo $ssh->exec('');
								
							?>
					
				</div>
			</div>
		</div>
	<?php
		include("assets/includes/footer.php")
	?>
</body>
</html>