
# ActiveMQ Service Status Check Script (PRTG)

This repository contains a simple and reliable bash script for monitoring **ActiveMQ** using **PRTG Network Monitor**. The script checks whether the ActiveMQ service is running using systemd, and provides a fallback method for older servers where the service may not be registered.

## Script Name
**prtg_service_ActiveMQ.sh**

## Description
The script returns one of two outputs:
- `OK` – when the ActiveMQ service or process is running
- `FAILED` – when the service is stopped or the process cannot be detected

Exit codes:
- `0` → OK
- `1` → FAILED

This makes the script fully compatible with the **PRTG EXE/Script Sensor**.

## Features
- Detects the ActiveMQ systemd service (`activemq.service`)
- Uses `systemctl is-active` for accurate service state detection
- Automatic fallback to process detection for older systems
- Lightweight and fast
- 100% compatible with PRTG monitoring

## Requirements
- Linux server
- Bash shell
- ActiveMQ installed
- PRTG EXE/Script sensor (if used with PRTG)

## Installation
1. Download the script:
   ```bash
   wget <REPLACE-WITH-GITHUB-RAW-URL>/prtg_service_ActiveMQ.sh
   ```

2. Make it executable:
   ```bash
   chmod +x prtg_service_ActiveMQ.sh
   ```

3. (Optional) Move it to a standard monitoring directory:
   ```bash
   sudo mv prtg_service_ActiveMQ.sh /usr/local/bin/
   ```

## Usage
Run the script manually:
```bash
./prtg_service_ActiveMQ.sh
```
Expected output:
```
OK
```
(or `FAILED`)

## Testing
Simulate service failure:
```bash
sudo systemctl stop activemq.service
./prtg_service_ActiveMQ.sh
```
You should now see:
```
FAILED
```

## Contributing
Pull requests are welcome! Feel free to improve detection patterns or add support for other monitoring systems.

## License
This project is released under the **MIT License**.

---
If you need help with a Windows version, PRTG XML template, or auto‑deployment script, feel free to ask!
