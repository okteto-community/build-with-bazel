# Getting Started on Okteto with Go and Bazle

This example shows how to use [Okteto](https://okteto.com) to build, deploy and develop a Go App directly in Kubernetes using Bazel

## build and deploy:
To use ttl.sh:
okteto deploy --var TAG="1h" --var REPOSITORY="ttl.sh/$(uuidgen)"
