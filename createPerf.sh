
#!/bin/bash

echo "Creating file"
touch performance.sh
echo "#!/bin/bash" >> performance.sh
echo "ramusage=\$(free | awk '/Mem/{printf(\"RAM Usage: %.2f\n\"), \$3/\$2*100}'| awk '{print \$3}')" >> performance.sh
echo "cpuuse=\$(cat /proc/loadavg | awk '{print \$1}')" >> performance.sh
echo "curl -X POST -d \"\$ramusage \$cpuuse\" \"http://10.0.0.1:8082/receive-info\"" >> performance.sh
chmod 777 m6.sh

echo "File creation completed"
#write out current crontab
crontab -l > mycron
#echo new cron into cron file
wd=`pwd`
new_path="$wdperformance.sh"
echo $new_path
echo "* * * * * $new_path" >> mycron
#install new cron file
crontab mycron
rm mycron
echo "crontab created"
