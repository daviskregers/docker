# Use an existing docker image as a base
FROM alpine

# Download and install all dependencies
RUN  apk add --update redis

# Tell the image what to do when it starts as a container
CMD ["redis-server"]