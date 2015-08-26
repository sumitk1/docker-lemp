<?php

$docker = exec("cat /proc/self/cgroup | grep 'docker' | sed 's/^.*\///' | tail -n1");

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Simple PHP App</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <style>body {margin-top: 40px; background-color: #333;}</style>
    <link href="assets/css/bootstrap-responsive.min.css" rel="stylesheet">
    <!--[if lt IE 9]><script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
</head>

<body>
<div class="container">
    <div class="hero-unit">
        <h1>Simple PHP App</h1>
        <h2>Congratulations</h2>
        <p>Your PHP application is now running on a container in Docker!</p>
        <p>The container is running PHP version <?php echo phpversion(); ?>.</p>
        <?php
        echo "<p>----- ContainerID = " . $docker . " -----</p>";
        ?>

    </div>
</div>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>

</html>
