
$qtSource = "http://download.qt-project.org/official_releases/qt/5.12/5.12.9/submodules/qtbase-everywhere-src-5.12.9.zip"

Invoke-WebRequest -Uri $qtSource -OutFile qt_source.zip

7z x qt_source.zip -oqt_source
