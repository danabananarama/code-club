## How to ping with client

```
> tftp

tftp> connect localhost 6969
tftp> put <filename>
```

where `<filename>` is a file in the local directory

## How to start a tftpd server

```
/private $ ls tftpboot
/private $ sudo rm -rf tftpboot
/private $ mkdir ~/tftpboot
/private $ sudo ln -s /Users/lcampbell/tftpboot tftpboot
/private $ sudo launchctl unload -F /System/Library/LaunchDaemons/tftp.plist

/private $ sudo launchctl load -F /System/Library/LaunchDaemons/tftp.plist
/private $ cd ~/tftpboot
tftpboot $ touch foo.txt
tftpboot $ chmod 766 foo.txt
```

## TODO

[x] Send a one packet file from the server to a client in response to a read
    request
[x] Handle ack messages without blowing up the server
[ ] Confirm ack corresponds to last sent data
