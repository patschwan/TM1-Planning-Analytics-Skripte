:: unattended install Cognos Analytics 

:: 1) Create response file/welche Komponenten sollen installiert werden https://www.ibm.com/docs/en/cognos-analytics/11.1.0?topic=SSEP7J_11.1.0/com.ibm.swg.ba.cognos.inst_cr_winux.doc/t_c8bi_setupunattendedinstallation.htm#c8bi_SetUpUnattendedInstallation
:: ATTENTION: der Installer startet per CMD und INSTALLIERT! "You do not need to run a full install in order to create a response file. You can launch the install with the -r option and run it until the summary panel, then cancel out of the install. The response properties file will be created once the install exits."
:: C:\Install\CA\ca_srv_win_3.3.18.exe -r “C:\Install\CA\ResponseFile.properties”

:: 2) Installer "silent" starten, wenn File vorhanden 
C:\Install\CA\ca_srv_win_3.3.18.exe -f “C:\Install\CA\ResponseFile.properties” -i silent

:: Mögliche Fehlermeldung des Installers erhalten
:: "If a return status other than zero (0) is returned, check the log files for error messages. Errors are recorded in the install_location\logs directory in a summary error log file. The filename format is tl-product_code-version-yyyymmdd-hhmm_summary-error.txt."
:: echo %errorlevel% 

:: Konfiguration der Installation aus bestehender CA Server Installation
:: https://www.ibm.com/docs/en/cognos-analytics/11.1.0?topic=configuration-use-silent#unatt_cnfg