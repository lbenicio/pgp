# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.1] - 2026-10-16

### Changed

- Replaced the GitHub Pages deployment with the existing AWS S3 and CloudFront stack.
- Resolved the deployment bucket and distribution from CloudFormation outputs before publishing `dist/`.
