function pandoc_cmd() {
  pandoc --standalone --template template.html - "$@"
}

function gen() {
  echo "---"
  echo "title: List of things"
  echo "---"

  echo "# Index of articles"

  find output -name '*.html' -printf '%P\n' | grep -v 'index.html' | while read f; do
    title="$(grep '<title>' "output/$f" | perl -p -e "s#.*<title>(.*)</title>#\1#")"
    last="$(grep -oE 'Last modified: [0-9\-]+' "output/$f")"
    echo "* [$title]($f) ($last)"
  done | sort
}

gen | pandoc_cmd --metadata footer="Generated at: $(date +%Y-%m-%d)" -o "$1"
