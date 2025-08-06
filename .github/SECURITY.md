# Security Policy

## Supported Versions

We actively support and provide security updates for the following versions:

| Version | Supported          |
| ------- | ------------------ |
| 2.x.x   | :white_check_mark: |
| 1.x.x   | :white_check_mark: |
| < 1.0   | :x:                |

## Reporting a Vulnerability

The custom_quick_alert team takes security seriously. We appreciate your efforts to responsibly disclose vulnerabilities.

### How to Report

Please **DO NOT** report security vulnerabilities through public GitHub issues. Instead, please use one of the following methods:

1. **Preferred**: Report via GitHub Security Advisories
   - Go to the [Security tab](https://github.com/ariyanshiputech/custom_quick_alert/security)
   - Click "Report a vulnerability"
   - Fill out the advisory form with details

2. **Email**: Send details to security@ariyanshipu.tech
   - Include "SECURITY" in the subject line
   - Provide a detailed description of the vulnerability
   - Include steps to reproduce if possible

### What to Include

When reporting a vulnerability, please include:

- **Description**: A clear description of the vulnerability
- **Impact**: What could an attacker do with this vulnerability?
- **Reproduction**: Step-by-step instructions to reproduce the issue
- **Environment**: Flutter/Dart version, platform details
- **Proof of Concept**: If applicable, include PoC code (but please be responsible)

### Response Timeline

- **24 hours**: Initial acknowledgment of your report
- **72 hours**: Initial assessment and severity classification
- **7 days**: Detailed investigation and response plan
- **30 days**: Fix development and testing (for critical issues)

### Security Measures

This project implements the following security measures:

#### Code Security
- ✅ Static code analysis with Dart analyzer
- ✅ Dependency vulnerability scanning
- ✅ CodeQL security analysis
- ✅ License compliance checking
- ✅ Secret scanning (basic)

#### CI/CD Security
- ✅ Pinned GitHub Actions to specific SHA commits
- ✅ Minimal required permissions for each job
- ✅ Isolated build environments
- ✅ Artifact integrity verification
- ✅ OIDC token authentication

#### Development Security
- ✅ Branch protection rules
- ✅ Required status checks
- ✅ Code review requirements
- ✅ Signed commits encouraged

### Security Guidelines for Contributors

If you're contributing to this project:

1. **Never commit secrets**: Use environment variables or secure vaults
2. **Validate inputs**: Always validate and sanitize user inputs
3. **Use HTTPS**: Ensure all external communications use HTTPS
4. **Keep dependencies updated**: Regularly update to latest secure versions
5. **Follow security best practices**: Follow OWASP guidelines where applicable

### Vulnerability Disclosure Process

1. **Receipt**: We acknowledge receipt of your vulnerability report
2. **Assessment**: We assess the impact and severity of the vulnerability
3. **Development**: We develop and test a fix for the vulnerability
4. **Coordination**: We coordinate the release of the fix
5. **Disclosure**: We publicly disclose the vulnerability after the fix is released

### Security Contact

For security-related questions or concerns:

- **Email**: security@ariyanshipu.tech
- **Security Advisory**: [GitHub Security Advisories](https://github.com/ariyanshiputech/custom_quick_alert/security/advisories)

### Recognition

We maintain a security acknowledgments section in our documentation to recognize security researchers who have helped improve our security posture.

## Security Best Practices for Users

When using custom_quick_alert in your applications:

### Input Validation
```dart
// ✅ Good: Validate and sanitize user inputs
QuickAlert.show(
  context: context,
  type: QuickAlertType.info,
  title: sanitizeInput(userTitle), // Sanitize user input
  text: validateAndSanitize(userText),
);

// ❌ Bad: Direct use of unsanitized user input
QuickAlert.show(
  context: context,
  type: QuickAlertType.info,
  title: userInput, // Potentially unsafe
);
```

### Secure Configuration
```dart
// ✅ Good: Use secure defaults
QuickAlert.show(
  context: context,
  type: QuickAlertType.confirm,
  title: 'Confirm Action',
  confirmBtnText: 'Yes',
  cancelBtnText: 'No',
  barrierDismissible: false, // Prevent accidental dismissal
);
```

### Version Management
- Always use the latest stable version
- Monitor security advisories for updates
- Test security updates in a staging environment first

---

**Last Updated**: August 2025
**Version**: 1.0
