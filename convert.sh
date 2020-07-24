if ! command -v gawk &> /dev/null
then
    echo "Could not find gawk. Installing now."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    brew install gawk
fi

if ! test $1
then
    echo "File does not exist"
    exit
fi

# convert fixed-width file to csv, only print certain columns
gawk '{print $2,$3,$4,$5,$6,$7,$9,$11,$13,$14,$15,$16,$17,$18,$19,$20,$21,$22,$23,$24,$25,$26,$27,$28,$29,$30,$31,$32,$33,$34,$35,$36,$37}' OFS=, FIELDWIDTHS='8 15 13 60 30 2 9 4 6 101 30 260 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 192' $1 > ap-scores.csv

# trim all columns
awk -F, '
  function trim(s) {
    sub(/^  */,"",s); sub(/  *$/,"",s); gsub(/   */," ",s); return s;
  }
  BEGIN {OFS=FS}
  {for (i=1;i<=NF;i++) { $i=trim($i) }; print }' ap-scores.csv > ap-scores.csv.temp ; mv ap-scores.csv.temp ap-scores.csv
