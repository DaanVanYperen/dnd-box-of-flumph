[Setup]
AppName=Box of Flumph
AppVerName=Box of Flumph
DefaultGroupName=Box of Flumph
DefaultDirName=C:\program files\Box of Flumph\
InternalCompressLevel=max
ShowLanguageDialog=yes
LicenseFile=C:\projects\Redblade\Box of Flumph\Installer\readme.txt
SetupIconFile=C:\projects\Redblade\Box of Flumph\img\flurph.ico

[Files]
Source: ..\src\data\*.*; DestDir: {app}\data; Flags: recursesubdirs
Source: ..\src\BoxOfFlumph.exe; DestDir: {app}
Source: ..\src\ZipDll.dll; DestDir: {app}
[Icons]
Name: {group}\Box of Flumph; Filename: {app}\BoxOfFlumph.exe; WorkingDir: {app}; IconIndex: 0
