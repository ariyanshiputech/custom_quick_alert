# Contributing to Custom Quick Alert 🤝

Thank you for your interest in contributing to Custom Quick Alert! We welcome contributions from the community and are excited to work with you.

## 📋 Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [Development Setup](#development-setup)
- [How to Contribute](#how-to-contribute)
- [Coding Standards](#coding-standards)
- [Testing Guidelines](#testing-guidelines)
- [Documentation Guidelines](#documentation-guidelines)
- [Pull Request Process](#pull-request-process)
- [Release Process](#release-process)
- [Community](#community)

## 📜 Code of Conduct

This project and everyone participating in it is governed by our [Code of Conduct](CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code.

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK (latest stable version)
- Git
- IDE with Flutter support (VS Code, IntelliJ, Android Studio)

### Useful Commands

```bash
# Check Flutter installation
flutter doctor

# Run tests
flutter test

# Run analysis
flutter analyze

# Format code
dart format .

# Run example app
cd example && flutter run
```

## 🛠️ Development Setup

1. **Fork the repository**
   ```bash
   # Fork on GitHub, then clone your fork
   git clone https://github.com/YOUR_USERNAME/custom_quick_alert.git
   cd custom_quick_alert
   ```

2. **Install dependencies**
   ```bash
   # Install main package dependencies
   flutter pub get
   
   # Install example app dependencies
   cd example
   flutter pub get
   cd ..
   ```

3. **Verify setup**
   ```bash
   # Run tests to ensure everything works
   flutter test
   
   # Run the example app
   cd example
   flutter run
   ```

4. **Create a branch**
   ```bash
   git checkout -b feature/your-feature-name
   # or
   git checkout -b fix/your-bug-fix
   ```

## 🤝 How to Contribute

### 🐛 Reporting Bugs

1. Search existing issues to avoid duplicates
2. Use the [Bug Report template](.github/ISSUE_TEMPLATE/bug_report.yml)
3. Include minimal reproduction steps
4. Provide relevant system information

### ✨ Suggesting Features

1. Check existing feature requests
2. Use the [Feature Request template](.github/ISSUE_TEMPLATE/feature_request.yml)
3. Explain the use case and benefits
4. Consider backwards compatibility

### 📚 Improving Documentation

1. Use the [Documentation Issue template](.github/ISSUE_TEMPLATE/documentation.yml)
2. Check for typos, outdated information, or missing content
3. Suggest improvements for clarity and completeness

### 💻 Code Contributions

1. **Small changes**: Feel free to open a PR directly
2. **Large changes**: Create an issue first to discuss the approach
3. **Breaking changes**: Must be discussed and approved by maintainers

## 📝 Coding Standards

### Dart Style Guide

We follow the [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style) with these additions:

```dart
// ✅ Good: Use descriptive names
CustomQuickAlert.showSuccess(
  title: 'Payment Successful',
  message: 'Your transaction has been completed.',
);

// ❌ Bad: Unclear names
CustomQuickAlert.show(
  t: 'Success',
  m: 'Done.',
);
```

### Code Organization

```
lib/
├── src/
│   ├── enums/           # Enumerations
│   ├── models/          # Data models
│   ├── utils/           # Utility functions
│   └── widgets/         # UI components
├── custom_quick_alert.dart  # Main export file
```

### Documentation Standards

```dart
/// Shows a success alert with the given [title] and [message].
/// 
/// The [title] parameter is required and should be concise.
/// The [message] parameter provides additional context.
/// 
/// Example:
/// ```dart
/// await CustomQuickAlert.showSuccess(
///   title: 'Success!',
///   message: 'Operation completed successfully.',
/// );
/// ```
/// 
/// Returns a [Future] that completes when the alert is dismissed.
static Future<void> showSuccess({
  required String title,
  String? message,
}) async {
  // Implementation
}
```

### Commit Message Format

We use [Conventional Commits](https://www.conventionalcommits.org/):

```
type(scope): description

[optional body]

[optional footer]
```

**Types:**
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting, etc.)
- `refactor`: Code refactoring
- `test`: Adding or updating tests
- `chore`: Build process or auxiliary tool changes

**Examples:**
```
feat(alerts): add custom background color support

fix(animations): resolve scale animation timing issue

docs(readme): update installation instructions

test(unit): add comprehensive alert type tests
```

## 🧪 Testing Guidelines

### Test Structure

```
test/
├── unit/               # Unit tests
├── widget/             # Widget tests
├── integration/        # Integration tests
└── test_utils/         # Test utilities
```

### Writing Tests

```dart
// ✅ Good: Descriptive test names
testWidgets('should show success alert with custom title and message', (tester) async {
  // Arrange
  const title = 'Test Success';
  const message = 'This is a test message';
  
  // Act
  await CustomQuickAlert.showSuccess(
    title: title,
    message: message,
  );
  await tester.pumpAndSettle();
  
  // Assert
  expect(find.text(title), findsOneWidget);
  expect(find.text(message), findsOneWidget);
});

// ❌ Bad: Unclear test purpose
testWidgets('test success', (tester) async {
  // Test implementation
});
```

### Test Coverage

- Aim for >90% code coverage
- Test both happy paths and edge cases
- Include accessibility tests
- Test on multiple platforms when relevant

### Running Tests

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage

# Run specific test file
flutter test test/unit/custom_quick_alert_test.dart

# Run tests for specific platform
flutter test --platform chrome  # Web
flutter test integration_test/   # Integration tests
```

## 📖 Documentation Guidelines

### API Documentation

- Use `///` for public APIs
- Include examples for complex features
- Document parameters, return values, and exceptions
- Keep examples up-to-date

### README Updates

- Update installation instructions for breaking changes
- Add new features to the feature list
- Update examples when APIs change
- Keep the changelog current

### Code Comments

```dart
// ✅ Good: Explain the "why"
// We delay the animation to ensure the widget is fully mounted
// before starting the transition animation
await Future.delayed(const Duration(milliseconds: 100));

// ❌ Bad: Explain the "what" (obvious from code)
// Set the title to the provided title
this.title = title;
```

## 🔄 Pull Request Process

### Before Submitting

1. **Rebase your branch**
   ```bash
   git fetch origin
   git rebase origin/main
   ```

2. **Run quality checks**
   ```bash
   # Format code
   dart format .
   
   # Analyze code
   flutter analyze
   
   # Run tests
   flutter test
   ```

3. **Update documentation**
   - Update relevant documentation files
   - Add examples for new features
   - Update CHANGELOG.md

### PR Requirements

- [ ] Code follows style guidelines
- [ ] All tests pass
- [ ] New functionality is tested
- [ ] Documentation is updated
- [ ] CHANGELOG.md is updated (for user-facing changes)
- [ ] No breaking changes (or properly documented)

### Review Process

1. **Automated checks**: CI must pass
2. **Code review**: At least one maintainer approval
3. **Testing**: Manual testing on relevant platforms
4. **Documentation**: Verify docs are accurate and complete

### After Approval

- PRs are typically squash-merged to maintain clean history
- Release notes are generated from commit messages
- Breaking changes trigger major version bumps

## 🚀 Release Process

### Version Numbering

We follow [Semantic Versioning](https://semver.org/):

- **MAJOR**: Breaking changes
- **MINOR**: New features (backwards compatible)
- **PATCH**: Bug fixes (backwards compatible)

### Release Steps

1. Update version in `pubspec.yaml`
2. Update CHANGELOG.md
3. Create and merge PR
4. Tag release with version number
5. Publish to pub.dev
6. Create GitHub release with notes

## 🌟 Recognition

Contributors are recognized in:
- CHANGELOG.md for significant contributions
- GitHub releases for feature contributions
- Project README for major contributions

## 💬 Community

### Getting Help

- **Discussions**: Use GitHub Discussions for questions
- **Issues**: Use for bug reports and feature requests
- **Discord**: Join our community server (link in README)

### Communication Guidelines

- Be respectful and inclusive
- Search before asking questions
- Provide context and examples
- Help others when you can

## 📞 Contact

- **Maintainer**: @ariyanshiputech
- **Email**: contact@ariyanshiputech.com
- **Website**: https://ariyanshiputech.com

## 📄 License

By contributing to Custom Quick Alert, you agree that your contributions will be licensed under the same license as the project (MIT License).

---

Thank you for contributing to Custom Quick Alert! 🎉

Your contributions help make this package better for the entire Flutter community.
