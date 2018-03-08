rm -Rf build
mkdir build
cd build
git clone https://github.com/tdlib/td.git
git clone https://github.com/x2on/OpenSSL-for-iPhone.git
cd OpenSSL-for-iPhone
./build-libssl.sh
cd ..
cd td
mkdir build_nativ
cd build_nativ
cmake -DCMAKE_BUILD_TYPE=Release -DOPENSSL_ROOT_DIR=/usr/local/opt/openssl/ ..
cmake --build .
cd ..
mkdir build_os
cd build_os
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE=../CMake/iOS.cmake -DIOS_PLATFORM=OS -DIOS_DEPLOYMENT_TARGET=10.0 -DOPENSSL_CRYPTO_LIBRARY=../../OpenSSL-for-iPhone/lib/libcrypto.a -DOPENSSL_SSL_LIBRARY=../../OpenSSL-for-iPhone/lib/libssl.a -DOPENSSL_INCLUDE_DIR=../../OpenSSL-for-iPhone/include ..
cmake --build .
cd ..
mkdir build_sim
cd build_sim
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE=../CMake/iOS.cmake -DIOS_PLATFORM=SIMULATOR -DIOS_DEPLOYMENT_TARGET=10.0 -DOPENSSL_CRYPTO_LIBRARY=../../OpenSSL-for-iPhone/lib/libcrypto.a -DOPENSSL_SSL_LIBRARY=../../OpenSSL-for-iPhone/lib/libssl.a -DOPENSSL_INCLUDE_DIR=../../OpenSSL-for-iPhone/include ..
cmake --build .
cd ../..
cd build
mkdir tdlibs
cd tdlibs
for lib_path in libtdclient.a sqlite/libtdsqlite.a tdtl/libtdtl.a libtdcore.a tdactor/libtdactor.a tdutils/libtdutils.a libmemprof.a libtdjson_private.a tddb/libtddb.a libtdc.a libtdjson_static.a tdnet/libtdnet.a
do
    lipo -create -output ${lib_path#*/} "../td/build_os/$lib_path" "../td/build_sim/$lib_path"
done
cp ../td/td/telegram/td_json_client.h td_json_client.h
cp -R ../td/build_os/td td
cd  ..
rm -Rf td