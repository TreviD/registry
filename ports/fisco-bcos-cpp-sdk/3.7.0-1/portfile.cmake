vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO zhaoxiaoxuannj/fiscotest
        REF cb3671d0aa33a5d382e4111986c955f4f6db131a
        SHA512 712b0708562e19f3cf281112b70b0a3cded77d52b5b02ef8649da1e4245ae0af651a2e41d0b294f2f34bdd3e9c73ce3a0cac5b20889a8f2dbccbd58fe2f90ad5
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