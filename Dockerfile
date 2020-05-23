FROM alpine:latest

RUN apk --update add python py-pip openssl ca-certificates    && \
  apk --update add --virtual build-dependencies python-dev libffi-dev openssl-dev build-base  && \
  pip install --upgrade pip pycrypto cffi                   && \
  pip install ansible         && \
  apk --update add openssh-client rsync  && \
  apk del build-dependencies            && \
  rm -rf /var/cache/apk/*

# default command: display Ansible version
CMD [ "ansible-playbook", "--version" ]