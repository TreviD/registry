vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO TreviD/FISCO-BCOS
        REF 642d91ab3c2c8cb5cd8a1c542a9ab92669b7f9db
        SHA512 d5e622819b2ad8535feae1a648449a8ba1c1d3740b2ed2574788a85bbb9f2c634c6f9a7a8fe6fead6eb4c0114cb18318a8c503c5b9ba1d1590d9bfab166fda5e
        HEAD_REF master
)

vcpkg_cmake_configure(
        SOURCE_PATH "${SOURCE_PATH}"
        OPTIONS
        -DALLOCATOR=default
        -DTESTS=OFF
        -DWITH_TIKV=OFF
        -DWITH_TARS_SERVICES=OFF
        -DWITH_LIGHTNODE=OFF
        -DWITH_CPPSDK=ON
        -DBUILD_STATIC=OFF
        -DTOOLS=OFF
        -DFULLNODE=OFF
        -DWITH_WASM=OFF
)

vcpkg_cmake_build()
vcpkg_cmake_install()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"  RENAME copyright)
