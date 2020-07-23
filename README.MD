### VPC/EC2
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


### About the project
I structured the project for ease of use. To apply, there is only one command. 
In a production environment I would separate the superstructure (and state) of the VPC from the EC2 boxes which live within it. 

#### EC2
The EC2 module provides a simple way to choose a name, AMI, subnet, and the VPC in which the box will reside .
It also pulls individual userdata for each invocation of the module. 
This way a user can simply add their desired startup commands for each separate box. 
I also included a security group in the root of the infra directory. 
This allows the user to easily modify the connections between instances without having to edit the module.

#### VPC
The VPC module is simpler. 
Because a VPC is very static, I only included the option to name the VPC and to choose subnetting. 
Extending the module is easy, but since we only have one VPC in this use case, I decided not to add much modularity. 

#### Overall 
For a prod environment, there is a lot that I would suggest about an actual web app infra. ELBs, RDS, DNS etc.
But I tried to aim for a reasonable interpretation the original task. 
Thanks for the opportunity!!
