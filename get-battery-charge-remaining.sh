#! /bin/bash
# (c) Copyright 2018 Douglas D. Quagliana
#
# use WMIC to get the battery charge remaining and log it to /var/log/messages
# You can use this over to time to plot the value and watch your battery capacity
# You can put this in a cronjob that runs every X minutes and then later grep
# through /var/log/messages.  Note that running this script every few minutes
# might prevent your hard drive from going into a low power mode and might 
# actually decrease the time that the laptop can run on batteries.
#
# Use "*/5 * * * * /your/path/to/this/script/get-battery-charge-remaining.sh" 
# in your crontab to run this script every five minutes
#
EstimatedChargeRemaining=`WMIC PATH Win32_Battery Get EstimatedChargeRemaining | tr -d '\r\n'` 
echo $EstimatedChargeRemaining
/bin/logger $EstimatedChargeRemaining
