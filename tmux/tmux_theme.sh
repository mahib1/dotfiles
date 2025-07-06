
#!/bin/bash

# Define your base30 colors
declare -A COLORS=(
  [white]="#c7ccd1"
  [darker_black]="#161a1d"
  [black]="#1c2023"
  [black2]="#24282b"
  [one_bg]="#272b2e"
  [one_bg2]="#303437"
  [one_bg3]="#3a3e41"
  [grey]="#44484b"
  [grey_fg]="#4a4e51"
  [grey_fg2]="#515558"
  [light_grey]="#565a5d"
  [red]="#c79595"
  [baby_pink]="#d09eb7"
  [pink]="#c795ae"
  [line]="#303437"
  [green]="#aec795"
  [vibrant_green]="#95c7ae"
  [nord_blue]="#8ca5be"
  [blue]="#95aec7"
  [yellow]="#c7c795"
  [sun]="#d0d09e"
  [purple]="#ae95c7"
  [dark_purple]="#a58cbe"
  [teal]="#8fb4b5"
  [orange]="#c7ae95"
  [cyan]="#9eb7d0"
  [statusline_bg]="#23272a"
  [lightbg]="#303437"
  [pmenu_bg]="#99c366"
  [folder_bg]="#8ca5be"
)

# Input and output file
input="tmux.template.conf"
output="~/.config/tmux/tmux.conf"

cp "$input" "$output"

# Replace all #{color} with the actual hex values
for name in "${!COLORS[@]}"; do
  sed -i '' "s|#{$name}|${COLORS[$name]}|g" "$output"
done

echo "✅ Tmux config generated at $output"
