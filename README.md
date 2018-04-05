# Talks

Any new repositories should be added to the `./talks.txt` file in a new line.

Run the `./talks.sh` file to clone all repositories and build the slides from source.

Make sure to grant `talks.sh` the appropriate permissions:

```
chmod +x talks.sh
```

CircleCI automatically handles the deployment to [surge.sh](https://surge.sh).

Slides will go live on [https://talks.fknussel.com/repository-name](https://talks.fknussel.com/repository-name).

Heads up: When deploying to Surge, the `node_modules` directory is ignored by default. Whitelist it on the `.surgeignore` file so that it gets uploaded (we need this so that the base styles are also deployed).
