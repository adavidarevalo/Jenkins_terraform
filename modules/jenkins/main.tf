module "JenkinsEc2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.1"

  depends_on = [aws_security_group.jenkins_sg]

  ami           = var.ami_id
  instance_type = "t2.micro"

  # Specify the public subnet for the Jenkins instance
  subnet_id = var.subnet_id

  # Automatically assign a public IPv4 address
  associate_public_ip_address = true

  # Security groups for the Jenkins instance
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]

  # SSH key pair name
  key_name = var.key_pair_name

  # Reference the external user data file
  user_data = file("${path.module}/user_data/jenkins_install.sh")

  # Tags for the Jenkins EC2 instance
  tags = {
    Name = "JenkinsServer"
  }
}
