`lslint` is a tool to check the syntactic and semantic validity of Second Life LSL scripts.

[![Build Status](https://github.com/Makopo/lslint/workflows/Test/badge.svg)](https://github.com/Makopo/lslint/actions)
[![Release](https://github.com/Makopo/lslint/workflows/Release/badge.svg)](https://github.com/Makopo/lslint/actions)

#### Releases

See [Releases](https://github.com/Makopo/lslint/releases) for binaries.
Latest release resides [here](https://github.com/Makopo/lslint/releases/latest).

Automated builds are available for:
- Linux (x86_64, x86)
- macOS (x86_64, ARM64)
- Windows (x86_64, x86)

Releases are automatically created when code is pushed to the `master` branch, and when builtin definitions are updated daily.

#### Versioning System

This project uses an automatic versioning system based on commit hashes:

```
lsl-{lsl_hash}-src-{src_hash}
```

Where:
- `{lsl_hash}` is the commit hash from [secondlife/lsl-definitions](https://github.com/secondlife/lsl-definitions)
- `{src_hash}` is the commit hash from our source code

This ensures every release can be traced back to the exact state of both the LSL definitions and our source code.

#### Compiling
* `make` should be all that's required on POSIX systems, and a solution file exists for VS2015 on Windows.
* [Win flex-bison](http://sourceforge.net/projects/winflexbison/) as well as VS2015 or [SDK7.0](https://www.microsoft.com/download/details.aspx?id=3138) or later are required for Windows build. See the comment in [NMakefile](NMakefile) for detailed instructions.

#### Automated Builds
GitHub Actions workflows handle:
- **Test workflow**: Runs on every push/PR to validate builds across all platforms
- **Release workflow**: Creates releases with binaries for all supported architectures when code is pushed to master
- **Builtin update workflow**: Daily checks for builtin definition updates and automatically creates releases when needed

Releases are automatically triggered by:
- Pushing code changes to the `master` branch
- Daily builtin definition updates (when changes are detected)

No manual tagging is required - every push to master creates a new release with the combined version identifier.

#### License
All code is public domain unless otherwise noted.

LSL scripts are from various sources and the property of their respective owners.

`.l` and `.y` files are based on samples provided by Linden Lab.

**WARNING:** `lslint` faithfully reproduced all the quirks of the LSL compiler circa ~2006,
like having constants as lexer tokens, events as part of the parser grammar,
and lots of right recursion. From a compiler perspective, it does everything
wrong, and is not recommended as a base for anything but a lint tool.

#### Additional changes
##### Makopoppo
* added nmake support (see NMAkefile for details).
* dropped builtins.txt creator. if you look for new builtins.txt, see [kwdb project](https://github.com/Sei-Lisa/kwdb)
* enabled appending the input file path to the result lines by "-p".

##### Xenhat
* Makefile-less VS2015 support (more cpp hybridization was necessary)
    * Side effects includes x86_64 binary, x86 is possible still

##### Sei-Lisa
* added Mono mode (-m for Mono(default), -m- for LSO)
* added option to make the warning on unused event parameters optional (-u to enable, -u- to disable)
* added option to ignore preprocessor commands (-i)
* added switch() statement and lazy list support
* added god mode support
* added reporting of several errors and warnings
* numerous bug fixes and enhancements

#### Special Thanks
* Strife Onizuka
* Howie Lament
* Cory Linden
* Huns Valen
* Doran Zemlja / Adam Wozniak

#### Shout Outs
* Daniel Linden
* Bakuzelas Khan
* One Song
* Otacon Falcone
* Shokra Patel
