#!/bin/bash 

## Some checks
if ! which git > /dev/null; then
    echo "git is needed for the proper use of this script - please install it."
    exit 1
fi

if [[ $# -ne 1 ]]; then
    echo "USAGE: $0 PNG/SVG"
    echo "Please remember to add the desired file type of the images."
    exit 1
fi

# Set Vars
baseUrl='https://github.com/madebybowtie/FlagKit.git'
fileType=${1^^}

if [[ ! -d $fileType ]]; then
    # Clone the repo with the flags
    echo "Cloning repo, this can take a while..."
    sleep 1
    git clone $baseUrl

    # Pull out the folder with the relevnat flags
    mv -f "FlagKit/Assets/$fileType" .
    rm -Rf FlagKit 
fi
 
# Clean out the larger PNG images from the folder
if [[ $fileType -eq "PNG" ]]; then
    find PNG/ -name "*@*" -delete  >> /dev/null
fi

# Encode the files
echo "Encoding files...."
mkdir -p encoded
cd $fileType
for file in *; do
    newFilename=$(echo $file | tr -d "@" | tr -d "-") # Should be cleaned out already, but nonethless
    base64 -w 0 $file > ../encoded/$newFilename.b64
done
cd ..

# Create JSON file
encodedJSON="encoded_${fileType}_images_base.json"
rm -f $encodedJSON && touch $encodedJSON

# Add entries to JSON file
echo "Adding base54-encoded entries to JSON file..."
echo "{" >> $encodedJSON
for file in encoded/*; do 
    echo "\"$(echo $file | cut -d "/" -f 2 | cut -d "." -f 1)\" : \"$(cat $file)\"," >> $encodedJSON
done
echo "}" >> $encodedJSON

# Remove newlines, spaces and the and comma after the last value
result="countryFlags.json"
cat $encodedJSON | tr -d '\n' | tr -d ' ' | sed 's^,}^}^g' > $result

# Clean up and print
rm -f $encodedJSON
rm -Rf encoded
echo "Your JSON file is at ./$result - enjoy!"