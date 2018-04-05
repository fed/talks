#!/bin/bash

# Set up a talks.txt file that contains a list of all the repositories,
# one per line. Seen here: https://gist.github.com/richardhsu/10247078

reponame="https://github.com/fknussel/([a-zA-Z0-9._-]+)$"

# Create the base folder that will get deployed.
mkdir slides

# We need to deploy the index.html file.
cp index.html slides

# Create a timestamp file so that we know when the last deploy occured.
echo `date` >> slides/version.txt

while read p; do
  printf "\n🌎 Repository: $p\n\n"
  git clone $p;
  [[ $p =~ $reponame ]]

  # ${BASH_REMATCH[1]} is the repo name matched on the regular expression.
  folder="${BASH_REMATCH[1]}"
  cd $folder

  printf "\n📦 Fetching dependencies...\n\n"
  npm install

  printf "\n🔨 Building...\n"
  npm run build

  # Temporary hack since we can't deploy nested node_modules dirs to Surge.sh.
  if [ -f node_modules/slides-base-css/style.css ]; then
    printf "\n🎨 Bringing in base styles...\n"

    # Copy the base styles file to the build directory.
    cp node_modules/slides-base-css/style.css build/base.css

    # Update the link to the base stylesheet within the HTML file.
    sed -i '' 's/node_modules\/slides-base-css\/style.css/base.css/g' build/index.html

    # Get rid of the nested node_modules folder.
    rm -rf build/node_modules
  fi

  # Move the dist files to the root directory and remove the source files.
  mv build ../slides/$folder
  cd ..
  rm -rf $folder

  printf "\n$folder has been successfully built ✅\n"
done < talks.txt

printf "\nDone ✨\n\n"
