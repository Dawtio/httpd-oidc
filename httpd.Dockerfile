FROM httpd:2.4.62

# Install OIDC apache module.
RUN apt-get update && \
    apt-get install --no-install-recommends -y \
    ca-certificates libapache2-mod-auth-openidc

RUN cp /usr/lib/apache2/modules/mod_auth_openidc.so /usr/local/apache2/modules/mod_auth_openidc.so

# Install rootCA on container.

WORKDIR /usr/local/share/ca-certificates
COPY mkcert/root/rootCA.crt ./
RUN update-ca-certificates

# Get back to normal workdir
WORKDIR /usr/local/apache2
