## Installation
1. Install chezmoi [somehow](https://www.chezmoi.io/install/)
2. `chezmoi init arsushko`
3. `chezmoi cd`
4. Optionally `cp desktop.toml ~/.config/chezmoi/chezmoi.toml`
5. `chezmoi apply`

### Installation over SSH

`chezmoi ssh $HOST $GITHUB_USERNAME -- --one-shot`
