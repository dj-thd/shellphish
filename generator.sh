#!/bin/bash

# Get number of lines of shellphish script
NLINES="$(wc -l files/shellphish | cut -d' ' -f1)"

# Installer
cat files/installer | sed "s/{NLINES}/$NLINES/g" > output/final.sh

# Exit to avoid executing main script
echo exit >> output/final.sh

# Main script
cat files/shellphish >> output/final.sh

# Do it executable
chmod +x output/final.sh
