<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![MIT License][license-shield]][license-url]


<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li> 
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

There are many great README templates available on GitHub; however, I didn't find one that really suited my needs so I created this enhanced one. I want to create a README template so amazing that it'll be the last one you ever need -- I think this is it.

Here's why:
* Your time should be focused on creating something amazing. A project that solves a problem and helps others
* You shouldn't be doing the same tasks over and over like creating a README from scratch
* You should implement DRY principles to the rest of your life :smile:

Of course, no one template will serve all projects since your needs may be different. So I'll be adding more in the near future. You may also suggest changes by forking this repo and creating a pull request or opening an issue. Thanks to all the people have contributed to expanding this template!

Use the `BLANK_README.md` to get started.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



### Built With

[![Next][AWS]][AWS-url]
[![Next][Terraform]][Terraform-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- GETTING STARTED -->
## Getting Started

This is an example of how you may give instructions on setting up your project locally.
To get a local copy up and running follow these simple example steps.

### Prerequisites

I am using **Terraform v1.5.6**
Also, you need to install **AWS CLI** and **configure** it.

### Installation

_Below is an example of how you can instruct your audience on installing and setting up your app. This template doesn't rely on any external dependencies or services._

1 Clone the repo
```sShell
git clone https://github.com/Takkesan/terraform-prometheus-jenkins.git
```

2 Set your IP address
    You need to set your IP address in **environments/dev(prod)/main.tf** file.
```tf
module "security_group" {
source = "../../modules/security_group"

------------------------------------------------------------------
user_cidr_blocks = ["YOUR IP/32"]
------------------------------------------------------------------

vpc_id           = module.vpc.vpc_id
project     = var.project
environment = var.environment
}
```

3 Create private key pair in **keys** directory

key directory must be created and the private and public keys must be placed there.
```Shell
ssh-keygen -t rsa -b 4096 -f prometheus-jenkins-dev-key-pair
```

if you want to use other name, edit **environments/dev(prod)/main.tf** file.
```tf
resource "aws_key_pair" "key_pair" {
  key_name   = "${var.project}-${var.environment}-key-pair"
  
  ------------------------------------------------------------------
  public_key = file("../../keys/prometheus-jenkins-dev-key-pair.pub")
  ------------------------------------------------------------------
  
  tags = {
    Name    = "${var.project}-${var.environment}-key-pair"
    Project = var.project
    Env     = var.environment
  }
}
```

4 Let's create your infrastructure
```Shell
cd environments/dev(prod)
terraform init
terraform plan
terraform apply
```


<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

X(Twitter) - [たっけさん@学生プログラマー](https://twitter.com/Takkesan_Game)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [Best-README-Template](https://github.com/othneildrew/Best-README-Template)
* [Simple Icons](https://simpleicons.org/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[license-shield]: https://img.shields.io/github/license/othneildrew/Best-README-Template.svg?style=for-the-badge
[license-url]: https://github.com/Takkesan/terraform-prometheus-jenkins/blob/main/LICENSE
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/othneildrew
[product-screenshot]: images/screenshot.png
[AWS]: https://img.shields.io/badge/-Amazon%20AWS-232F3E.svg?logo=amazon-aws&style=for-the-badge
[AWS-url]: https://aws.amazon.com/
[Terraform]: https://img.shields.io/badge/-Terraform-623CE4.svg?logo=terraform&style=for-the-badge
[Terraform-url]: https://www.terraform.io/