#!/bin/bash
# date
ts=`date`
#Takes 3 Pictures and saves them to /tmp
avconv -f video4linux2 -i /dev/video0 -vframes 3 /tmp/image%01d.jpg
#Stich Images
$(montage -geometry +4+4 -compress none -quality 100 /tmp/image1.jpg /tmp/image2.jpg /tmp/image3.jpg /tmp/result.jpg)
#Sends The Pictures to user@email.com
mpack -s "Auth Failure $ts" /tmp/result.jpg user@email.com
#Removes The Pictures
rm /tmp/image1.jpg
rm /tmp/image2.jpg
rm /tmp/image3.jpg
rm /tmp/result.jpg
exit 0  
#important for pam not to stall - has to exit with status 0
