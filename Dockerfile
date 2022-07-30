FROM ruby:3.1.2 AS nodejs

WORKDIR /tmp

RUN curl -LO https://nodejs.org/dist/v16.16.0/node-v16.16.0-linux-x64.tar.xz
RUN tar xf node-v*-linux-x64.tar.xz
RUN mv node-v*-linux-x64 node

# ============================================================
FROM ruby:3.1.2

COPY --from=nodejs /tmp/node /opt/node
ENV PATH /opt/node/bin:$PATH

RUN curl -o - -L https://yarnpkg.com/install.sh | bash
ENV PATH /root/.yarn/bin:/root/.config/yarn/global/node_modules/.bin:$PATH

RUN gem install bundler

RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

WORKDIR /app

RUN bundle config set path vendor/bundle
CMD ["bash"]

