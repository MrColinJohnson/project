# VPC/EC2
.
├── README.md
├── infra
│   ├── private_ec2.tf
│   ├── public_ec2.tf
│   └── vpc.tf
└── modules
    ├── ec2
    │   ├── main.tf
    │   ├── outputs.tf
    │   └── variables.tf
    └── vpc
        ├── main.tf
        ├── outputs.tf
        └── variables.tf


# NOTES

## Not Included
- Remote state
    - Remote state for production infra is an absolute must. I didnt include it just so that there would be no additional complications beyond planning and applying this project.
- Isolated state for EC2 and VPC
        - Typically if this were a larger project, intermingaling state between EC2 machines and a VPC would not make sense. The state would be seperated by purpose. For example, the VPC is a slow moving network component, it should be treated as the superstructure upon which other infrastructure is built. An EC2 instance therefore should be maintained seperatly. In order to keep planning and applying as simple as possible for the RVShare team, I have included them in the same state.
