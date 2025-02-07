#!/bin/bash

function install_gd()
{
    _gd_deps_runtime
    _gd_deps_build

    docker-php-ext-configure gd \
      --with-gd \
      --with-freetype-dir=/usr/include/ \
      --with-png-dir=/usr/include/ \
      --with-jpeg-dir=/usr/include/

    docker-php-ext-install gd

    _gd_clean
}

function _gd_deps_runtime()
{
    install \
      libfreetype6 \
      libjpeg62-turbo \
      libpng16-16
}

function _gd_deps_build()
{
    install \
      libfreetype6-dev \
      libjpeg62-turbo-dev \
      libpng-dev
}

function _gd_clean()
{
    remove \
      libfreetype6-dev \
      libjpeg62-turbo-dev \
      libpng-dev
}
