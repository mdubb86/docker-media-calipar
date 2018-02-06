FROM ubuntu:xenial

# Install python3/flash and mediainfo
RUN apt-get update && DEBIAN_FRONTEND="noninteractive" apt-get install -y \
  python3-pip \
  mediainfo && \
  pip3 install --upgrade pip && \
  pip3 install flask

# Set Flash app
ENV FLASK_APP /root/calipar.py

# Set some environment variables Flask likes
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

# Expose default Flash port
EXPOSE 5000

# Set the entry point
ENTRYPOINT ["flask", "run", "--host=0.0.0.0"]

# Copy flask app
COPY calipar.py /root/

