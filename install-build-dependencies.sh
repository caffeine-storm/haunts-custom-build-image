#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -y \
	bear \
	ccache \
	libglew-dev \
	liblua5.1 \
	libx11-dev \
	xdotool \
	;
