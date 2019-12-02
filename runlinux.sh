#! /bin/sh

# in order to work on this in a Linux env, run this script!

# ~/dev/postgres[patch-test_decoding*]$ ./runlinux.sh
# root@883b87b7e6db:/# su postgre
# No passwd entry for user 'postgre'
# root@883b87b7e6db:/# su postgres
# postgres@883b87b7e6db:/$ cd /opt/src/
# postgres@883b87b7e6db:/opt/src$ ls
#    COPYRIGHT  Dockerfile  GNUmakefile  GNUmakefile.in  HISTORY  Makefile  README  README.git
#    aclocal.m4  config  config.log  config.status  configure  configure.in  contrib  doc  runlinux.sh
#    src  tmp_install
# postgres@883b87b7e6db:/opt/src$ make clean
# ...
# postgres@883b87b7e6db:/opt/src$ make -j
# ...
# postgres@883b87b7e6db:/opt/src$ make check
# ...

docker run -v `pwd`:/opt/src -it $(docker build -q .) /bin/bash
