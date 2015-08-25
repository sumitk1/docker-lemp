<?php

$docker = exec("cat /proc/self/cgroup | grep 'docker' | sed 's/^.*\///' | tail -n1");

echo "----- " . $docker . " ----fffff-";