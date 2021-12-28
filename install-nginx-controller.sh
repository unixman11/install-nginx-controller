#!/bin/bash

export CTR_SMTP_HOST=localhost
export CTR_SMTP_PORT=25
export CTR_SMTP_AUTH=false
export CTR_SMTP_TLS=false
export CTR_SMTP_FROM=admin@example.com
export CTR_FQDN=controller.example.com
export CTR_FIRSTNAME=Example
export CTR_LASTNAME=NaJa
export CTR_EMAIL=admin@example.com
export CTR_PASSWORD=P@ssw0rd
cd /tmp/
tar xzf controller-installer-3.18.2.tar.gz
cd controller-installer
./helper.sh prereqs
./install.sh --tsdb-volume-type local --self-signed-cert --non-interactive --accept-license
