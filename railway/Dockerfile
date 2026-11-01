FROM alpine:3.20
RUN apk add --no-cache curl ca-certificates
COPY check.sh /check.sh
RUN chmod +x /check.sh
CMD ["/check.sh"]
