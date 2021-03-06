FROM httpd:latest
# FROM debian:buster-slim
RUN apt-get update && apt-get install -y --no-install-recommends \
    apache2-bin \
    ca-certificates \
    libapache2-mod-auth-openidc \
 && rm -rf /var/lib/apt/lists/*
COPY oidc-proxy.conf /usr/local/apache2/conf/extra/
COPY random_password /random_password
RUN chmod 700 /random_password \
 && echo "Include conf/extra/oidc-proxy.conf" >> conf/httpd.conf
