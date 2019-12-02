# hadolint ignore=DL3006
FROM ubuntu

# hadolint ignore=DL3009
RUN apt-get update

# hadolint ignore=DL3008,DL3015
RUN apt-get install nginx -y

COPY build/index.html /var/www/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
