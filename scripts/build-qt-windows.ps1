
$qtSource = "http://download.qt-project.org/official_releases/qt/5.15/5.15.0/submodules/qtbase-everywhere-src-5.15.0.zip"
$qtSourceFolder = "qtbase-everywhere-src-5.15.0"

Invoke-WebRequest -Uri $qtSource -OutFile qt_source.zip

7z x qt_source.zip -oqt_source

qt_source/$qt_sourceFolder/configure --help
