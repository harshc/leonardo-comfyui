#!/bin/false

build_nvidia_main() {
    build_nvidia_install_comfyui
}

build_nvidia_install_comfyui() {
    cuda_short_version=$(cut -d '.' -f 1,2 <<< "${CUDA_VERSION}")
    printf "CUDA Version: " "${cuda_short_version}\n" 
    printf "Mamba Default Env: " "${MAMBA_DEFAULT_ENV}\n"
    printf "Pytorch Version: " "${PYTORCH_VERSION} \n"

    micromamba run -n comfyui ${PIP_INSTALL} \
        torch=="${PYTORCH_VERSION}" \
        nvidia-ml-py3

    /opt/leonardo/bin/update-comfyui.sh
}

build_nvidia_main "$@"