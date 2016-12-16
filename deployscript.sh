#!/bin/bash

scp -o StrictHostKeyChecking=no -i "/var/lib/jenkins/my-ec2-key-pair.pem" /var/lib/jenkins/workspace/tictactoe/docker-compose.yaml ec2-user@35.164.247.194:docker-compose.yml

scp -o StrictHostKeyChecking=no -i "/var/lib/jenkins/my-ec2-key-pair.pem" /var/lib/jenkins/workspace/tictactoe/.env ec2-user@35.164.247.194:.env

ssh -i /var/lib/jenkins/my-ec2-key-pair.pem ec2-user@35.164.247.194 docker-compose up -d