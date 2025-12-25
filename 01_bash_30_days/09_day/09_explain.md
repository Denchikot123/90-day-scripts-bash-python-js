# Day 09: Network Ping Scanner
![Bash](https://img.shields.io/badge/Bash-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)

## 🎯 Purpose
A lightweight network discovery tool designed for rapid identification of active hosts in local network segments. This script provides network administrators and security professionals with immediate visibility into device presence within the 192.168.1.0/24 subnet, facilitating network mapping, inventory management, and basic connectivity diagnostics.

## 📊 Core Functionality
- **Subnet Sweeping**: Iterates through all 254 possible host addresses in the target subnet
- **ICMP-Based Discovery**: Uses ping protocol to determine host availability
- **Binary Result Output**: Provides clear ALIVE/ERROR status for each scanned address
- **Execution Timestamping**: Includes scan initiation time for tracking and logging purposes
- **Minimal Output Format**: Presents results in clean, human-readable format for quick analysis

## 🛠️ Technical Implementation

### Scanning Methodology:
| Technique | Protocol | Purpose | Key Characteristics |
|-----------|----------|---------|---------------------|
| **ICMP Echo Request** | ICMP | Host discovery | Single packet with 1-second timeout for rapid scanning |
| **Sequential Iteration** | N/A | Address space coverage | Systematic coverage of complete /24 subnet range |
| **Exit Code Analysis** | N/A | Result interpretation | Zero exit code indicates responsive host |

### Performance Characteristics:
| Parameter | Value | Impact |
|-----------|-------|--------|
| **Packet Count** | 1 per host | Minimizes network traffic while providing basic availability check |
| **Timeout Setting** | 1 second | Balances between speed and network latency tolerance |
| **Address Range** | 1-254 | Covers standard usable host addresses in /24 subnet |
| **Output Suppression** | Full | Redirects all ping output to maintain clean results display |

## 🚀 Use Cases
- **Network Inventory**: Quick identification of active devices on local network segments
- **Connectivity Testing**: Verification of network reachability for troubleshooting
- **Security Auditing**: Discovery of unauthorized or unexpected devices on network
- **Network Mapping**: Initial reconnaissance for network documentation projects
- **Educational Tool**: Demonstration of basic network scanning principles

## 🔧 Execution & Usage

### Basic Execution:
```bash
chmod +x ping_scanner.sh
./ping_scanner.sh
```
![Network](https://img.shields.io/badge/Network-Scanner-blue)
