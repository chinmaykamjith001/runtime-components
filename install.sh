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
