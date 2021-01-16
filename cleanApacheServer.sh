#!/bin/bash
set -e
echo "<-----Checking memory status----->"
free
echo "<-----OK - Check completed----->"
echo "<-----Cache and swap memory cleaning----->"
echo "<-----Disabling HTTP----->"
killall -KILL httpd
echo "<-----OK - HTTP disabled----->"
echo "<-----Disabling Swap----->"
swapoff -a
echo "<-----OK - Swap disabled----->"
echo "<-----Releasing page-caches, dentries, and inodes----->"
sync;sysctl -w vm.drop_caches=3;sync
echo "<-----OK - Server released"
echo "<-----Enabling Swap----->"
swapon -a
echo "<-----OK - Swap enabled----->"
echo "<-----Enabling HTTP----->"
service httpd start
echo "<-----OK - Http enabled----->"
free
echo "<-----MAINTENANCE COMPLETED----->"