require 'shelljs/global'

config.fatal = true

if not which 'curl'
    echo 'ninja-build: require curl.'
    exit 2

if not which 'python'
    echo 'ninja-build: require python.'
    exit 3

ninjaBinFile = 'bin/ninja'
ninjaVersion = '1.3.4'
buildDir = "ninja-#{ninjaVersion}"
ninjaUrl = "https://github.com/martine/ninja/archive/v#{ninjaVersion}.tar.gz"

if !test('-f', ninjaBinFile) or exec("#{ninjaBinFile} --version", \
        silent: true).output != "#{ninjaVersion}\n"

    echo 'ninja-build: downloading ninja...'
    if test '-d', buildDir
        rm '-rf', buildDir

    exec "curl -L #{ninjaUrl} | tar xz"
    cd buildDir

    echo 'ninja-build: building ninja...'
    exec './bootstrap.py'
    cd '..'
    mkdir '-p', 'bin'
    cp '-f', "#{buildDir}/ninja", ninjaBinFile
    rm '-rf', buildDir

    chmod 755, ninjaBinFile

else
    echo "ninja-build: already got ninja, skipping build."
