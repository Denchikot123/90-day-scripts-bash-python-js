# day_02_automatic_backup.sh
![Bash](https://img.shields.io/badge/Bash-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)

## 🎯 Purpose
A simple script that copies important/critical files to a created directory (if it doesn't exist) **backup**

## 🛠️ Technical Implementation

### Core Commands Used:
| Command | Purpose | Flags |
|---------|---------|--------|
| `mkdir` | Create backup directory | `-p` for parent directories |
| `cp` | Copy files/directories | `-r` for recursive directory copy |
| `[ -d ]` | Check if path is directory | Conditional test |
| `[ -f ]` | Check if path is file | Conditional test |
| `[ -r ]` | Check if readable | Conditional test |
| `2>/dev/null` | Suppress error output | Redirection |

### Key Features:
- **Dual Backup Strategy**: Handles both individual files and entire directories
- **Permission Awareness**: Checks read permissions before attempting copy
- **Error Suppression**: Silences permission denied errors to avoid detection
- **Rapid Execution**: Minimal overhead for quick data extraction
- **Pentest-Focused**: Targets high-value artifacts (SSH keys, configs, history)

### Script Structure:
```bash
# Configuration
BACKUP_DIR="$HOME/backup"
SOURCE_FILES=("$HOME/.bashrc" "$HOME/.ssh/config")

# Execution flow
1. Create backup directory
2. Copy critical directories
3. Copy individual important files
4. Report completion status
```

## 🚀 Execution
```bash
chmod +x day_02_automatic_backup.sh
./day_02_automatic_backup.sh
```
![Difficulty](https://img.shields.io/badge/Difficulty-Beginner-green)
