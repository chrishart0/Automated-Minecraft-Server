# Minecraft-Deployments
The intent of this project is to write a fully automated MineCraft server deployment. The server should auto size based on user count.

# AutoScaling Tall
- Alarm based off of user count or rapidity of restarts
- Kicks off CloudFormation update to change server size
- ASG stands up new server
- lambda function stops old server, moves backup to new server, starts new server, flips elastic interface with static IP

# ToDo
- S3 backups
  - Get LongTerm and shortTerm going to right dirs
  - Set cheaper storage tier
  - Trim older backups from S3
  - Backup actually watches for save to complete
- Log file rotator
- MC server auto starts on restart
- Auto restart server on high memory
- CloudWatch
  - Logs to CloudWatch
  - CloudWatch metric for user count
  - CloudWatch metric time since last restart
  - CloudWatch Alarm to auto recover server
- CloudFormation
  - Auto StandUp of fresh server via userdata
  - CloudWatch dashboard
  - ASG
  - Server healthcheck
  - Alarms for server being down
  - Jar version?
