#!/usr/bin/sh
version_tag=$1
git archive --prefix naked-rails-f2/ -o naked-rails-f2_${version_tag}.zip ${version_tag}

