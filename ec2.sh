echo To start EC2 instance.  
echo Enter ami type:
read STR
echo Enter Instance type eg. t2.micro
read TYPE
echo How many instances do you want to start? 
read COUNT
aws ec2 run-instances --image-id ami-${STR} --security-group-ids sg-00e21b78cc1859d78 --count ${COUNT} --instance-type ${TYPE} --key-name devenv-key --query 'Instances[0].InstanceId'
