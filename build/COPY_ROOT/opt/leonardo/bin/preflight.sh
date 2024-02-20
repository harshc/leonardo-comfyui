#!/bin/false

# This file will be sourced in init.sh

function preflight_main() {
    preflight_update_comfyui
    printf "%s" "${COMFYUI_FLAGS}" > /etc/comfyui_flags.conf
}

function preflight_update_comfyui() {
    if [[ ${AUTO_UPDATE,,} != "false" ]]; then
        /opt/leonardo/bin/update-comfyui.sh
    else
        printf "Skipping auto update (AUTO_UPDATE=false)"
    fi
}

# move this to base-image
sudo chown user.leonardo /var/log/timing_data
preflight_main "$@"
