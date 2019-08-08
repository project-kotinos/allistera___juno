#!/usr/bin/env bash
set -ex
export DEBIAN_FRONTEND=noninteractive
apt-get update && apt-get install -y tzdata libpq-dev
gem install bundler -v 2.0.1
# install
bundle install --jobs=3 --retry=3
# script
rake
