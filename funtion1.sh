#!/bin/bash
get_vpc() {
    #regions=$(aws ec2 describe-regions | jq ".Regions[].RegionName" | tr -d '"')
    for vpc in $(aws ec2 describe-vpcs --region $x | jq ".Vpcs[].VpcId" | tr -d '"'); do
        echo "Vpcs of $x region is $vpc"
    done
}

for x in $@; do
    get_vpc $x
done


printing vpcs of how many regions that we give