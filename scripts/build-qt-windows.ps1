
$qtCore = "http://download.qt-project.org/official_releases/qt/5.15/5.15.0/submodules/qtbase-everywhere-src-5.15.0.zip"
$qtCoreFolder = "qtbase-everywhere-src-5.15.0"
$qtMultimedia = "http://download.qt-project.org/official_releases/qt/5.15/5.15.0/submodules/qtmultimedia-everywhere-src-5.15.0.zip"
$qtMultimediaFolder = "qtmultimedia-everywhere-src-5.15.0"

Invoke-WebRequest -Uri $qtCore -OutFile qtCore.zip
7z x qtCore.zip -oqtCore

Invoke-WebRequest -Uri $qtMultimedia -OutFile qtMultimedia.zip
7z x qtMultiMedia.zip -oqtMultimedia
mv "qtMultimedia\$qtMultimediaFolder" "qtCore\src\multimedia"

cd "qtCore\$qtSourceFolder"

gcc -v

dir

./configure --help
./configure --list-features

exit

./configure `
  -opensource -confirm-license -release -disable-shared -static `
  -make libs `
  -no-ssl -no-opengl -no-angle -no-direct2d -no-gif -no-ico -no-libpng -no-libjpeg

mingw32-make -j4
mingw32-make install

$qtInstall = "C:\Qt\Qt-5.15.0"
dir $qtInstall
 
