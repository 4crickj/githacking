
$qtSource = "http://download.qt-project.org/official_releases/qt/5.12/5.12.9/submodules/qtbase-everywhere-src-5.12.9.zip"
$qtSourceZipName = "qtbase-everywhere-src-5.12.9.zip"

wget $wtSource

7z x $qtSourceZipName -oqt
