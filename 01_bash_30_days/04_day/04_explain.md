# day_04_file_renaming.sh
![Bash](https://img.shields.io/badge/Bash-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)

## 🎯 Purpose
A collection of practical file renaming scripts for penetration testers to quickly modify, organize, and obfuscate files during security assessments. Contains multiple independent utilities in one file.

## ⚠️ Important Note
This file contains **multiple independent scripts**. Running it directly without modification will cause errors. Use individual sections as needed.

## 📁 Script Collection
### Task 1: Basic Backup Renamer
```bash
for file in *; do
    if [ -f "$file" ]; then
        mv "$file" "bak_$file"
        echo "Renamed $file -> bak_$file"
    fi
done
```

### Task 2: Transliteration Renamer
```bash
for file in *; do
    if [ -f "$file" ]; then
        new=$(echo "$file" | tr "абвгдеёжзийклмнопрстуфхцчшщъыьэюя" "abcdefghijklmnopqrstuvwxyz")
        [ "$file" != "$new" ] && mv "$file" "$new"
    fi
done
```

### Task 3: Extension Changer
```bash
for file in *.html; do
    [ -f "$file" ] && mv "$file" "${file%.html}.txt"
done
```

## 🛠️ Technical Implementation

### Core Commands Used:
| Command | Purpose | Flags |
|---------|---------|--------|
| `for file in *` | Iterates through directory | `*` wildcard |
| `[ -f "$file" ]` | Checks if item is a file | `-f` file test |
| `mv` | Moves/renames files | Source, destination |
| `tr` | Translates characters | Character sets |
| `${file%.html}` | Removes file extension | Parameter expansion |
| `[ "$file" != "$new" ]` | Condition check | String comparison |

### Key Features:
- **Multiple Utilities:** Three independent renaming strategies in one file
- **Safety Checks:** Validates file existence before operations
- **Character Handling:** Supports Cyrillic to Latin transliteration
- **Extension Manipulation:** Bulk file type conversion
- **Pentest-Optimized:** Practical for evidence handling and obfuscation

## 🚀 Execution Instructions
### Individual Task Execution:
```bash
### Task 0/1: Backup renamer
sed -n '1,8p' day_04_file_renaming.sh > backup_renamer.sh
chmod +x backup_renamer.sh
./backup_renamer.sh

### Task 2: Transliteration
sed -n '10,18p' day_04_file_renaming.sh > transliterate.sh
chmod +x transliterate.sh
./transliterate.sh

### Task 3: Extension changer
sed -n '20,24p' day_04_file_renaming.sh > extension_changer.sh
chmod +x extension_changer.sh
./extension_changer.sh
```
![Difficulty](https://img.shields.io/badge/Difficulty-Beginner-green)
![Status](https://img.shields.io/badge/Status-Multi_Script_File-yellow)
