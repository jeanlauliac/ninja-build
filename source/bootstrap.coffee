require 'shelljs/global'

config.fatal = true

if not which 'git'
    echo 'ninja-build: require git.'
    exit 2

if not which 'python'
    echo 'ninja-build: require python.'
    exit 3

ninjaBinFile = 'bin/ninja'
buildDir = 'ninja-build'
ninjaVersion = '1.3.4\n'

if !test('-f', ninjaBinFile) or exec("#{ninjaBinFile} --version", \
        silent: true).output != ninjaVersion

    echo 'ninja-build: downloading ninja...'
    if test '-d', buildDir
        rm '-rf', buildDir

    exec "git clone git://github.com/martine/ninja.git #{buildDir}"
    cd buildDir
    exec 'git checkout -q v1.3.4'

    echo 'ninja-build: building ninja...'
    exec './bootstrap.py'
    cd '..'
    mkdir '-p', 'bin'
    cp '-f', "#{buildDir}/ninja", ninjaBinFile
    rm '-rf', buildDir

    chmod 755, ninjaBinFile

else
    echo "ninja-build: already got ninja, skipping build."
