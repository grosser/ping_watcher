# latest fails to run `crystal spec`
# https://github.com/crystal-lang/crystal/issues/3208
FROM crystallang/crystal:0.17.4

RUN mkdir /app
WORKDIR /app

ADD spec spec
ADD src src
ADD bin bin

