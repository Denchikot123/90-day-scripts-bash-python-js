# Day 08: Process Monitor
![Bash](https://img.shields.io/badge/Bash-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)

## 🎯 Purpose
An advanced process monitoring tool designed for security analysts and incident responders to rapidly identify suspicious system processes and potential malware artifacts. This script provides comprehensive visibility into process anomalies by combining multiple detection techniques: hidden process identification, parent-child relationship analysis, network connection mapping, and signature-based threat hunting in a single execution.

## 📊 Core Functionality
- **Hidden Process Detection**: Identifies kernel-level and stealth processes typically hidden from standard process lists
- **Parent-Child Anomaly Analysis**: Flags processes with unusual parent relationships that bypass normal system initialization
- **Network Activity Correlation**: Maps active network connections to running processes for lateral movement detection
- **Threat Signature Scanning**: Scans process names and commands for known malicious patterns and attacker tools
- **Real-Time System Snapshot**: Provides timestamped execution context for incident timeline reconstruction

## 🛠️ Technical Implementation

### Core Commands & Techniques:
| Command / Technique | Purpose | Key Implementation Details |
|---------------------|---------|-----------------------------|
| `ps aux` + `grep` | Hidden process identification | Pattern matching for bracketed process names |
| `ps -eo` + `awk` | Parent-child relationship analysis | Field filtering with conditional logic on PPID values |
| `netstat -tulpn` | Network process mapping | Protocol-specific filtering with error suppression |
| `grep -iE` + regex | Threat signature detection | Case-insensitive multi-pattern matching with exclusion filters |
| `head` | Output throttling | Limits results to prevent terminal flooding while maintaining readability |

### Detection Logic Breakdown:
| Detection Category | Technical Approach | Security Significance |
|-------------------|-------------------|-----------------------|
| **Hidden Processes** | Processes enclosed in `[ ]` brackets | Often indicate kernel modules, rootkits, or low-level system processes |
| **Orphaned Processes** | PPID ≠ 1 with non-system commands | Malware often detaches from parent processes to persist |
| **Network Anomalies** | Unexpected LISTEN/ESTABLISHED states | Backdoors and C2 channels typically establish persistent connections |
| **Malware Signatures** | Keyword matching for common threats | Rapid identification of known malicious tools and techniques |

## 🚀 Use Cases
- **Incident Response Triage**: Immediate process snapshot during suspected compromise to identify malicious actors
- **Malware Hunting**: Proactive scanning for hidden processes and anomalous parent-child relationships
- **System Baseline Comparison**: Establish normal process behavior for anomaly detection systems
- **Post-Exploitation Analysis**: Identify persistence mechanisms and lateral movement artifacts
- **Security Automation**: Integration into SOC monitoring pipelines for real-time process anomaly detection

## 🔧 Execution & Usage

### Basic Execution:
```bash
chmod +x day_08_process_hunter.sh
./day_08_process_hunter.sh
```
![Difficulty](https://img.shields.io/badge/Difficulty-Beginner-green)
