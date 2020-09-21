FROM alpine:latest
# Pass in password for Kong consumer through CI/CD
ARG KONG_CONSUMER_PW
ENV KONG_CONSUMER_PW=$KONG_CONSUMER_PW
# Install cURL to configure Kong
RUN apk --no-cache add curl
ADD kong.sh .
RUN chmod +x ./kong.sh
# Run configuration skip with password defined in CI/CD
CMD sh kong.sh ${KONG_CONSUMER_PW}