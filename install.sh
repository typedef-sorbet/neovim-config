#!/bin/bash

git submodule update --init
nvim +PluginInstall +qall
