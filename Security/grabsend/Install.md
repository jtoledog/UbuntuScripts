#Install instrucctions

#you will need to install some tools

sudo apt-get update
sudo apt-get install ssmtp mpack libav-tools

#Configure ssmtp to use your mail server#
gksudo gedit /etc/ssmtp/ssmtp.conf

root=MyEmailAddress@gmail.com
mailhub=smtp.gmail.com:587
AuthUser=MyEmailAddress@gmail.com
AuthPass=MyPassword
UseTLS=YES
UseSTARTTLS=YES
rewriteDomain=gmail.com
hostname=MyEmailAddress@gmail.com
FromLineOverride=YES

#change user@email.com to your email in grabsend.sh

copy grabsend.sh somewhere like /usr/local/bin/

gksudo gedit /etc/pam.d/common-auth

Locate the line below
auth	[success=1 default=ignore]	pam_unix.so nullok_secure


#Thats it test it out
In this line change the success=1 to success=2

add this line right after

auth    [default=ignore]                pam_exec.so seteuid /usr/local/bin/grabsend.sh
