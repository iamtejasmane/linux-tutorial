#### Security and File Permissions ####

### Access Control Files ###

# /etc/passwd - access control infor of a user
grep -i ^tejas /etc/passwd

# tejas:x:1000:1000:Tejas,,,:/home/tejas:/bin/bash
# USERNAME:PASSWORD:UID:GID:GECOS:HOMEDIR:SHELL

# /etc/shadow - user password file
grep -i ^tejas /etc/shadow

# tejas:$y$j9T$b7XNRJnEI550uD2BakMJ2/$fQGuL4MDSdCxvYutU1E6eZfgUGsJLzsjPRXt2HuIJT4:19229:0:99999:7:::
# USERNAME:PASSWORD:LASTCHANGE:MINAGE:MAXAGE:WARN:INACTIVE:EXPDATE

# /etc/group - user group info 
grep -i ^tejas /etc/group

# tejas:x:1000:
# USERNAME:PASSWORD:GID:MEMBERS

# to get user id
id
id user-name # for a specific user

# to check what level of sudo access does user have in the system
sudo grep tejas /etc/sudoers

# to create a new user
sudo useradd sarah
sudo passwd sarah

# to create group 
sudo groupadd -g 1010 john # -g=GID 

# create user with specific UID,GID,SHELL
sudo useradd jonh -u 1010 -g john -s /bin/sh

## File Permissions ##

# to see file permissions
ls -l file-name
ls -l bascis.sh
# -rw-rw-r-- 1 tejas tejas 935 Aug 29 08:30 basics.sh

# modifying file permissions
# It has 2 modes

# 1. Symbolic Mode
chmod <permission> filename
chmod u+rwx test-file # provide full access to owners
chmod ugo+r-x filename # provide read accesss to owners,grps and othes, remove execute access

chmod o-rwx filename # remove all access for others

# 2. Numeric Mode
chmod 777 filename # provide full access to owners, grps, and others
chmod 555 filename # provide read and execute access to owners, grps, and others
chmod 660 filename # read and write access for owners and grps. No access for others
chmod 750 filename # full access to owners, read and exec for grp and no access for others


# to change ownership of the file
chown owner:group filename

chown tejas:developer filename # changes owner to tejas and grp to dev
chown akash test.cpp # changes just the owner of hte file. The group remains unchanged
chgpr production file-name # change the grp for the file to the grp called production


### SSH ###

## Secure Shell ##
ssh <hostname or IP Add>
ssh user@ip
ssh -l user <hostname or ip add> 
# with the above way, we need to type username and password eveytime

## Password-Less SSH ##
# we need to gen key pair - Private key + Public Key

# create the key pair on client i.e. on your laptop
ssh-keygen -t rsa 
# public key stored at /home/tejas/.ssh/id_rsa.pub
# private key stored at /home/tejas/.ssh/id_rsa

# to copy the public key on the target remote server
ssh-copy-id user@host

# so here your public key is installed on remote server on a specific directory called /home/bob/.ssh/authorized_keys

### SCP ###

# SCP is Secure Copy Protocol that allows you to copy data over SSH
# that means you can copy data and files over any remote server that you have ssh access to

scp /home/tejas/project-backend.zip devserver01:/home/tejas

# to copy directory use : -r # to preserve the permissions -p









