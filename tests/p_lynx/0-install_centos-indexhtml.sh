#!/bin/bash
# Author: Rich Alloway <ralloway@perforce.com>

# OpenLogic CentOS 7 images (maybe others) don't install all files within centos-indexhtml (kickstart with equiv of --nodocs) so reinstall the package

t_Log "$0 - installing centos-indexhtml for local files required for lynx testing"

t_RemovePackage  centos-indexhtml
t_InstallPackage  centos-indexhtml

