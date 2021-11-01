subnets() {
    echo "subnets of $vpc of $x region..."
    aws ec2 describe-subnets --region $x --filters "Name=vpc-id,Values=$vpc" | jq ".Subnets[].SubnetId" | tr -d '"'
    echo "------------------------"
}

get_vpc() {
    for vpc in $(aws ec2 describe-vpcs --region $x | jq ".Vpcs[].VpcId" | tr -d '"'); do
        echo "Vpcs of $x region is $vpc "
        subnets $vpc
    done
}

for x in $@; do
    get_vpc $x
done


printing vpc subnets