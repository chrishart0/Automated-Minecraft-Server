#/bin/bash

sudo yum update -y
sudo yum upgrade -y
sudo yum install java-1.8.0-openjdk tmux -y

#Fix tmux error: tmux: open terminal failed: missing or unsuitable terminal: xterm-256color
export TERM=xterm

#Install Amazon Systems manager
sudo yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
sudo systemctl start amazon-ssm-agent

#Setup Dir structure
sudo mkdir /logs -p
sudo mkdir /scripts -p
sudo chgrp ec2-user -R /logs/ /scripts/ /backups/
sudo chmod 770 -R /logs/ /scripts/ /backups/
sudo chmod +r -R /Minecraft_Server/

#Start Crontab
sudo systemctl start crond
sudo systemctl enable crond
#Check crontab log
#cat /var/log/cron

#enable Cloudwatch monitoring
#https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/mon-scripts.html
sudo yum install -y perl-Switch perl-DateTime perl-Sys-Syslog perl-LWP-Protocol-https perl-Digest-SHA.x86_64
cd /tmp
curl https://aws-cloudwatch.s3.amazonaws.com/downloads/CloudWatchMonitoringScripts-1.2.2.zip -O
unzip CloudWatchMonitoringScripts-1.2.2.zip
rm CloudWatchMonitoringScripts-1.2.2.zip
mv aws-scripts-mon /scripts/
echo "*/5 * * * * ec2-user /scripts/aws-scripts-mon/mon-put-instance-data.pl --mem-util --mem-used --disk-space-util --disk-path=/ --from-cron" | sudo tee -a /etc/crontab

#Downlaoad Minecraft server from S3
sudo aws s3 cp s3://1-minecraft-server-personal/Minecraft_Server/ /Minecraft_Server

#Startup Minecraft server
tmux new-session -d -s Minecraft
tmux send-keys -t 'Minecraft' 'cd /Minecraft_Server' Enter
tmux send-keys -t 'Minecraft' 'sudo java -Xmx4G -Xms1G -jar server.jar nogui' Enter
#tmux attach-session -t 'Minecraft'

#Setup cronjob to save the server every 5 minutes
echo "*/5 * * * * ec2-user tmux send-keys -t 'Minecraft' 'save-all' Enter" | sudo tee -a /etc/crontab

#Setup Backup server
mkdir /backups/shortTerm -p
mkdir /backups/longTerm -p

echo "*/30 * * * * ec2-user /scripts/backup-script.sh shortTerm >> /logs/backups-shortTerm.log" | sudo tee -a /etc/crontab
echo "0 0 * *	* ec2-user /scripts/backup-script.sh longTerm >> /logs/backups-longTerm.log" | sudo tee -a /etc/crontab
