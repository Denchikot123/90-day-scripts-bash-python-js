# day_01_system_info.sh
![Bash](https://img.shields.io/badge/Bash-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)

## 🎯 Purpose
A lightweight system reconnaissance script for penetration testers to quickly gather essential system information during security assessments

## 📊 Output Information
- **Host Identification**: Computer name and current user
- **System Profile**: OS details and kernel version  
- **Uptime Analysis**: System running time
- **Resource Monitoring**: Memory usage and disk space
- **Network Mapping**: Active interfaces and IP addresses

## 🛠️ Technical Implementation

### Core Commands Used:
| Command | Purpose | Flags |
|---------|---------|--------|
| `hostname` | System identification | - |
| `whoami` | Current user context | - |
| `uname -r` | Kernel version | `-r` for kernel release |
| `uptime -p` | System uptime | `-p` for pretty format |
| `free -h` | Memory usage | `-h` for human-readable |
| `df -h` | Disk space | `-h` for human-readable |
| `ip addr` | Network interfaces | - |

### Key Features:
- **Minimalist Design**: No unnecessary bloat
- **Quick Execution**: Runs in 2-3 seconds
- **Pentest-Focused**: Only relevant information for security assessments
- **Readable Output**: Clean formatting for easy analysis

## 💡 Use Cases
- Initial system reconnaissance during penetration tests
- Quick environment verification
- Educational purposes for bash scripting basics

## 🚀 Execution
```bash
chmod +x day_01_system_info.sh
./day_01_system_info.sh
```
![Difficulty](https://img.shields.io/badge/Difficulty-Beginner-green)
