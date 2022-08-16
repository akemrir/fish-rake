# Fish addon

Rake completion from version 13.0.6

# Installation

```bash
fisher add akemrir/fish-rake
```

# Usage

```bash
rake <tab>
```

# Cache

Cache is build on md5sum of pwd in tmp.
To clear cache for current directory:

```bash
$ rake_cache_clear
```

To purge whole cache:

```bash
$ rake_cache_purge
```
