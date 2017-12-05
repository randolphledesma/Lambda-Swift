#!/bin/sh
#Package linux dependencies
PWDIR=$(pwd)
ldd .build/release/Lamb | grep so | sed -e '/^[^\t]/ d' -e 's/\t//' -e 's/.*=..//' -e 's/ (0.*)//' | xargs -i% cp % /project/Lamb/lambda/libraries
rm -f /project/Lamb/lambda/Lamb
cp -v .build/release/Lamb /project/Lamb/lambda
rm -f /project/Lamb/lambda/lambda.zip
cd /project/Lamb/lambda
zip -r /project/Lamb/lambda/lambda.zip *
cd $PWDIR