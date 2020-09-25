FROM gitpod/workspace-full

# Install custom tools, runtimes, etc.
# For example "bastet", a command-line tetris clone:
# RUN brew install bastet
#
# More information: https://www.gitpod.io/docs/config-docker/

USER root

RUN echo "Install Bluemix CLI"
RUN curl -L https://clis.ng.bluemix.net/download/bluemix-cli/latest/linux64 > Bluemix_CLI.tar.gz
RUN tar -xvf Bluemix_CLI.tar.gz
RUN sudo ./Bluemix_CLI/install_bluemix_cli

### Docker client ###
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
    # 'cosmic' not supported
    && add-apt-repository -yu "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" \
    && apt-get install -yq docker-ce-cli=5:18.09.0~3-0~ubuntu-bionic \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/*

USER gitpod