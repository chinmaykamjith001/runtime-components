cat << 'EOF' > install.sh
#!/bin/bash
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

for file in .bashrc .zshrc .vimrc .gdbinit .gitconfig; do
  if [ -f "$DIR/$file" ]; then
    cp "$DIR/$file" "$HOME/$file"
    echo "Installed $file to $HOME"
  fi
done
EOF

chmod +x install.sh

# Install cowsay into ~/.local (no root needed)
DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
git clone https://github.com/cowsay-org/cowsay.git
cd cowsay
make install prefix=$HOME/.local

# Add the train cow used by boilersay (site-cows is on cowsay's default path)
mkdir -p "$HOME/.local/share/cowsay/site-cows"
cp "$DOTFILES_DIR/train.cow" "$HOME/.local/share/cowsay/site-cows/"
