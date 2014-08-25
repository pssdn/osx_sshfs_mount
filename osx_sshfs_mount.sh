#!/bin/bash
#argumentos passados pelo Automator
user=$1
host=$2
port=$3

volume_name="$user"@"$host"
mount_point=/Volumes/"$volume_name"

#utiliza porta padrão se não for informada
if [ -z "$port" ]; then
    port=22
fi

#utiliza porta padrão se não for informada
if [ -d "$mount_point" ]; then
    umount $mount_point
    rmdir $mount_point
fi

mkdir $mount_point

#inicia montagem do volume
/usr/local/bin/sshfs -o volname=$volume_name,reconnect -o idmap=user -o no_check_root -o kernel_cache -o auto_cache -o follow_symlinks -o umask=003 -o workaround=nodelaysrv:buflimit $user@$host: -p $port $mount_point

if [ "$?" == "0" ]; then
 open $mount_point
 echo "Volume is up!"
else
 echo "Unable to mount sshfs volume. Check host and port, make sure you have authorized your connection over ssh public keys. Plus, server is up?"
 rmdir $mount_point
fi