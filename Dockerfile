FROM java:latest

# move over files to image
ADD . /src

# set working directory to source code directory
WORKDIR /src

# compile
RUN javac Main.java

# execute compiled code
RUN java Main

# generate docs
RUN javadoc Main.java

# host documentation server
ENTRYPOINT cd docs && python -m SimpleHTTPServer 8000

# listen to documentation server on port 8001
EXPOSE 8000
