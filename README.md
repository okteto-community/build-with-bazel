# Getting Started on Okteto with Go and Bazel

This example shows how to use [Okteto](https://okteto.com) to build, deploy and develop a Go App directly in Kubernetes using Bazel

## build and deploy (without remote cache)

Build and launch the application without a remote cache. You can use the command below to build, push the image to ttl.sh, and deploy it in kubernetes. We recommend you change the value of IMAGE_REPOSITORY for a unique string.
```
cd app
okteto deploy --var IMAGE_REPOSITORY="ttl.sh/cindy/build-with-bazel" --var IMAGE_TAG="15m" --wait
```

## build and deploy (with remote cache)

Using a remote cache significantly speeds up Bazel builds by sharing build artifacts across builds and developers.

### deploy cache server

First, deploy the cache server to reduce latency. We recommend deploying it as a global preview environment to make it accessible to all builds in your cluster:

```
okteto preview deploy --file bazel-cache/okteto.yaml bazel-cache
```

Alternatively, if you're testing this for yourself, you can create a new namespace and deploy it there:

```
cd bazel-cache
okteto namespace create bazel-cache
okteto deploy
```

### deploy the application with remote cache

Then include the `REMOTE_CACHE` variable when deploying your application. Use the notation `service-name.namespace` for the address to ensure that your configuration is portable:

```
cd app
okteto deploy --var IMAGE_REPOSITORY="ttl.sh/cindy/build-with-bazel" --var IMAGE_TAG="15m" --var REMOTE_CACHE="http://bazelremote.bazel-cache:8080" --wait
```

The `REMOTE_CACHE` variable is optional. If not provided, the build will proceed without remote caching.