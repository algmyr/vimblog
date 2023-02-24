echo "<html>"
echo "<head>"
echo "<title>List of things</title>"
echo "</head>"
echo "<body>"
find output -name '*.html' -printf '%P\n' | grep -v 'index.html' | while read f; do
  grep '<title>' "output/$f" | perl -p -e "s#.*<title>(.*)</title>#<p><a href=$f>\1</a></p>#"
done
echo "</body>"
echo "</html>"
