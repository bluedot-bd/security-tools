# Open Source Security Tools Collection

Welcome to our collection of open-source security tools. This repository is a curated set of security tools developed by the community, along with contributions from Bluedot Technology Ltd and eesec.org. It also includes several bash-based installers for easy setup and deployment of these tools.

Before using any script or tool from this repository, we strongly advise users to review the bash code and its source to ensure security and compatibility with your system.

## Installation

Each tool in this collection comes with its own set of installation instructions.

### Ipset Based IP BlockList (Auto Update)

The "Ipset Based IP BlockList" is your go-to for automatic, top-notch network protection. Straight out of the gate, it integrates iptables and ipset to fine-tune your firewall settings. But the real MVP here is the integration with **stamparm's ipsum dataset**, which cleverly filters out IPs flagged in more than 3 blacklists. This tool doesn't just stop after the initial setup; it diligently updates your IP blacklist hourly through a scripted process and a cron job, ensuring your defenses are always a step ahead of threats. It's hands-off, hassle-free security maintenance that keeps you protected without any daily to-dos on your part.

Source: https://github.com/stamparm/ipsum
```bash
wget https://raw.githubusercontent.com/bluedot-bd/security-tools/main/ipset-block-list-install.sh && sudo bash ipset-block-list-install.sh
```
