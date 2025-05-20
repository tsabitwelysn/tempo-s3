#!/bin/sh
set -e

# Create a copy of the template
cp /etc/tempo.yaml.template /etc/tempo.yaml

# Replace environment variables in the config file
sed -i "s|\${S3_BUCKET_NAME}|$S3_BUCKET_NAME|g" /etc/tempo.yaml
sed -i "s|\${S3_REGION}|$S3_REGION|g" /etc/tempo.yaml
sed -i "s|\${S3_ENDPOINT}|$S3_ENDPOINT|g" /etc/tempo.yaml
sed -i "s|\${S3_ACCESS_KEY_ID}|$S3_ACCESS_KEY_ID|g" /etc/tempo.yaml
sed -i "s|\${S3_SECRET_ACCESS_KEY}|$S3_SECRET_ACCESS_KEY|g" /etc/tempo.yaml

# Execute the original command
exec /bin/tempo -config.file=/etc/tempo.yaml

# #!/bin/bash
# set -e

# # Create the final config by substituting environment variables
# envsubst < /etc/tempo.yaml.template > /etc/tempo.yaml

# # Execute the original command
# exec /bin/tempo-linux-amd64 -config.file=/etc/tempo.yaml