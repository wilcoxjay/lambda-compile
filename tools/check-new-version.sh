#!/bin/sh

stable=2.18.2-1
unstable=$stable

stable_src=`echo $stable | cut -d'-' -f1`
unstable_src=`echo $unstable | cut -d'-' -f1`

echo stable $stable
echo unstable $unstable
