## Verwendung

### Vorbereitung

- Man benötigt 2 Speichermedien:
    1. Das Boot-Medium mit dem LiveCD Image (sollte read-only sein, z.B. CD-ROM), und
    2. ein beschreibbares Medium, groß genug für ein Docker image und Arbeitsdateien. Empfohlene Größe 8GB oder mehr.
- Das Boot-Medium muss mit der live-CD ISO-Image bespielt werden (siehe README)
- Das beschreibbare Medium wird mit einem Linux Filesystem, z.B. ext4 formatiert. Um es erkennbar zu machen,
  wird im Wurzelverzeichnis eine leere Datei 'UseMe4DockerData' erstellt. Das kann zum Beispiel wie folgt
  gemacht werden. Zuerst stellt man den Device-PFad fest, etwa mit `tail dmesg` ngleich nachdem der USB flash drive 
  eingesteckt wird, oder mit `df -hT` wenn ein FAT-Filesystem vorhanden ist und gemountet wurde. Wenn das Medium
  unter /dev/sdb1 gelistet wird, kann es mit folgenden Befehlen im Terminal eingerichtet werden:
    
    mkfs.vfat /dev/sdb1
    mount /dev/sdb1  /mnt
    touch /mnt/UseMe4DockerData

### Start
- Beide Medien an den PV anstecken
- Vom Boot-Medium starten - dazu muss man meistens die Boot-Reiehenfolge im BIOS ändern
- Warten bis das System gestartet ist
- Beim ersten Start und im Fall eines Updates muss das Docker Image aus dem Netz geladen werden, die Größe beträgt rund 1GB.