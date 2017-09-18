!/bin/bash


# backup script

HOSTNAME=$(hostname -f)
DATE=$(date +%a-%d-%b-%Y)
FILENAME=$HOSTNAME-$DATE.tar.gz
LOCALDIR=/backups
REMOTEDIR=/<YOURTARGET>/<DIRECTORY>
LOG=/tmp/backuplog.txt

/bin/mkdir $LOCALDIR $REMOTEDIR > /dev/null 2>&1

/bin/mount -t nfs <IPaddress-or-HOSTNAME>:<DIRECTORY> $REMOTEDIR  > /dev/null 2>&1 

/bin/tar -zcvpf $LOCALDIR/$FILENAME --directory=/ --exclude=proc --exclude=*tar --exclude=*gz --exclude=media --exclude=sys --exclude=dev/pts --exclude=backups --exclude=mnt . > $LO
G

/bin/mv $LOCALDIR/$FILENAME $REMOTEDIR

/bin/umount $REMOTEDIR  > /dev/null 2>&1

exit 0
