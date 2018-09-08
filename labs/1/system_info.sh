#!/bin/bash

get_computer_name() {
	echo "'`hostname`'"
}

pretty_date() {
	echo "Date: `date '+%m/%d/%y'`"
}

pretty_time() {
	echo "Time: `date '+%r'`"
}

system_uptime() {
	echo "Uptime:"
	echo "`uptime | xargs`"
	# xargs strips whitespace.
}

os_version() {
	cat /etc/os-release | grep "VERSION="
}

kernel_version() {
	echo "`uname -r` `uname -o`"
}

all_users() {
	cat /etc/passwd | grep -P ".*:.*:1\d{3}" | cut -d ':' -f1 
	# Only entries with `?:?:1---`, cut by colons, first field.
}

logged_in_users() {
	who -u | cut -d ' ' -f1
	# Cut each line by spaces, only get field 1, 'f1'.
}

cpu_info() {
	cat /proc/cpuinfo | grep "model name" | uniq | cut -d ' ' -f'3-'
	# Only get ONE core, hence `uniq`. Cut from field 3 to end, 'f3'
}

mem_info() {
	cat /proc/meminfo | grep "^Mem"
	# All lines which begin with 'Mem'.
}

drives_info() {
	lsblk -Ti -o "NAME,TYPE,SIZE,FSTYPE,GROUP,OWNER,RO,MOUNTPOINT,HOTPLUG,RM"
}

drives_used_space() {
	df -h
}

pci_devices() {
	lspci
}

network_interfaces() {
	ip a
}

routing_table() {
	netstat -rn
}

open_network_connections() {
	netstat -lnptu 2>/dev/null #Redirect that annoying warning to THE VOID.
}

running_processes() {
	pstree -Ap
}

printf "hostname: " 
get_computer_name
echo ""

pretty_date
pretty_time
echo ""

system_uptime
echo ""

echo "CPU Information:"
cpu_info
echo ""

echo "Memory Information:"
mem_info
echo ""

echo "Attached PCI Devices:"
pci_devices
echo ""

echo "Network interfaces:"
network_interfaces
echo ""

echo "Open network connections:"
open_network_connections
echo ""

routing_table
echo ""

echo "Attached storage media:"
drives_info
echo ""

echo "Used space:"
drives_used_space
echo ""

echo "Kernel Version:"
kernel_version
echo ""

echo "OS Version"
os_version
echo ""

echo "All users:"
all_users
echo ""

echo "Logged in users:"
logged_in_users
echo ""

echo "Running prcocesses:"
running_processes
echo ""

echo "Goodbye!"

