FROM --platform=linux/arm64 elixir:1.17.1-alpine
EXPOSE 4001

COPY . .

RUN apk update --no-cache
RUN apk add --no-cache build-base gcc curl git wget nodejs npm

#Initial setup
RUN mix deps.get --only prod
RUN MIX_ENV=prod mix compile

RUN chmod +x entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
