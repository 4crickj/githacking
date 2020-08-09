
$qtMulti = "http://download.qt-project.org/official_releases/qt/5.15/5.15.0/single/qt-everywhere-src-5.15.0.zip"
$qtMultiFolder = "qt-everywhere-src-5.15.0"
$qtBuild = "C:\QtBuild\"
$qtInstall = "C:\QtStatic\"

$env:Path += ";$qtInstall\qtbase\bin;$qtInstall\gnuwin32\bin"

Invoke-WebRequest -Uri $qtMulti -OutFile qtMulti.zip
7z x qtMulti.zip -oqtMulti
mv "qtMulti\$qtMultiFolder" "$qtBuild"

cd "$qtBuild"

gcc -v

./configure --help
./configure --list-features
exit

./configure `
  -opensource -confirm-license -release -static -prefix $qtInstall `
  -make libs `
  -no-ssl -no-opengl -no-angle -no-direct2d -no-gif -no-ico -no-libpng -no-libjpeg 

mingw32-make -j4
mingw32-make install

dir $qtInstall
7z a "$Env:GITHUB_WORKSPACE\QtStatic.zip" "$qtInstall"

 
