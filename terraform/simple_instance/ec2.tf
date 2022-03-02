provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "ssh_traffic" {
  name        = "ssh_traffic"
  description = "Allow SSH inbound traffic"
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    git_commit           = "820f99525147dbcec610526c846f82e82574d140"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-10-08 07:57:03"
    git_last_modified_by = "39169795+GBaileyMcEwan@users.noreply.github.com"
    git_modifiers        = "39169795+GBaileyMcEwan"
    git_org              = "GBaileyMcEwan"
    git_repo             = "terragoat"
    yor_trace            = "6363a9a6-80e4-49d8-89ab-19f503f2f5d2"
  }
}

resource "aws_instance" "web_server_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ssh_traffic.name}"]
  tags = {
    Name                 = "bc_workshop_ec2"
    git_commit           = "1ba2db610f48148e1de9fd87ec0e368225eb3cc8"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-10-11 08:20:11"
    git_last_modified_by = "niftyshorts@gmail.com"
    git_modifiers        = "39169795+GBaileyMcEwan/niftyshorts"
    git_org              = "GBaileyMcEwan"
    git_repo             = "terragoat"
    yor_trace            = "f184b8ec-085e-4520-81d2-588c0604f3e2"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
