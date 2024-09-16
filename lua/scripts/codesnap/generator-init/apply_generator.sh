#!/usr/bin/env bash

source ./generator-init/check_os.sh

function apply_generator {
    cp -rf generator-init/"${os}generator.so" generator-init/generator.so
}

apply_generator $os
