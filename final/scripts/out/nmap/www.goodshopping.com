Starting Nmap 7.70 ( https://nmap.org ) at 2018-11-17 13:34 EST
Nmap scan report for www.goodshopping.com (172.43.35.10)
Host is up (0.00081s latency).
Not shown: 65509 closed ports
PORT      STATE SERVICE
21/tcp    open  ftp
80/tcp    open  http
135/tcp   open  msrpc
139/tcp   open  netbios-ssn
445/tcp   open  microsoft-ds
1801/tcp  open  msmq
2103/tcp  open  zephyr-clt
2105/tcp  open  eklogin
2107/tcp  open  msmq-mgmt
3389/tcp  open  ms-wbt-server
5985/tcp  open  wsman
16450/tcp open  unknown
16451/tcp open  unknown
16452/tcp open  unknown
16453/tcp open  unknown
17001/tcp open  unknown
47001/tcp open  winrm
49152/tcp open  unknown
49153/tcp open  unknown
49154/tcp open  unknown
49155/tcp open  unknown
49156/tcp open  unknown
49157/tcp open  unknown
49215/tcp open  unknown
49216/tcp open  unknown
52710/tcp open  unknown
MAC Address: 00:50:56:9A:E0:AE (VMware)

Nmap done: 1 IP address (1 host up) scanned in 17.16 seconds
