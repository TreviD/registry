vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO TreviD/FISCO-BCOS
        REF d8e4503e3fcf15b7050ec4845eb6c6612bc5ca1a
        SHA512 4ba342afa62f1afbd58698ec2b095acb87851a9b111759671d7fc9efb3bb6b213a8666fadbe054b0149728f41e99ac92bff28732eba3ecbf96cd6fd634788559
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