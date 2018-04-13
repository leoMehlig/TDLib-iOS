#!/bin/sh
build_path=$(realpath ./build/)
td_path=$(realpath ./build/td/)
openssl_path=$(realpath ../build/openssl/)

cd $(realpath)
# Install brew deps
brew install gperf cmake
# Clone td
rm -Rf build
mkdir build
cd $build_path
git clone https://github.com/tdlib/td.git
cd td
# Generate sources
mkdir native-build
cd native-build
cmake ..
cmake --build . --target prepare_cross_compiling

cd $build_path
# Clone OpenSSL
git clone https://github.com/pybee/Python-Apple-support
cd Python-Apple-support
git checkout 2.7
# Build OpenSSL
make OpenSSL-iOS
cd ..
rm -rf third_party/openssl/iOS
mkdir -p third_party/openssl/iOS/lib
cp ./Python-Apple-support/build/iOS/libcrypto.a "$openssl_path/lib/"
cp ./Python-Apple-support/build/iOS/libssl.a "$openssl_path/lib/"
cp -r ./Python-Apple-support/build/iOS/Support/OpenSSL/Headers/ "$openssl_path/include"

# Build td (ios)
cd $td_path
mkdir build
cd build
echo "OpenSSL path = ${openssl_path}"
openssl_crypto_library="${openssl_path}/lib/libcrypto.a"
openssl_ssl_library="${openssl_path}/lib/libssl.a"
options="$options -DOPENSSL_FOUND=1"
options="$options -DOPENSSL_CRYPTO_LIBRARY=${openssl_crypto_library}"
#options="$options -DOPENSSL_SSL_LIBRARY=${openssl_ssl_library}"
options="$options -DOPENSSL_INCLUDE_DIR=${openssl_path}/include"
options="$options -DOPENSSL_LIBRARIES=${openssl_crypto_library};${openssl_ssl_library}"
options="$options -DCMAKE_BUILD_TYPE=Release"
simulators="0 1"
for simulator in $simulators;
do
    build="build-ios"
    install="install-ios"
    if [[ $simulator = "1" ]]; then
        build="${build}-simulator"
        install="${install}-simulator"
        ios_platform="SIMULATOR"
    else
        ios_platform="OS"
    fi
    echo $ios_platform
    rm -rf $build
    mkdir -p $build
    mkdir -p $install
    cd $build
    cmake $td_path $options -DIOS_PLATFORM=${ios_platform} -DCMAKE_TOOLCHAIN_FILE=${td_path}/CMake/iOS.cmake -DCMAKE_INSTALL_PREFIX=../${install}
    make -j3 install || exit
    cd ..
done
lib="install-ios/lib/libtdjson.dylib"
lib_simulator="install-ios-simulator/lib/libtdjson.dylib"
mkdir -p ios
lipo -create $lib $lib_simulator -o ios/libtdjson.dylib
install_name_tool -id @rpath/libtdjson.dylib ios/libtdjson.dylib

mkdir -p ../tdjson/ios/include
rsync --recursive ${install}/include/ ../tdjson/ios/include/
mkdir -p ../tdjson/ios/lib
cp ios/libtdjson.dylib ../tdjson/ios/lib/

# cp ../td/td/telegram/td_json_client.h td_json_client.h
# cp ../td/td/telegram/td_log.h td_log.h
# cp -R ../td/build_os/td td
# cd  ..
# # rm -Rf td
# mv -R td ~/Desktop/td