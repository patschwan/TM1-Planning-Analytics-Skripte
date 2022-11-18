:: Ordnerstruktur TM1 Modell auf Windows Server erstellen
:: per CMD <path_to_bat>/mkdir_TM1Model.bat <NAME TM1 Model> ausführen

set TM1MODEL=%1
mkdir "C:\TM1_Models\%TM1MODEL%\01_Data"
mkdir "C:\TM1_Models\%TM1MODEL%\02_Logging"
mkdir "C:\TM1_Models\%TM1MODEL%\03_Configuration"
mkdir "C:\TM1_Models\%TM1MODEL%\04_Import"
mkdir "C:\TM1_Models\%TM1MODEL%\05_Export"
mkdir "C:\TM1_Models\%TM1MODEL%\13_Backups"
:: ja, Backup hat die 13 ;-)