# Generate a Self-Signed Certificate
 - openssl genpkey -algorithm RSA -out nextcloud.key
 - openssl req -new -key private.key -out csr.pem
 - openssl x509 -req -days 365 -in csr.pem -signkey private.key -out certificate.crt