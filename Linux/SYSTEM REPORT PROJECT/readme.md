# Now create a ec2 instance and copy this project into it
# 1. Compress the project files
```
tar -cvf system_report.tar {directory}
```
# 2.now copy to ec2 instance
```
scp -i {address_of_pem_file} {file_address} {user}@{host_ip}:{where_to_copy}
```
# 3.now login to ec2 instance 
```
ssh -i {address_of_pem_file} {user}@{host_ip}
```
# 4.extract the compressed file
```
tar xf system_report.tar
```
# 5. give proper permission to project 
# 6. set a cron job
```
sudo crontab -e
```
```
# Run the script at 9:00 AM and 6:00 PM every day
0 9,18 * * * {location}/main.sh

```
