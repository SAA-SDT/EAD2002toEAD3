JING="/home/thc4/Dropbox/xml/tools/jing/bin/jing.jar"
SCHEMA="/home/thc4/Github/EAD2002toEAD3/ead3.rng"
CWD="/data/working/converted"

echo "$SCHEMA"

java -jar "$JING" "$SCHEMA" *.xml > errs.txt

cut -d';' -f1 "$CWD"/errs.txt | cut -d':' -f5 | sort | uniq -c | sort -nr > "$CWD"/errs_uniq_cnt.txt


IFS=$'\n'

for ERROR in $(head -10 errs_uniq_cnt.txt | cut -c 10-)

do
echo "$ERROR"


OUTFILE=$(echo "$ERROR" | cut -d'"' -f2)_errs.txt

echo "$OUTFILE"

echo "$ERROR" > "$OUTFILE"

grep  "$ERROR" errs.txt | cut -d':' -f1 | sort | uniq -c | sort -nr >> "$OUTFILE"

echo "-------"

done

unset IFS