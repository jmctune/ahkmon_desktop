@echo off
"C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe" /in "ahkmon_desktop.ahk" /icon "imgs/dqx.ico"
"C:\Program Files\7-Zip\7z.exe" a -tzip ahkmon_desktop.zip ./imgs ahkmon_desktop.exe dqxtrl.db sqlite3.dll