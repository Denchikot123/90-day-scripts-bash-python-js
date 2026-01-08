# Web Directory Scanner
![Bash](https://img.shields.io/badge/Bash-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)

## 🎯 Purpose
A lightweight web directory enumeration tool designed for security assessments and web application reconnaissance. This script systematically probes a target web server for common directories and files using HTTP status code analysis, providing security professionals and developers with visibility into potentially exposed resources during penetration testing and security audits.

## 📊 Core Functionality
- **Dictionary-Based Enumeration**: Leverages wordlists to systematically test common directory and file names
- **HTTP Status Code Analysis**: Filters responses based on meaningful HTTP status codes (200, 301, 302, 403)
- **Flexible Target Specification**: Supports custom target URLs through command-line arguments
- **Configurable Wordlists**: Allows specification of custom wordlists for tailored scanning
- **Clean Output Formatting**: Presents discovered resources with corresponding HTTP status codes
- **Timeout Protection**: Implements request timeouts to prevent hanging on unresponsive endpoints

## 🛠️ Technical Implementation

### Scanning Methodology:
| Technique | Protocol | Purpose | Key Characteristics |
|-----------|----------|---------|---------------------|
| **Wordlist Iteration** | N/A | Directory discovery | Sequential testing of dictionary entries against target base URL |
| **HTTP Status Filtering** | HTTP | Response validation | Filters for meaningful status codes (200 OK, 301/302 Redirects, 403 Forbidden) |
| **cURL Integration** | HTTP/HTTPS | Network requests | Uses curl with silent mode and custom output formatting for efficiency |
| **Input Sanitization** | N/A | Data cleaning | Removes carriage returns and special characters from wordlist entries |

### Performance Characteristics:
| Parameter | Impact | Configuration |
|-----------|--------|---------------|
| **Request Timeout** | Prevents script hanging on unresponsive targets | 5-second timeout per request |
| **Wordlist Flexibility** | Enables targeted or broad scanning | Default: Kali common.txt, Custom: User-specified |
| **Output Filtering** | Reduces noise in results | Only shows specific HTTP status codes |
| **Error Suppression** | Maintains clean output | Redirects stderr to /dev/null |

## 🚀 Use Cases
- **Security Auditing**: Identification of exposed directories and files during penetration tests
- **Web Application Reconnaissance**: Discovery of hidden resources and administrative interfaces
- **Bug Bounty Hunting**: Initial enumeration phase for web application targets
- **Compliance Testing**: Verification of proper access controls and directory permissions
- **Educational Purposes**: Demonstration of basic web directory brute-forcing techniques
- **Asset Discovery**: Mapping of web application structure and available endpoints

## 🔧 Execution & Usage

### Basic Execution:
```bash
chmod +x dir_scanner.sh
./dir_scanner.sh https://target-website.com
```
![Network](https://img.shields.io/badge/Network-Scanner-blue)
