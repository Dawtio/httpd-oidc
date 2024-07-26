# Simple Httpd stack with 

## Setup

- Update hosts for OIDC Provider
    - `sudo nvim /etc/hosts`
        - add at the end of the file: `127.0.0.1 hydra_server`
- Create certificate and rootCA
    - `docker-compose -f compose-mkcert.yaml up`
- Install rootCA on your local machine
    - (FOR MACOS only) `sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain $(pwd)/mkcert/root/rootCA.pem`
- Start stack
    - `docker-compose -f compose.yaml up`

## Author
- Maxime Brunet <mbrunet@dawtio.cloud>
