sudo apt update && sudo apt install -y s3fs && cat << EOF | tee -a ~/.passwd-s3fs
AKIAIOEO4E2VOHLxxxxx:2LXBboddEpRLmWl48i3+b4ziwPL3bJ4vxxxxxxxx
EOF
chmod 600 ~/.passwd-s3fs