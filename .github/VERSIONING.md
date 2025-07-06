# Versioning System

This document explains the versioning system used for `lslint` releases.

## Version Format

All `lslint` builds use the following version format:

```
lsl-{lsl_hash}-src-{src_hash}
```

Where:
- `{lsl_hash}` is the first 7 characters of the commit hash from the [secondlife/lsl-definitions](https://github.com/secondlife/lsl-definitions) repository
- `{src_hash}` is the first 7 characters of the commit hash from our source code repository

### Example

```
lsl-a1b2c3d-src-x7y8z9w
```

This means:
- Built with LSL definitions from commit `a1b2c3d` in the secondlife/lsl-definitions repository
- Built with source code from commit `x7y8z9w` in our repository

## Release Triggers

Releases are automatically created when:

1. **Code is pushed to the `master` branch** - This triggers the release workflow
2. **Builtins are updated** - The daily builtin update workflow will commit changes and push to master, triggering a release

## Benefits of This System

1. **Traceability**: Every release can be traced back to the exact state of both the LSL definitions and our source code
2. **Automatic Updates**: When Second Life updates their LSL definitions, we automatically get new releases
3. **Consistency**: Version numbers are deterministic and based on actual code state rather than manual versioning
4. **Granular Tracking**: We can see exactly what changed between releases

## Understanding Releases

### When LSL Definitions Update
If Second Life adds new functions or changes existing ones, the LSL definitions repository will be updated. Our daily builtin update workflow will detect this and create a new release with the updated definitions.

### When Source Code Changes
When we fix bugs or add features to lslint itself, pushing to master will create a new release with the updated source code.

### When Both Change
If both the LSL definitions and our source code change, the version will reflect both updates.

## Finding Specific Versions

To find what's in a specific release:

1. Look at the version string: `lsl-a1b2c3d-src-x7y8z9w`
2. Check the LSL definitions at: `https://github.com/secondlife/lsl-definitions/commit/a1b2c3d`
3. Check our source code at: `https://github.com/Makopo/lslint/commit/x7y8z9w`

## Binary Naming

Release binaries are named as:
```
lslint-{version}-{platform}-{arch}.zip
```

Examples:
- `lslint-lsl-a1b2c3d-src-x7y8z9w-linux-x64.zip`
- `lslint-lsl-a1b2c3d-src-x7y8z9w-windows-x86.zip`
- `lslint-lsl-a1b2c3d-src-x7y8z9w-macos-arm64.zip`

## Manual Releases

While releases are automatic, you can also trigger them manually:

1. **Via GitHub Actions UI**: Go to the Actions tab and run the "Release" workflow
2. **By pushing to master**: Any push to the master branch will trigger a release
3. **By updating builtins**: Run the "Update Builtins" workflow manually

## Workflow Files

The versioning system is implemented in:
- `.github/workflows/release.yml` - Main release workflow
- `.github/workflows/builtins.yml` - Builtin update workflow  
- `.github/workflows/test.yml` - Testing with version info

All workflows use the same versioning logic to ensure consistency.