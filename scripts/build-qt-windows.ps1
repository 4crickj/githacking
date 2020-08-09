
$qtCore = "http://download.qt-project.org/official_releases/qt/5.15/5.15.0/submodules/qtbase-everywhere-src-5.15.0.zip"
$qtCoreFolder = "qtbase-everywhere-src-5.15.0"
$qtMultimedia = "http://download.qt-project.org/official_releases/qt/5.15/5.15.0/submodules/qtmultimedia-everywhere-src-5.15.0.zip"
$qtMultimediaFolder = "qtmultimedia-everywhere-src-5.15.0"
$qtBuild = "C:\QtBuild\"
$qtInstall = "C:\QtStatic\"

$env:Path += ";$qtInstall\qtbase\bin;$qtInstall\gnuwin32\bin"

Invoke-WebRequest -Uri $qtCore -OutFile qtCore.zip
7z x qtCore.zip -oqtCore
mv "qtCore\$qtCoreFolder" "$qtBuild"

Invoke-WebRequest -Uri $qtMultimedia -OutFile qtMultimedia.zip
7z x qtMultiMedia.zip -oqtMultimedia
mv "qtMultimedia\$qtMultimediaFolder" "$qtBuild\src\multimedia"

cd "$qtBuild"

gcc -v

#./configure --help
#./configure --list-features
#exit

./configure `
  -opensource -confirm-license -release -static -prefix $qtInstall `
  -make libs `
  -no-ssl -no-opengl -no-angle -no-direct2d -no-gif -no-ico -no-libpng -no-libjpeg 

mingw32-make -j4
mingw32-make install

dir $qtInstall
7z a -r QtStatic.zip $qtInstall

 
