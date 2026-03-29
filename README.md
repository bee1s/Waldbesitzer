# \# Deployment Guide: Oracle \& APEX Projekt (Waldbesitzer)

Dieses Repository enthält einen automatisierten Workflow für das Deployment einer Oracle APEX Applikation inkl. Datenbank-Objekten und Daten-Synchronisation zwischen Entwicklungs- (Quelle) und Zielsystem.



#### 🛠 Voraussetzungen

SQLcl (Version 21c oder neuer) auf der Quellmaschine.

Netzwerkverbindung zwischen Quellsystem (z.B. MINIPC2022) und Zielsystem (Notebook19).

Database Link auf dem Zielsystem, der auf die Quelle zeigt:

sql

CREATE DATABASE LINK minipc\_link CONNECT TO wg IDENTIFIED BY passwort

USING '(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=MINIPC2022)(PORT=1521))(CONNECT\_DATA=(SERVICE\_NAME=XEPDB1)))';

Verwende Code mit Vorsicht.



#### 📂 Repository Struktur

/apex: Enthält den Split-Export der APEX-App (fxxx.sql zerlegt in Einzeldateien).

***deploy.sql***: Das zentrale Master-Skript im Hauptverzeichnis.

***run\_deployment.bat***: Windows-Batch zum Starten des Prozesses im Verzeichnis "C:\\Git\\WALDBESITZER\\scripts".

🚀 Deployment-Schritte



#### 1\. Vorbereitung (Entwicklungsmaschine)

Stelle sicher, dass alle Änderungen in Git eingecheckt sind. Exportiere die APEX-App mit SQLcl im Split-Format, um Code-Reviews zu ermöglichen:

apex export -applicationid 101 -split



##### 1.1 Export- Prozess mit PowerShell

###### **--Powershell in Git- Projektverzeichnis starten (pwsh)**

###### **--SQLcL Anmeldung**

sql -thin user/lido@localhost:1521/XEPDB1



###### **--Export starten**

**---Projekt -->** HAUSHALTSBUCH

apex export -applicationid 1206 -split -dir "C:\\Git\\HAUSHALTSBUCH\\apex\\app\_1206\\export"



**---Projekt** **-->** WALDBESITZER

apex export -applicationid 101 -split -dir "C:\\Git\\WALDBESITZER\\apex\\app\_101\\export"



###### **--SQLcL Abmeldung**

exit



###### **--Export DB- Schema manuell über "Generate DDL" (APEX- Utilities)**

\--Struktur (Dateinamen der Exportdateien):

function.sql, procedures.sql, views.sql, packages.sql, sequences.sql, tables.sql, dblinks.sql





#### 2\. Ausführung des Deployments

Starte die run\_deployment.bat. Diese führt folgende Schritte auf dem Zielsystem aus:



##### a. Schema-Installation (DDL)

Nutzt PL/SQL-Wrapper (BEGIN EXECUTE IMMEDIATE ... EXCEPTION WHEN OTHERS THEN IF SQLCODE = -955 THEN NULL; ... END;).

Verhindert Fehler, wenn Tabellen oder Sequences bereits existieren.



##### b. Daten-Synchronisation (DML)

Deaktiviert alle Foreign Key Constraints (erlaubt Import in beliebiger Reihenfolge).

Deaktiviert alle Trigger um zu verhindern das Originaldaten, Zeitstempel etc. überschrieben werden.

Führt einen TRUNCATE ... DROP STORAGE auf alle Tabellen aus.

Zieht Daten via INSERT INTO ... SELECT \* FROM ...@minipc\_link.

Korrigiert Identity Columns (MODIFY ID RESTART START WITH ...), damit APEX-Sequenzen synchron bleiben.

Reaktiviert alle Constraints.

Reaktiviert alle Trigger.



##### c. APEX-App Installation

Setzt Workspace und Schema via apex\_application\_install.

Nutzt SET DEFINE OFF, um interaktive Abfragen (p\_flow\_id) zu unterdrücken.

Importiert die Applikation vollautomatisch.



#### 📝 Wichtige Hinweise \& Troubleshooting

Identity Spalten: Das Sync-Skript sucht standardmäßig nach der Spalte ID. Falls Primärschlüssel anders benannt sind, muss der PL/SQL-Block in der deploy.sql angepasst werden.

ORA-02298: Tritt dieser Fehler beim Aktivieren der Constraints auf, existieren "Waisenkinder" (Dateninkonsistenz) auf dem Quellsystem. Diese müssen dort bereinigt werden.

Encoding: Bei Umlaut-Problemen in der Batch-Datei chcp 65001 (UTF-8) verwenden.

