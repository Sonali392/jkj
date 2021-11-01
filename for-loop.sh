#!/bin/bash
Userinput=$1
Region=$(aws ec2 describe-regions | jq ".Regions[].RegionName" | tr -d '"')
    if [[ ${Region[@]} =~ ${Userinput} ]]; then
        echo printing subnets of $Userinput
        for vpc in $(aws ec2 describe-vpcs --region $Userinput | jq ".Vpcs[].VpcId" | tr -d '"'); do
            echo "subnets of $vpc of $Userinput ..."
            aws ec2 describe-subnets --region $Userinput --filters "Name=vpc-id,Values=$vpc" | jq ".Subnets[].SubnetId" | tr -d '"'
        done
    else
        echo "please give vaild region."
    fi


Printing subnets of given region 