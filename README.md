# Talks

## Adding a new slide deck

Any new repositories should be added to the `./talks.txt` file in a new line.

Slides will go live on [https://talks.fknussel.com/repository-name](https://talks.fknussel.com/repository-name).

## How this works internally

Run the `./talks.sh` file to clone all repositories and build the slides from source.

Make sure to grant `talks.sh` the appropriate permissions:

```
chmod +x talks.sh
```

CircleCI automatically handles the deployment to [surge.sh](https://surge.sh).
