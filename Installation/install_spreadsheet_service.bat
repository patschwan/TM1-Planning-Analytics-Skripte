@echo Installing PA Spreadsheet Service...

:: IBM Doku https://www.ibm.com/docs/en/planning-analytics/2.0.0?topic=windows-configure-run-unattended-tm1-web-installations

unzip C:\Install\tm1web-11.0.79-22081514-winx64h_bundle.zip

:: das response File muss initial per grafischen Installer erstellt werden
:: C:\Install\analytics-installer-3.6.32-win.exe -DREPO="C:\Install\tm1web-11.0.79-22081514-winx64h.zip" -r "C:\Install\pa_ss_response.ats"
:: per CMD starten, Installer durchlaufen (wird auch installiert!) und dann liegt das *.ats File im Verzeichnis
:: not so smarte Lösung, watching at you IBM

C:\Install\analytics-installer-3.6.32-win.exe -DREPO="C:\Install\tm1web-11.0.79-22081514-winx64h.zip" -f "C:\Install\pa_ss_response.ats" -i silent