
$qtGit = "http://code.qt.io/qt/qt5.git"
$qtTag = "v5.15.0"
$qtBuild = "C:\QtBuild\"
$qtInstall = "C:\QtStatic\"

$env:Path += ";$qtInstall\qtbase\bin;$qtInstall\gnuwin32\bin"

git clone --depth 1 --branch $qtTag $qtGit "$qtBuild"

cd "$qtBuild"

gcc -v

perl init-repository `
  --module-subset=qtbase,qtmultimedia

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

 
