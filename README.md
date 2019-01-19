# get-battery-charge-remaining
Logs the percentage of battery charge remaining.  You can use this to measure and log your laptop battery's decreasing 
capacity over time.

This is a bash script intended to be run as a cron job under Cygwin under Windows. It requires Cygwin, cron,
Window's WMIC and Cygwin's logger program.

The script uses WMIC to get the battery charge remaining, reformat it, and log it to /var/log/messages.  
You can use these entries to plot the charge remaining value and watch your average battery capacity decrease.  

You can set up this script as a cronjob that runs every X minutes and then later grep through /var/log/messages
for the entries. The intent is that you can see how long it takes to go from a full one hundred percent charge
down to some value (probably the value where Windows shuts down your laptop automatically to prevent data loss).

Watch the times in /var/log/messages and over several months you will see a decrease in the number of minutes you
can run the laptop from batteries.

Note that running this script every few minutes might prevent your hard drive from going into a low power mode 
and might actually decrease the time that the laptop can run on batteries, so you might not want to keep running
it all the time. 

Sample cron usage: 

*/5 * * * * /your/path/to/this/script/get-battery-charge-remaining.sh

in your crontab to run this script every five minutes. 

If you run a bash prompt as an Administrator, then you can issue a command like

# grep "EstimatedChargeRemaining" /var/log/messages | less

You should see the battery charge decrease once the AC is disconnected.

Aug 12 22:35:01 YourMachineName YourUserName: EstimatedChargeRemaining 100
Aug 12 22:40:01 YourMachineName YourUserName: EstimatedChargeRemaining 95
Aug 12 22:45:02 YourMachineName YourUserName: EstimatedChargeRemaining 89
Aug 12 22:50:03 YourMachineName YourUserName: EstimatedChargeRemaining 82
Aug 12 22:55:02 YourMachineName YourUserName: EstimatedChargeRemaining 74
Aug 12 23:00:01 YourMachineName YourUserName: EstimatedChargeRemaining 67
Aug 12 23:05:02 YourMachineName YourUserName: EstimatedChargeRemaining 61
Aug 12 23:10:01 YourMachineName YourUserName: EstimatedChargeRemaining 53
Aug 12 23:15:01 YourMachineName YourUserName: EstimatedChargeRemaining 45
Aug 12 23:20:02 YourMachineName YourUserName: EstimatedChargeRemaining 38
Aug 12 23:25:02 YourMachineName YourUserName: EstimatedChargeRemaining 27
Aug 12 23:30:02 YourMachineName YourUserName: EstimatedChargeRemaining 20
Aug 12 23:35:01 YourMachineName YourUserName: EstimatedChargeRemaining 18

And then it will increase again once you plug the AC power back into the laptop.

Aug 12 23:40:02 YourMachineName YourUserName: EstimatedChargeRemaining 30
Aug 12 23:45:01 YourMachineName YourUserName: EstimatedChargeRemaining 42
Aug 12 23:50:01 YourMachineName YourUserName: EstimatedChargeRemaining 53
Aug 12 23:55:01 YourMachineName YourUserName: EstimatedChargeRemaining 65
Aug 13 00:00:01 YourMachineName YourUserName: EstimatedChargeRemaining 74
Aug 13 00:05:02 YourMachineName YourUserName: EstimatedChargeRemaining 74
Aug 13 00:10:01 YourMachineName YourUserName: EstimatedChargeRemaining 80
Aug 13 00:15:02 YourMachineName YourUserName: EstimatedChargeRemaining 85
Aug 13 00:20:01 YourMachineName YourUserName: EstimatedChargeRemaining 89
Aug 13 00:25:01 YourMachineName YourUserName: EstimatedChargeRemaining 92
Aug 13 00:30:02 YourMachineName YourUserName: EstimatedChargeRemaining 94
Aug 13 00:35:02 YourMachineName YourUserName: EstimatedChargeRemaining 95
Aug 13 00:40:01 YourMachineName YourUserName: EstimatedChargeRemaining 97
Aug 13 00:45:02 YourMachineName YourUserName: EstimatedChargeRemaining 98
Aug 13 00:50:01 YourMachineName YourUserName: EstimatedChargeRemaining 99
Aug 13 00:55:02 YourMachineName YourUserName: EstimatedChargeRemaining 100

If you do this periodically, you will probably notice that the number of minutes you can run off the 
battery will be decreasing.

