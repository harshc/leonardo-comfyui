#!/bin/bash

# Must exit and fail to build if any command fails
set -eo pipefail
umask 002

source /opt/leonardo/bin/build/layer0/common.sh
source /opt/leonardo/bin/build/layer0/nvidia.sh

source /opt/leonardo/bin/build/layer0/clean.sh