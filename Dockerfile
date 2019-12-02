FROM ubuntu
RUN apt-get update
RUN apt-get -y install build-essential flex bison libreadline6-dev zlib1g-dev && \
    rm -rf /var/lib/apt/lists/*
# needed to run initdb & co. from now on
RUN useradd -ms /bin/bash postgres
CMD ["/bin/bash"]