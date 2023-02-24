function last_edited_date() {
  stat -c %y "$1" | cut -d' ' -f1
}

function preprocessing() {
  perl -p -e 's#asciinema\(([a-zA-Z0-9]+)\)#<script async id="asciicast-\1" src="https://asciinema.org/a/\1.js"></script>#g'
}

function pandocify() {
  content="$1"
  output="${OUTPUT}/${base}.html"
  pandoc --standalone --template template.html --metadata date="$(last_edited_date "$content")" - -o "$output"
}

CONTENT=content
OUTPUT=output

find content -name '*.md' -printf '%P\n' | while read f; do
  base="${f%.md}"
  content="${CONTENT}/$f"
  cat "$content" | preprocessing | pandocify "$content"
done

bash make_index.sh > "${OUTPUT}/index.html"
#bash upload.sh
