#!/bin/bash

# Create SSL directory
mkdir -p config/nginx/ssl config/nginx/conf.d

echo "Generating self-signed SSL certificates for Nginx..."

# Generate private key
openssl genrsa -out config/nginx/ssl/nginx.key 2048

# Generate certificate signing request
openssl req -new -key config/nginx/ssl/nginx.key -out config/nginx/ssl/nginx.csr -subj "/C=US/ST=State/L=City/O=Organization/OU=OrgUnit/CN=localhost"

# Generate self-signed certificate
openssl x509 -req -days 365 -in config/nginx/ssl/nginx.csr -signkey config/nginx/ssl/nginx.key -out config/nginx/ssl/nginx.crt

# Set proper permissions
chmod 600 config/nginx/ssl/nginx.key
chmod 644 config/nginx/ssl/nginx.crt

# Clean up CSR file
rm config/nginx/ssl/nginx.csr

echo "SSL certificates generated successfully!"
echo "Certificate: config/nginx/ssl/nginx.crt"
echo "Private Key: config/nginx/ssl/nginx.key"
echo ""
echo "Note: These are self-signed certificates for development."
echo "For production, use certificates from a trusted CA."