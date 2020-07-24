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

gawk '$1=$1' OFS=, FIELDWIDTHS='8 15 13 60 30 2 9 4 6 101 30 260 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 192' $1 > ap-scores.csv