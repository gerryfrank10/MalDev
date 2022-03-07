@echo off

cl.exe /nologo /Ox /MT /W0 /GS- /DNDEBUG /TcMalDev.cpp /link /OUT:MalDev.exe /SUBSYSTEM:CONSOLE /MACHINE:x64