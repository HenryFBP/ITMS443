Starting Nmap 7.70 ( https://nmap.org ) at 2018-11-17 13:41 EST
Nmap scan report for www.moviescope.com (172.43.35.10)
Host is up (0.00049s latency).
rDNS record for 172.43.35.10: www.goodshopping.com
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
Device type: general purpose
Running: Microsoft Windows 2012|7|8.1
OS CPE: cpe:/o:microsoft:windows_server_2012:r2 cpe:/o:microsoft:windows_7:::ultimate cpe:/o:microsoft:windows_8.1
OS details: Microsoft Windows Server 2012 R2 Update 1, Microsoft Windows 7, Windows Server 2012, or Windows 8.1 Update 1
Network Distance: 1 hop

OS detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 18.98 seconds
