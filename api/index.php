<?php
if (isset($_SERVER['HTTP_ORIGIN'])) {
    header("Access-Control-Allow-Origin: {$_SERVER['HTTP_ORIGIN']}");
    header('Access-Control-Allow-Credentials: true');
    header('Access-Control-Max-Age: 86400');    // cache for 1 day
}

// Access-Control headers are received during OPTIONS requests
if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {

    if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_METHOD']))
        header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");         

    if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']))
        header("Access-Control-Allow-Headers: {$_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']}");

    exit(0);
}
//header('Access-Control-Allow-Origin: *');
//header('Access-Control-Allow-Methods: GET, POST');
//header('Access-Control-Allow-Headers: X-Requested-With');
//header('Access-Control-Allow-Headers: Content-Type');

/* Require Slim and plugins */
require 'Slim/Slim.php';
require 'plugins/NotORM.php';

/* Register autoloader and instantiate Slim */
\Slim\Slim::registerAutoloader();
$app = new \Slim\Slim();

/* Database Configuration */
$dbhost   = 'yourhostname';
$dbuser   = 'yourusername';
$dbpass   = 'yourpassword';
$dbname   = 'yourdbname'; // in this case -> stw
$dbmethod = 'mysql:dbname=';

$pdo = new PDO('mysql:host='.$dbhost.';dbname='.$dbname,$dbuser,$dbpass, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));

$db  = new NotORM($pdo);

$chemin    = 'http://yourwebsite.com/ionic-angularjs-stw/';
$cheminPic = '../bands/';

/* Routes */

// Home route
$app->get('/', function(){
    echo 'Home - ionic angularjs bands';
});


// Get all bands
$app->get('/bands', function() use($app, $db, $chemin){
    $bands = array();
    foreach ($db->artiste() as $band) {
        
        $source = $chemin.'bands/'.$band['id'].'/img/1.jpg';
        
        $bands[]  = array(
            'id'         => $band['id'],
            'title'      => $band['title'],
            'pays'       => $band['pays'],
            'source'     => $source,
            'published'  => $band['published']
        );
    
    }

    $app->response()->header("Content-Type", "application/json");
    //echo json_encode($bands, JSON_FORCE_OBJECT);
    //echo "[".json_encode($bands, JSON_FORCE_OBJECT)."]";
    echo json_encode($bands);
});

// Get a single band
$app->get('/bands/:id', function($id) use ($app, $db, $chemin) {
    $mp3 = array();
    $app->response()->header("Content-Type", "application/json");
    $band = $db->artiste()->where('id', $id);
    if($data = $band->fetch()){
        
        $source = $chemin.'bands/'.$id.'/img/1.jpg';
        $mp = $db->morceaux()->where('pid',$id);

        foreach ($mp as $data_mp) {
            $mp3[] = array(
                'id'    => $data_mp['id'], 
                'title' => $data_mp['title']
            );
        }
        echo json_encode(array(
            'id'          => $data['id'],
            'title'       => $data['title'],
            'pays'        => $data['pays'],
            'description' => $data['description'],
            'source'      => $source,
            'url'         => $data['AdresseUrl'],
            'mp'          => $mp3,
            'published'   => $data['published']
        ));
    }
    else{
        echo json_encode(array(
            'status'     => false,
            'message'    => "band ID $id does not exist"
        ));
    }
});

/* track from band */
$app->get('/tracks/:id', function($id) use ($app, $db, $chemin) {
    $mp3 = array();
    $app->response()->header("Content-Type", "application/json");
    
    $track = $db->morceaux()->where('pid',$id)->where('published','1');
    if($data = $track->fetch()){ 
        foreach ($track as $data_track) {
            $mp3[] = array(
                'id'    => $data_track['id'], 
                'title' => $data_track['title'],
                'url'   => $chemin.'bands/'.$id.'/mp3/'.$data_track['numero_piste'].'.mp3'
            );
        }
        echo json_encode($mp3);
    }
    else{
        echo json_encode($mp3);
        /*echo json_encode(array(
            'status'     => false,
            'message'    => "there is no track for band $id"
        ));*/
    }
});

/* gallery band */
$app->get('/gallery/:id', function($id) use ($app, $db, $cheminPic) {
    $files = array();  
    $dirname = $cheminPic.$id.'/img';   
    if (is_dir( $dirname)){ 
        $images = scandir($dirname);
        $ignore = Array(".", "..");

        if ($images) { 
            $i = 0;
            foreach($images as $curimg){ 
                if (!in_array($curimg, $ignore)) { 
                    $i++;
                    $files[] = array(
                                'id'  => $i,
                                'src' => $dirname.'/'.$curimg
                            );
                }
            };
            $app->response()->header("Content-Type", "application/json");
            // echo json_encode($files, JSON_UNESCAPED_SLASHES);
            echo json_encode($files);
           
        } else {
            //echo "Aucune image";
            echo json_encode(array(
                    "status"  => false,
                    "message" => "Picture band id $id does not exist"
                ));
        }
    } else {
        //echo "Aucune image";
        echo json_encode(array(
                "status"  => false,
                "message" => $dirname." Picture directory does not exist"
            ));
    }

});


/* Run the application */
$app->run();