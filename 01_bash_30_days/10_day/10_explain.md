# Web Directory Scanner
![Bash](https://img.shields.io/badge/Bash-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)
![Security](https://img.shields.io/badge/Security-Tool-red)

## 🎯 Purpose
A targeted web directory discovery script designed for penetration testers and security analysts to systematically identify exposed directories and files on web servers. This tool performs dictionary-based enumeration by testing common web paths against a target URL, filtering results based on meaningful HTTP response codes to reveal potentially sensitive or hidden resources during security assessments.

## 📊 Core Functionality
- **Targeted Path Enumeration**: Methodically tests directory and file names from wordlists against web servers
- **HTTP Response Analysis**: Filters and categorizes discovered resources based on HTTP status codes
- **Flexible Configuration**: Supports custom target URLs and alternative wordlists via command-line arguments
- **Clean Data Processing**: Handles wordlist formatting issues including Windows-style line endings
- **Graceful Error Handling**: Implements timeouts and error suppression for stable scanning operations

## 🛠️ Technical Implementation

### Core Commands & Flags:
| Command / Construct | Purpose | Key Flags/Parameters |
|---------------------|---------|----------------------|
| `curl` | HTTP request execution | `-s` (silent), `-o /dev/null` (discard output), `-w "%{http_code}"` (write HTTP code) |
| `timeout` | Command execution limit | `5` (seconds) - prevents hanging requests |
| `tr -d '\r'` | Character removal | Deletes carriage returns for Windows-compatible wordlists |
| `2>/dev/null` | Error output suppression | Redirects stderr to null device |
| `while IFS= read -r` | File line iteration | Reads wordlist line by line with preserved formatting |
| Positional Parameters | Argument handling | `$1` (target), `$2` (wordlist) for flexible input |

### HTTP Status Code Significance:
| Status Code | Technical Meaning | Security Relevance |
|-------------|------------------|-------------------|
| **200 OK** | Request successful, resource exists | Accessible directories/files, potential information disclosure |
| **301 Moved Permanently** | Resource has permanent redirect | Valid path with redirection, often to login or different location |
| **302 Found** | Resource temporarily moved | Temporary redirects, may indicate protected or moved resources |
| **403 Forbidden** | Access denied to resource | Existing but restricted paths, potential misconfigurations |

## 🚀 Use Cases
- **Penetration Testing**: Initial reconnaissance phase for web application security assessments
- **Bug Bounty Hunting**: Discovery of hidden endpoints and unprotected resources on target domains
- **Asset Discovery**: Mapping accessible web application structure during security audits
- **Compliance Auditing**: Identification of exposed administrative interfaces or sensitive directories
- **Incident Response**: Quick enumeration of web server contents during security investigations
- **Educational Security Labs**: Teaching basic web enumeration techniques in controlled environments

## 🔧 Execution & Usage

### Basic Execution:
```bash
chmod +x web_directory_scanner.sh
./web_directory_scanner.sh https://target-domain.com
```
![Network](https://img.shields.io/badge/Network-Scanner-blue)
