# Day 05: Automatic Package Installer
![Bash](https://img.shields.io/badge/Bash-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)

## 🎯 Purpose
An intelligent, cross-distribution package management automation script designed for penetration testers and security professionals. This tool automatically detects the host system's package manager and installs a curated set of essential security tools, enabling rapid environment setup for security assessments, incident response, or forensic investigations.

## 📊 Core Functionality
- **Automatic Package Manager Detection**: Identifies available package managers (APT, YUM, Pacman)
- **Cross-Distribution Support**: Works on Debian/Ubuntu, RHEL/CentOS, and Arch-based systems
- **Essential Tool Installation**: Deploys fundamental security tools including network scanners, programming languages, and utilities
- **Error Handling**: Provides clear feedback on unsupported systems or failed installations

## 🛠️ Technical Implementation

### Detection & Installation Logic:
| System Component | Detection Method | Installation Command |
|------------------|------------------|----------------------|
| **APT Systems** | `command -v apt` | `apt update && apt install -y` |
| **YUM Systems** | `command -v yum` | `yum install -y` |
| **Pacman Systems** | `command -v pacman` | `pacman -Sy --noconfirm` |

### Installed Tool Purpose:
| Package | Primary Use Case | Penetration Testing Phase |
|------------------|------------------|----------------------|
| **nmap** | Network discovery and security auditing | Reconnaissance, Enumeration |
| **python3** | Scripting and tool development | Exploitation, Post-Exploitation |
| **curl** | Data transfer and API interaction | Reconnaissance, Exploitation |
| **git** | Version control and tool acquisition | Preparation, Tool Management |
| **wget** | File retrieval and data gathering | Reconnaissance, Intelligence Gathering |

## 🚀 Use Cases
- **Rapid Environment Provisioning**: Quickly set up fresh systems for penetration testing or security research
- **Cross-Platform Tool Deployment**: Maintain consistent tooling across different Linux distributions
- **Post-Compromise Setup**: Deploy necessary tools on compromised systems during incident response
- **Lab Environment Preparation**: Configure multiple testing environments with identical tooling
- **Educational Purposes**: Demonstrate bash scripting techniques for system automation

## 🔧 Execution & Usage

### Basic Execution:
```bash
# Make the script executable
chmod +x day_05_auto_package_installer.sh

# Run with appropriate privileges
sudo ./day_05_auto_package_installer.sh
```
![Difficulty](https://img.shields.io/badge/Difficulty-Beginner-green)
