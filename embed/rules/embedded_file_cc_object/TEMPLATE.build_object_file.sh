#!/bin/sh -
# This script was instantiated from a template with the following substitutions:
#
# - NATIVE_SYMBOL_NAME: {NATIVE_SYMBOL_NAME}
# - INPUT_FILE_PATH: {INPUT_FILE_PATH}
# - OUTPUT_FILE_PATH: {OUTPUT_FILE_PATH}

set -e

cp --no-clobber "{INPUT_FILE_PATH}" "{NATIVE_SYMBOL_NAME}"

ld --relocatable \
    --format binary \
    --output "{OUTPUT_FILE_PATH}" \
    --require-defined "_binary_{NATIVE_SYMBOL_NAME}_end" \
    --require-defined "_binary_{NATIVE_SYMBOL_NAME}_size" \
    --require-defined "_binary_{NATIVE_SYMBOL_NAME}_start" \
    "{NATIVE_SYMBOL_NAME}"
