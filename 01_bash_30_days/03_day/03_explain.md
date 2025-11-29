# day_03_disk_monitor.sh
![Bash](https://img.shields.io/badge/Bash-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)

## 🎯 Purpose
A practical disk monitoring script for penetration testers to quickly identify storage issues and suspicious large files during security assessments

## 📊 Monitoring Targets
- **Root Partition Usage**: Critical disk space monitoring
- **Large File Detection**: Identifies oversized files system-wide
- **Suspicious Directory Scan**: Checks /tmp, /var/tmp, /dev/shm for anomalous files
- **Resource Analysis**: Automatic alerts when thresholds exceeded

## 🛠️ Technical Implementation

### Core Commands Used:
| Command | Purpose | Flags |
|---------|---------|--------|
| `df` | Disk space analysis | - |
| `awk` | Text processing | `NR==2 {print $5}` for specific column |
| `sed` | Text substitution | `s/%//` to remove percentage symbols |
| `find` | File discovery | `-type f` for files, `-size +100M` for large files |
| `du -sh` | Disk usage summary | `-h` human readable, `-s` summary |
| `sort -rh` | Reverse numerical sort | `-r` reverse, `-h` human readable |
| `wc -l` | Line counting | `-l` for line count |

### Key Features:
- **Threshold Monitoring**: Automatic alerts at 90% disk usage
- **Large File Identification**: Finds and ranks largest files system-wide
- **Suspicious Directory Focus**: Targets common attack vectors (/tmp, /var/tmp)
- **Error Suppression**: Silences permission errors with `2>/dev/null`
- **Performance Optimized**: Minimal system impact during execution

## 💡 Use Cases
- Post-exploitation environment assessment
- Identifying data exfiltration artifacts
- Detecting cryptocurrency mining activity
- System resource monitoring during prolonged engagements

## 🚀 Execution
```bash
chmod +x day_03_disk_monitor.sh
./day_03_disk_monitor.sh
