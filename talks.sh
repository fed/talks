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
  printf "\nRepository: $p\n"
  git clone $p;
  [[ $p =~ $reponame ]]

  # ${BASH_REMATCH[1]} is the repo name matched on the regular expression.
  folder="${BASH_REMATCH[1]}"
  cd $folder

  echo "Fetching dependencies..."
  npm install

  echo "Building..."
  npm run build

  # Move the dist files to the root directory and remove the source files.
  mv build ../slides/$folder
  cd ..
  rm -rf $folder

  printf "\n$folder has been successfully built ✅\n"
done < talks.txt

printf "\nDone ✨\n\n"
