function dot_update() {
    cd ~/.dotfiles/;
    git pull;
    git submodule update --recursive --remote;
    cd -;
}

function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

downscale() {
  if [[ $# -lt 2 ]]; then
    echo "Usage: downscale <resize_arg> [output_dir] <images...>"
    echo "Example:"
    echo "  downscale 50% resized *.jpg"
    echo "  downscale 1920x1080 *.png"
    return 1
  fi

  local resize_arg="$1"
  shift

  # If next argument is a directory (or doesn't look like an image), treat as output dir
  local output_dir="resized"

  # Detect if user passed explicit output directory
  if [[ $# -gt 1 && ! "$1" == *.* ]]; then
    output_dir="$1"
    shift
  fi

  mkdir -p "$output_dir"

  for img in "$@"; do
    if [[ -f "$img" ]]; then
      local filename="${img:t}"   # zsh basename
      magick "$img" -resize "$resize_arg" "$output_dir/$filename"
      echo "Resized: $img -> $output_dir/$filename"
    else
      echo "Skipping (not found): $img"
    fi
  done
}

beanprices() {
  if [[ $# -ne 3 ]]; then
    echo "Usage: beanprices <start-date> <end-date> <instrument>"
    echo "Example: beanprices 2018-12-01 2018-12-05 EUR:yahoo/CAC.PA"
    return 1
  fi

  local start="$1"
  local end="$2"
  local instrument="$3"
  local current="$start"

  while [[ "$current" != "$(date -I -d "$end + 1 day")" ]]; do
    bean-price -d "$current" -e "$instrument"
    current=$(date -I -d "$current + 1 day")
  done
}

