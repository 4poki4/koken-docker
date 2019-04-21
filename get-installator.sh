#!/bin/bash
wget https://s3.amazonaws.com/koken-installer/releases/Koken_Installer.zip -O Koken_Installer.zip
unzip Koken_Installer.zip -d html/ && rm Koken_Installer.zip
mv html/koken/index.php html/koken/index1.php && cat html/koken/index1.php | sed "s/loopback\['fail'\]/loopback\['true'\]/g" > html/koken/index.php && rm html/koken/index1.php 
chmod -R 777 html/koken
