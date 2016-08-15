# `acmetool` Docker container

Uses [anacron](http://anacron.sourceforge.net/) to run [acmetool](https://github.com/hlandau/acme) daily. 

## Instructions:

### Build image:

```
$ docker build .
```

### Set `ACME_STATE_DIR`:

```
$ export ACME_STATE_DIR=$PWD/acme
```

### Create anacron spool:

```
$ mkdir -p $ACME_STATE_DIR/anacron
```

### Initialize acmetool:

```
$ ./acmetool quickstart
$ ./acmetool want mydomain.example.com --no-reconcile
```

*Note:* Do not create hooks or cronjobs. Select 'Stateless' challenge mode at this stage, even if you are going to use some other method.

### Configure challenge mode(s):

```
$ vi $ACME_STATE_DIR/conf/target
$ cat $ACME_STATE_DIR/conf/target 
request:
  provider: https://acme-staging.api.letsencrypt.org/directory
  challenge:
    webroot-paths:
      - /var/lib/acme/webroot
  key:
    type: rsa
```

### Configure your webserver

### Run container:

```
$ docker run -v $ACME_STATE_DIR:/var/lib/acme image_id
```

### Reload web server configuration manually

Reload hooks are work in progress. Adventurous people can put their hooks into `reload` file
