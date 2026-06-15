FROM alpine:latest
RUN apk add --no-cache socat openssl
RUN openssl req -x509 -newkey rsa:2048 -nodes -keyout /key.pem -out /cert.pem -days 365 -subj "/CN=bing.com"
CMD socat OPENSSL-LISTEN:443,bind=0.0.0.0,reuseaddr,cert=/key.pem,key=/key.pem,fork TCP4-LISTEN:1,reuseaddr,fork
