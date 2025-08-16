Wazuh Security Stack with Nginx Reverse Proxy
Complete Docker Compose setup for Wazuh Manager, Filebeat, Cloud Custodian, and Nginx reverse proxy.
Quick Start

Generate SSL certificates:
bashchmod +x generate-ssl-certs.sh
./generate-ssl-certs.sh

Generate cluster key:
bashopenssl rand -hex 32 > config/wazuh_cluster.key

Update AWS credentials:
bash# Edit aws_credentials/credentials with your AWS keys

Start the stack:
bashdocker-compose up -d


Access Points

Wazuh Dashboard: https://localhost (HTTPS with SSL)

Username: admin
Password: SecretPassword


Wazuh API: https://localhost:55000
Elasticsearch: https://localhost:9200
HTTP Redirect: http://localhost → https://localhost

Services

nginx-proxy - Reverse proxy with SSL termination
wazuh-manager - SIEM/XDR platform
wazuh-indexer - OpenSearch backend
wazuh-dashboard - Web interface
filebeat - Log shipper (includes Nginx logs)
cloud-custodian - AWS compliance automation
rsyslog - Centralized logging (port 515)

Configuration

Update email addresses in config/custodian/aws-security-policies.yml
Modify AWS credentials in aws_credentials/
Customize security policies as needed

Logs

Cloud Custodian logs: logs/custodian/
Container logs: docker-compose logs [service-name]

Stopping
bashdocker-compose down
Removing Everything
bashdocker-compose down -v --remove-orphans