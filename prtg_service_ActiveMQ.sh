
#!/bin/bash

###########################################################
#  ActiveMQ status check script for PRTG
#  Works on servers with systemd (service)
#  and older servers without a systemd service.
#
#  Filename: prtg_service_ActiveMQ.sh
###########################################################

SERVICE="activemq.service"

###########################################################
# Step 1: Check if the ActiveMQ systemd service exists
# Using "systemctl status" instead of "list-unit-files"
# prevents the 'Broken pipe' error.
###########################################################
if systemctl status "$SERVICE" >/dev/null 2>&1; then

    # Step 1b: Service exists → check if it is active
    if systemctl is-active --quiet "$SERVICE"; then
        echo "OK"
        exit 0
    else
        echo "FAILED"
        exit 1
    fi
fi

###########################################################
# Step 2: Fallback for older servers without systemd service
# Detect ActiveMQ via process inspection
###########################################################
if ps aux | grep -Eiv "grep|prtg_service_ActiveMQ.sh" | grep -Eq "activemq|apache-activemq|org\.apache\.activemq|bin/activemq"; then
    echo "OK"
    exit 0
else
    echo "FAILED"
    exit 1
fi
