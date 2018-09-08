#!/bin/bash

name="system_info_`date +'%d_%m_%Y-%H:%M:%S'`.log"

./system_info.sh | gzip > "$name.gz"

