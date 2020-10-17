sudo apt update && sudo apt install -y build-essential fuse libfuse-dev make automake git libssl-dev && git clone https://github.com/s3fs-fuse/s3fs-fuse.git && cd s3fs-fuse && ./autogen.sh && ./configure && make && sudo make install && cat << EOF | tee -a ~/.passwd-s3fs
AKIAIOEO4E2VOHLxxxxx:2LXBboddEpRLmWl48i3+b4ziwPL3bJ4vxxxxxxxx
EOF
chmod 600 ~/.passwd-s3fs