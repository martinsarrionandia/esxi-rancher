#!/bin/bash

CONFIG="centos8-rancher.json"
RANCHER_HOSTNAME=$( < $CONFIG jq --raw-output '.variables.hostname')

TF_VAR_api_url="https://$RANCHER_HOSTNAME"


cd terraform || exit

rm *.tfstate
terraform init
terraform apply --auto-approve
terraform output kube_config > ~/.kube/config
