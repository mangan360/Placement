+###################################################################
+### Author : Stephen Mangan                    			###
+### Contact : stephen.mangan@aqmetrics.com             		###
+### Date : 23rd/March/2018                                      ###
+###                                                             ###
+###                                                             ###
+###################################################################
+
+#setup
+sudo apt-get install aws-cli -y
+
+echo Allows the user to start EC2 instance.
+default_ami="1853ac65"
+default_instance="t2.micro"
+default_count="1"
+
+read -p "Enter ami type: (Default: ${default_ami})" STR
+STR=${STR:-${default_ami}}
+echo Selected AMI type was $STR
+read -p "Enter Instance type: (Default: ${default_instance})" TYPE
+TYPE=${TYPE:-${default_instance}}
+echo Selected Instance type was $TYPE
+
+read -p "How many instances do you want to start? : (Default: ${default_count})" COUNT
+COUNT=${COUNT:-${default_count}}
+echo Selected number of instances was $COUNT
+aws ec2 run-instances --image-id ami-${STR} --security-group-ids sg-09a97a7fb732e9a83 --count ${COUNT} --instance-type ${TYPE} --key-name Yourmam --query 'Instances[0].InstanceId'
+#Allow for instance to set up. 
+sleep 60s
+#Get IP of running instances and connect
+
+sudo ssh -i Yourmam ec2-user@$(aws ec2 describe-instances --query "Reservations[*].Instances[*].PublicIpAddress" --output=text)
+# Use to generate key
+# aws ec2 create-key-pair --key-name devenv-key --query 'KeyMaterial' --output text > devenv-key.pem
+
+
+# Use to secure key to current user and root access permissions
+# chmod 600 devenv-key.pem
