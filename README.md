# shellphish

Use ./generator.sh to generate the final script that will be generated at output/final.sh

When you gain root access to a host via exploit or other means, to get real password of root account, execute final.sh as root on the target host.
It will replace root's shell by a rogue one that will store his password at /tmp/.tmpfile.tmp

## Example result:

```
root@kali:~# ssh root@127.0.0.1        --> Victim connects to ssh from remote host
root@127.0.0.1's password:             --> Wrong password example
Permission denied, please try again.   --> Message returned by SSH when wrong password is given
root@127.0.0.1's password:             --> Correct password is given
Permission denied, please try again.   --> SSH login is successful; this message is returned by shellphish
root@127.0.0.1's password:             --> Shellphish emulate SSH client asking for password, sysadmin gives wrong password
Permission denied, please try again.   --> Shellphish stores the password, then checks and see it's wrong, so ask for it again
root@127.0.0.1's password:             --> Now sysadmin give the correct password that will be also stored by shellphish
The programs included with the Kali GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Kali GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
Last login: Fri Feb  8 01:50:47 2019 from: 127.0.0.1        
root@kali:~#                           --> Shellphish print MOTD and last login time just like normal SSH login does :)
```
