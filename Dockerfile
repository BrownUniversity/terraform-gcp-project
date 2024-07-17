FROM hashicorp/terraform:1.9.2

COPY .tool-versions .tool-versions

# Update and install all of the required packages.
# At the end, remove the apk cache
RUN apk upgrade && \
    apk add --update \
    bash \
    curl-dev \
    curl \
    "ruby-dev=~$(grep ruby .tool-versions | awk '{print $2}' | tr -d '\n')" \
    "ruby-full=~$(grep ruby .tool-versions | awk '{print $2}' | tr -d '\n')" \
    build-base \
    python3 && \
    rm -rf /var/cache/apk/*

RUN mkdir /usr/app
WORKDIR /usr/app

COPY Gemfile* ./
RUN gem install bundler && \
    bundle config set system 'true' && \
    bundle install


ENTRYPOINT ["/bin/bash"]