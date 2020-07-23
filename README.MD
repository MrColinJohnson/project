#VPC/EC2
To auth and run this project, first eport your AWS keys to your ENV:
```
$export AWS_ACCESS_KEY_ID="anaccesskey"
$export AWS_SECRET_ACCESS_KEY="asecretkey"
$export AWS_DEFAULT_REGION="us-east-1"
```

Next, cd into the infra directory and run: 
`$terraform plan`

If the results of the plan look good, run: 
`$terraform apply`

Answer 'yes' when prompted.

#About the project
