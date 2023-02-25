function last_edited_date() {
  stat -c %y "$1" | cut -d' ' -f1
}

function preprocessing() {
  perl -p -e 's#asciinema\(([a-zA-Z0-9]+)\)#<script async id="asciicast-\1" src="https://asciinema.org/a/\1.js"></script>#g'
}

function pandoc_cmd() {
  pandoc --standalone --template template.html - "$@"
}

content="$1"
output="$2"

preprocessing < "$content" |
  pandoc_cmd --metadata footer="Last modified: $(last_edited_date "$content")" -o "$output"
