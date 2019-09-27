# talks [![Netlify Status](https://api.netlify.com/api/v1/badges/7b38ca47-2239-41cc-b676-7f52ca238763/deploy-status)](https://app.netlify.com/sites/boring-mirzakhani-3aa1e6/deploys)

## Adding a new slide deck

Any new repositories should be added to the `./talks.txt` file in a new line.

Slides will go live on [https://talks.fknussel.com/repository-name](https://talks.fknussel.com/repository-name).

## How this works internally

Run the `./talks.sh` file to clone all repositories and build the slides from source.

Make sure to grant `talks.sh` the appropriate permissions:

```
chmod +x talks.sh
```
