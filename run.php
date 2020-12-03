<?php
	session_start();
	$host = $_SESSION["host"];
	$user = $_SESSION["user"];
	$password = $_SESSION["password"];

	// Set time limit to PHP(seconds)
	set_time_limit(99999);

	$command = $_POST['command'];
	$target = $_POST['target'];
	$arrayInputs = $_POST['arrayInputs'];
	$arrayCheckbox = $_POST['arrayCheckbox'];
	
	$cmd = "";

	set_include_path('assets/libraries/phpseclib/');
	include('Net/SSH2.php');
	include('assets/includes/config.php');

	$ssh = new Net_SSH2($host);
	
	if (!$ssh->login($user, $password)) {
			echo 
				"<div class='alert alert-danger alert-dismissible fade fade.in show' role='alert' style='position: fixed; z-index: 2; bottom: 0; right: 0; width: 40%;'>
 			   		<span class='alert-inner--icon'><i class='ni ni-fat-remove'></i></span>
    				<span class='alert-inner--text'><strong>Erro!</strong> Falha na conexão com o sistema operacional!</span>
    				<button type='button' class='close' data-dismiss='alert' aria-label='Close'>
        				<span aria-hidden='true'>&times;</span>
    				</button>
				</div>";
	} else {

		// Get all the inputs firt
		for ($i = 0; sizeof($arrayInputs) > $i; $i++) {
			$cmd = $cmd . " " . $arrayInputs[$i][0] . " " . $arrayInputs[$i][1];
		}

		for ($i = 0; sizeof($arrayCheckbox) > $i; $i++) {
			$cmd = $cmd . " " . $arrayCheckbox[$i];
		}

		$run = $command . " " . $cmd . " " . $target;



        echo "<div class='row align-items-center'>
            
                  <div class='col-xl-6'>
                    <div class='card card-stats zoom-effect'>
                      <div class='card-body'>
                        <div class='row'>
                          <div class='col'>
                            <h5 class='card-title text-uppercase text-muted mb-0'>Solução de problemas</h5>
                            <span class='h3 font-weight-bold mb-0'><br>Confira quais procedimentos seguir nesse tipo de caso.</span>
                          </div>
                          <div class='col-auto'>
                            <div class='icon icon-shape bg-info text-white rounded-circle shadow'>
                              <i class='ni ni-settings-gear-65'></i>
                            </div>
                          </div>
                        </div>
                        <p class='mt-3 mb-0 text-muted text-sm'>
                        </p>

                    <a href='#solution' data-toggle='collapse' class='btn btn-danger'><i class='ni ni-check-bold'></i> Diagnóstico</a>
                      </div>
                    </div>
                  </div>

                  <div class='col-xl-6' id='reports-card'>
                    <div class='card card-stats zoom-effect'>
                      <div class='card-body'>
                        <div class='row'>
                          <div class='col'>
                            <h5 class='card-title text-uppercase text-muted mb-0'>Salvar em relatórios</h5>
                            <span class='h3 font-weight-bold mb-0'>
                              <input id='report-name' type='text' class='form-control form-control-alternative' name='report-name' required placeholder='Escolha um nome para este relatório'>
                             </span>
                          </div>
                          <div class='col-auto'>
                            <div class='icon icon-shape bg-yellow text-white rounded-circle shadow'>
                              <i class='ni ni-single-copy-04'></i>
                            </div>
                          </div>
                        </div>
                        <p class='mt-3 mb-0 text-muted text-sm'>
                        </p>
                          <input id='command-executed' hidden value='".$run."'></input>
                        <button class='btn btn-success' onclick='save()'><i class='ni ni-single-copy-04'></i> Salvar em relatórios</button>
                      </div>
                    </div>
                  </div>
            </div>

            <center>
              <hr style='background-color: white; width: 100px'>  
            </center>

    ";


    echo "<style='color: white'>O seguinte comando foi executado: <b>" . $run . "</b><br><br>";



		
		$ssh->setTimeout(0);
		echo "<textarea id='test' style='width: 100%; height:768px; border:10px solid white; border-radius:10px;'>";
		$ssh->exec("echo $password | sudo -S " . $run, 'packet_handler');
    echo "</textarea>";

		echo
		"<div id='output' class='alert alert-success alert-dismissible fade show' role='alert' style='position: fixed; z-index: 2; bottom: 0; right: 0; width: 40%;'>
		   	<span class='alert-inner--icon'><i class='ni ni-fat-checked'></i></span>
			<span class='alert-inner--text'><strong>Sucesso!</strong> 
Comando executado com sucesso.</span>
			
			<button type='button' class='close' data-dismiss='alert' aria-label='Close'>
				<span aria-hidden='true'>&times;</span>
			</button>
		</div>";
	}

	function packet_handler($str) {
		//echo  '<pre id="full_output" style="color: white">' . $str . '</pre>';
    //echo "<textarea>".$str."</textarea>";
		echo $str;
    flush();
		ob_flush();
	}
?>
