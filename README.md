# Installing my dot files using Homebrew and Stow

### Install with stow:
```bash
stow --target .
```

### Homebrew installation:
```bash
# Leaving a machine
brew leaves > leaves.txt

# Fresh installation
xargs brew install < leaves.txt
