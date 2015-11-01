# Start from a Debian image with the latest version of Go installed
# and a workspace (GOPATH) configured at /go.
FROM golang

ADD . /go/src/toga/blueprint

# Install node
RUN apt-get install curl
RUN curl --silent --location https://deb.nodesource.com/setup_0.12 | bash -
RUN apt-get install nodejs -y


# Build the outyet command inside the container.
# (You may fetch or manage dependencies here,
# either manually or with a tool like "godep".)
RUN go get toga/blueprint
RUN go install toga/blueprint

# Run the outyet command by default when the container starts.
CMD ./bin/blueprint
# Document that the service listens on port 8080.
EXPOSE 8080

