# Build Image
* docker build --no-cache  -t mvctest:latest --build-arg arg=Production .
# Start Container
* docker run --rm -it -p 8080:80  mvctest:latest