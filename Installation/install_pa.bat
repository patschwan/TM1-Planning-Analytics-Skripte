@echo Installing Planning Analytics...

:: install e.g. 7zip
:: entpacke C:\Install\tm1_winx64h_2.0.914.2_ml.tar.gz
:: entpacke C:\Install\tm1_winx64h_2.0.914.2_ml.tar\tm1_winx64h_2.0.914.2_ml.tar.gz
:: cd C:\Install\tm1_winx64h_2.0.914.2_ml.tar\tm1_winx64h_2.0.914.2_ml\winx64h
:: edit reC:\Install\tm1_winx64h_2.0.914.2_ml.tar\tm1_winx64h_2.0.914.2_ml\winx64h\response.ats wie auf den übrigen (kopieren)

:: unattended IBM Installation https:\\www.ibm.com\docs\en\planning-analytics\2.0.0?topic=configurations-set-up-unattended-installation-cognos-components
:: C:\app\ibm\cognos\tm1_64\instlog hier das *.ats File anpassen
:: <install dir>\issetup -s location\filename.ats

MKDIR "C:\app\ibm\cognos\tm1_64"
C:\Install\tm1_winx64h_2.0.914.2_ml.tar\tm1_winx64h_2.0.914.2_ml\winx64h\issetup -s C:\Install\tm1_winx64h_2.0.914.2_ml.tar\tm1_winx64h_2.0.914.2_ml\winx64h\response.ats

@echo IBM Installation abgeschlossen