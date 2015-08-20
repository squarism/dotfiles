# for the golang happy time libraries list
# overly specific but this has some nice tricks in it

for library in `curl -s https://gist.github.com/squarism/914b26e316a2cb204188 \
| grep -E "^<code>.*</code>" | sed -e 's/<[^>]*>//g' | awk '{print $1}'`
do
  echo $library; curl -s https://$library | grep -A1 stargazer | grep -v stargazer
done
