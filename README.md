# Build Scripts

Since Puppetlabs went closed source with the RPM, the sources for puppetserver must be generated. This document will outline the process taken for any given update.

## Build the build container

Each of the builds uses a container pre-loaded with the right environment:

```
./container-build
```

## Updating trapperkeeper-webserver-jetty9

I had to create a clojars account and store it:

 - https://clojars.org/org.clojars.ehelms/trapperkeeper-webserver-jetty9
 - https://github.com/ehelms/trapperkeeper-webserver-jetty9/tree/patches

This can be built:

```
./jetty-build
```

After building, the updated jar needs to be released. This requires credentials on the target repository, or to have your own repository.

```
lein deploy clojars
```

## Building puppetserver tarball

Build the tarball:

```
./puppetserver-build
```

The resulting tarball can be used as input to an RPM. This generates an RPM using FPM that can also be used.
