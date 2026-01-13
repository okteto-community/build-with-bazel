# Getting Started on Okteto with Go and Bazle

This example shows how to use [Okteto](https://okteto.com) to build, deploy and develop a Go App directly in Kubernetes using Bazel

## build and deploy:

You can use the command below to build, push the image to ttl.sh, and deploy it in kubernetes. We recommend you change the value of IMAGE_REPOSITORY for a unique string. 
```
okteto deploy --var IMAGE_REPOSITORY="ttl.sh/cindy/build-with-bazel" --var IMAGE_TAG="15m" --wait
```

```

```
