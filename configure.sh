#!/bin/sh
cmake -DGLFW_BUILD_DOCS=OFF -DGLEW_USE_STATIC_LIBS=ON -S . -B build
