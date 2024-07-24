#!/bin/bash

docker run -it --rm --mount src="$(pwd)",target=/repo,type=bind --name arm-ci jconstam/esp32-xtensa-ci
