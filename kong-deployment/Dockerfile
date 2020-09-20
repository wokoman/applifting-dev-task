FROM alpine:latest
ARG KONG_CONSUMER_PW
ENV KONG_CONSUMER_PW=$KONG_CONSUMER_PW
RUN apk --no-cache add curl
ADD kong.sh .
RUN chmod +x ./kong.sh
CMD sh kong.sh ${KONG_CONSUMER_PW}