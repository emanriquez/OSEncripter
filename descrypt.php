<?php
function pass_encryp() {
	date_default_timezone_set('UTC');
	$secret_iv = "secreto_privado";
	return $secret_iv;
}
	
function encrypt_decrypt($action, $string) {
    $output = false;
	date_default_timezone_set('UTC');

    $encrypt_method = "aes-256-cbc";
    $secret_key = 'secreto_privado';
    $secret_iv = date(Y)."-".date("m")."-".date(d);
    $key = hash('sha256', $secret_key);
    $iv = substr(hash('sha256', $secret_iv), 0, 16);


    if( $action == 'encrypt' ) {
        $output = openssl_encrypt($string, $encrypt_method, $key, 0, $iv);
		//echo "OPENSSL: ".$output."<br>";
        $output = base64_encode($output);
    }
    else if( $action == 'decrypt' ){
        $output = openssl_decrypt(base64_decode($string), $encrypt_method, $key, 0, $iv);
    }

    return $output;
}

?>