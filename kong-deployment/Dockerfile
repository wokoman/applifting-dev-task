FROM praqma/network-multitool
ARG KONG_CONSUMER_PW
ENV KONG_CONSUMER_PW=$KONG_CONSUMER_PW
ADD kong.sh .
RUN chmod +x ./kong.sh
CMD ["sh","-c","./kong.sh ${KONG_CONSUMER_PW}"]  