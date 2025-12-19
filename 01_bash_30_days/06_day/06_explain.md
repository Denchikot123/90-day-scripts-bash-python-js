# Day 06: Critical Error Log Analyzer
![Bash](https://img.shields.io/badge/Bash-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)

## 🎯 Purpose
A proactive log analysis script designed for security practitioners to automatically scan system logs for critical error messages and security-related events. This tool provides a quick health and security assessment of a Linux system by identifying potential failures, access denials, and kernel issues that often precede or indicate security incidents.

## 📊 Core Functionality
- **Automated Log Scanning**: Systematically examines multiple critical log files in the `/var/log` directory
- **Pattern-Based Detection**: Searches for predefined error patterns indicating system failures, security violations, and critical events
- **Quantified Results**: Provides match counts for each error pattern across different log sources
- **Silent Operation**: Includes error suppression for missing log files to maintain clean output

## 🛠️ Technical Implementation

### Core Commands & Flags:
| Command / Construct | Purpose | Key Flags/Parameters |
|---------------------|---------|----------------------|
| `grep` | Pattern searching in text files | `-i` (case-insensitive), `-c` (count matches) |
| `[ -f ]` | File existence check | Tests if file exists and is regular |
| `2>/dev/null` | Error output suppression | Redirects stderr to null device |
| Array Variables | Stores patterns and filenames | Enables iterative processing |
| `for` loops | Iterates through arrays | Processes all patterns and log files |

### Error Pattern Significance:
| Pattern Category | Common Indications | Security Relevance |
|------------------|-------------------|-------------------|
| **error** | Application/service failures | May indicate DoS conditions or exploit attempts |
| **critical** | System-level failures | Often precedes system instability or compromise |
| **fail** | Operation failures | Authentication failures, service start failures |
| **panic** | Kernel-level crashes | Critical system instability, possible driver exploits |
| **denied** | Permission/access violations | Unauthorized access attempts, policy violations |
| **corrupt** | Data integrity issues | Possible storage problems or tampering |

## 🚀 Use Cases
- **System Health Auditing**: Quick assessment of system stability and error conditions during security assessments
- **Incident Triage**: Initial investigation of potentially compromised systems by scanning for anomalous errors
- **Compliance Checking**: Verification of system logging and error reporting capabilities
- **Post-Exploitation Analysis**: Identifying system damage or instability after security incidents
- **Baseline Establishment**: Creating error profile baselines for anomaly detection in monitored systems

## 🔧 Execution & Usage

### Basic Execution:
```bash
chmod +x day_06_critical_error_analyzer.sh
./day_06_critical_error_analyzer.sh
```
