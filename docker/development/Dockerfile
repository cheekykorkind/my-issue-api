FROM ruby:2.7.1-slim

RUN apt update && apt upgrade -y && apt install -y curl gnupg && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt update && apt install -y libpq-dev sudo git make nodejs yarn tzdata g++ vim shared-mime-info

ARG UID
ARG GID
ARG UNAME

ENV UID ${UID}
ENV GID ${GID}
ENV UNAME ${UNAME}


RUN useradd --uid $UID --create-home --shell /bin/bash -G sudo,root $UNAME
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

WORKDIR /workspace/myapp

COPY Gemfile /workspace/myapp/Gemfile
COPY Gemfile.lock /workspace/myapp/Gemfile.lock

RUN mkdir -p /workspace/myapp/vendor
RUN bundle config set --local path '/workspace/myapp/vendor'
RUN bundle install

COPY . /workspace/myapp