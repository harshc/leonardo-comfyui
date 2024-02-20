#!/bin/false

source /opt/leonardo/etc/environment.sh
comfyui_git="https://github.com/comfyanonymous/ComfyUI"

build_common_main() {
    build_common_create_env
    build_common_clone_comfyui
}

build_common_create_env() {
    apt-get update
    $APT_INSTALL \
        libgl1-mesa-glx \
        libtcmalloc-minimal4
        #libgoogle-perftools4

    ln -sf $(ldconfig -p | grep -Po "libtcmalloc_minimal.so.\d" | head -n 1) \
        /lib/x86_64-linux-gnu/libtcmalloc.so
        
    #$MAMBA_INSTALL -n ${MAMBA_DEFAULT_ENV} pocl
    
    # A new pytorch env costs ~ 300Mb
    exported_env=/tmp/${MAMBA_DEFAULT_ENV}.yaml
    micromamba env export -n ${MAMBA_DEFAULT_ENV} > "${exported_env}"
    $MAMBA_CREATE -n comfyui --file "${exported_env}"
    printf "/opt/micromamba/envs/comfyui/lib\n" >> /etc/ld.so.conf.d/x86_64-linux-gnu.micromamba.10-comfyui.conf
}


build_common_clone_comfyui() {
    cd /opt
    git clone ${comfyui_git}
}

build_common_main "$@"