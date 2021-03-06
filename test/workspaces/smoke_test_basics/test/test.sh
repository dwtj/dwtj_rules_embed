#!/bin/sh -

set -e

TEST_EXEC="$1"
EXPECTED_OUTPUT_FILE="$2"
ACTUAL_OUTPUT_FILE=stdout.log

"./${TEST_EXEC}" | tee "${ACTUAL_OUTPUT_FILE}"

diff "${EXPECTED_OUTPUT_FILE}" "${ACTUAL_OUTPUT_FILE}"
