
$qtSource = "http://download.qt-project.org/official_releases/qt/5.15/5.15.0/submodules/qtbase-everywhere-src-5.15.0.zip"
$qtSourceFolder = "qtbase-everywhere-src-5.15.0"

Invoke-WebRequest -Uri $qtSource -OutFile qt_source.zip

7z x qt_source.zip -oqt_source

cd "qt_source\$qtSourceFolder"

gcc -v

./configure `
  -opensource -confirm-license -release -no-shared -static `
  -no-ssl -no-opengl -no-angle -no-direct2d -no-gif -no-ico -no-libpng -no-libjpeg

mingw32-make
 
