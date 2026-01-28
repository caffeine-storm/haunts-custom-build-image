#!/bin/bash

# If a subcommand fails, bail out of the script.
set -e

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -y \
	bear \
	build-essential \
	ccache \
	curl \
	libglew-dev \
	liblua5.1 \
	libx11-dev \
	make \
	podman \
	xdotool \
	xvfb \
	;

set +e
go version &> /dev/null
if [ $? -eq 0 ]; then
	exit 0
fi
set -e

echo "3333f6ea53afa971e9078895eaa4ac7204a8c6b5c68c10e6bc9a33e8e391bdd8  go1.24.3.linux-amd64.tar.gz" > go1.24.3.sha256sum
curl 'https://go.dev/dl/go1.24.3.linux-amd64.tar.gz' --location --output go1.24.3.linux-amd64.tar.gz
sha256sum --check go1.24.3.sha256sum || {
	echo 1>&2 "checksum failed -- aborting"
	exit 1
};
tar --directory /usr/local --extract --file go1.24.3.linux-amd64.tar.gz
rm -f go1.24.3.linux-amd64.tar.gz
export PATH="$PATH:/usr/local/go/bin"
echo -e '\nexport PATH="$PATH:/usr/local/go/bin"' >> /etc/bash.bashrc
