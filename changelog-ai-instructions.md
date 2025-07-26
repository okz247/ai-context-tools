# Changelog AI Instructions

## File Requirements
- Name: `CHANGELOG.md`
- Location: Project root
- Format: Markdown

## Structure
```markdown
# Changelog

## [Unreleased]

## [Version] - YYYY-MM-DD
### Added
### Changed
### Deprecated
### Removed
### Fixed
### Security
```

## Rules
1. **Order**: Latest version first, then descending by date
2. **Dates**: Use ISO format `YYYY-MM-DD`
3. **Versions**: Include every release, link to tags/commits
4. **Unreleased**: Keep at top for pending changes

## Change Categories
- **Added**: New features
- **Changed**: Modified functionality
- **Deprecated**: Features marked for removal
- **Removed**: Deleted features
- **Fixed**: Bug fixes
- **Security**: Vulnerability patches

## Content Guidelines
1. Write for humans, not machines
2. Group similar changes together
3. Focus on user impact, not implementation
4. Include breaking changes prominently
5. Mark yanked releases as `[YANKED]`

## Don'ts
- Never use raw commit logs
- Don't omit deprecations or breaking changes
- Don't use ambiguous date formats
- Don't leave out important changes

## Example Entry
```markdown
## [1.0.0] - 2023-12-15
### Added
- User authentication system
- API rate limiting

### Fixed
- Memory leak in data processing

### Security
- Patched SQL injection vulnerability
```