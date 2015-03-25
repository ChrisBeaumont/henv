## Vagrant-h

This configuration sets up a Vagrant box with all the
system dependencies needed to build and run the hypothesis `h`
app.

`cd` into this directory and type `vagrant up`

On the guest machine, set up h by running

```
cd h
make deps
make dev
```

# Notes

To access the app from the host machine, change instances of `localhost`
to `0.0.0.0` in `conf/development.ini`
