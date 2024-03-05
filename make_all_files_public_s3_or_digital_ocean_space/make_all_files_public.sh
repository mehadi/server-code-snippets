#!/bin/bash

# Function to count objects in the bucket
count_objects() {
    aws s3 ls s3://$bucket_name --recursive | wc -l
}

# Check if a bucket name is provided as an argument
if [ $# -eq 1 ]; then
    bucket_name=$1
else
    read -p "Enter the bucket name: " bucket_name
fi

# Check if the bucket name is empty
if [ -z "$bucket_name" ]; then
    echo "No bucket name provided. Exiting..."
    exit 1
fi

# Get a list of all objects in the bucket
objects=$(aws s3 ls s3://$bucket_name --recursive | awk '{print $4}')
total_objects=$(count_objects)
progress=0

# Loop through each object and update its ACL to public-read
for object in $objects; do
    aws s3api put-object-acl --bucket $bucket_name --key $object --acl public-read
    ((progress++))
    echo "Progress: $progress/$total_objects objects processed."
done
