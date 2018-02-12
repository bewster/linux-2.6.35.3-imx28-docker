#!/bin/bash

ERROR=false
NOEXIT=false
PUBLISH=false
PUBLISH_URL=

# idiomatic parameter and option handling in sh
while test $# -gt 0
do
    case "$1" in
        --no-exit) NOEXIT=true
            ;;
        --publish-url) PUBLISH=true
            # the next argument is the path
            shift
            PUBLISH_URL=$1
            ;;
        --*) echo "bad option $1"
            ;;
        *) echo "argument $1"
            ;;
    esac
    shift
done

cd linux-2.6.35.3-imx28

echo "Set the default configuration"
make ts7600_defconfig
if [ $? -ne "0" ] ; then
  echo "Failed to install kernel headers to $LOCALPATH"
  ERROR=true
else
  ln -sf initramfs.cpio-ts7600 initramfs.cpio
fi

if [ "$ERROR" = false ] ; then
  echo "Build the kernel"
  make
  if [ $? -ne "0" ] ; then
    echo "Failed to build the kernel"
    ERROR=true
  fi
fi

if [ "$ERROR" = false ] ; then
  echo "Build the bootstream"
  ./build_bootstream
  if [ $? -ne "0" ] ; then
    echo "Failed to build the bootstream"
    ERROR=true
  fi
fi

if [ "$ERROR" = false ] && [ "$PUBLISH" = true ] ; then
  echo "Publish the kernel to $PUBLISH_URL"
  if [ "$PUBLISH_URL" == "rsync://%ENTER_URL_HERE%" ] ; then
    echo "ERROR: The publish URL needs to defined in the dockerfile."
    ERROR=true
  else
    ./publish $PUBLISH_URL
  fi
fi

cd ..

# launch a user shell
if [ "$NOEXIT" = true ] ; then
  /bin/bash
fi
