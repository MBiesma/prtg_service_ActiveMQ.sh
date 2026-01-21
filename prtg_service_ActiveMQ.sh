#!/bin/bash

###########################################################
#  ActiveMQ status check script for PRTG
#  Works on servers with systemd (service)
#  and older servers without a systemd service.
#
#  Filename: prtg_service_ActiveMQ.sh
###########################################################

SERVICE="activemq.service"

# Step 1: Check if ActiveMQ service exists on this system
if systemctl list-unit-files | grep -qE "^[[:space:]]*${SERVICE}[[:space:]]"; then
    
    # Check if the service is running
    if systemctl is-active --quiet "$SERVICE"; then
        echo "OK"
        exit 0
    else
        echo "FAILED"
        exit 1
    fi
fi

# Step 2: Fallback for older servers — detect ActiveMQ process manually
if ps aux | grep -Eiv "grep|prtg_service_ActiveMQ.sh" | grep -Eq "activemq|apache-activemq|org\.apache\.activemq|bin/activemq"; then
    echo "OK"
    exit 0
else
    echo "FAILED"
    exit 1
fi
