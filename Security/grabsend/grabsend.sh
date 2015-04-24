#!/bin/bash
# date
ts=`date`
# temp dir
TDIR=`mktemp -d`
#trap to remove temp dir
trap "{ cd - ; rm -rf $TDIR; exit 255; }" SIGINT

cd $TDIR
#Takes 3 Pictures and saves them to /tmp
avconv -f video4linux2 -i /dev/video0 -vframes 3 image%01d.jpg >/dev/null 2>/dev/null
#Stich Images
$(montage -geometry +4+4 -compress none -quality 100 image1.jpg image2.jpg image3.jpg result.jpg)
#Sends The Pictures
mpack -s "Auth Failure $ts" result.jpg user@email.com
cd - >/dev/null 2>/dev/null

# Remove Temp Files
rm -rf $TDIR

exit 0
#important for pam not to stall - has to exit with status 0
