#!/bin/sh

set -eu

EXE_BASENAME=purs

npm install

# If we're building for cargo-dist, specify which target to build and what the
# filename should be. cargo-dist will expect one output with a known filename.
if [ -n "${CARGO_DIST_TARGET:-}" ]; then
    case "${CARGO_DIST_TARGET}" in
        aarch64-apple-darwin)
            # Do nothing - binary already built
            ;;
        x86_64-apple-darwin)
            # TODO once we have the intel binary, rename the intel binary to purs here
            echo "Platform not supported: ${CARGO_DIST_TARGET}"
            exit 1
        *)
            echo "Platform not supported: ${CARGO_DIST_TARGET}"
            exit 1
        esac
fi