# Express in Deployments

A simple Express application built with the intent to test an Express server running in different environments (local, docker, lambda).

## Usage

The available make commands can be listed with `make help`:

```text
Usage: make <target>
  help        This help text.

Serverless
  deploy      Deploy the lambda with serverless
  remove      Destroys the instructure

Express
  local       Locally run the app

Docker
  docker      Build and run in a docker container
```

## Notes

Simple service with the intent to be used for some AWS work involving cloud costing, cold starts and on-demand provisioning of services. There are a couple projects that I'm looking at that don't need a server with 100% uptime. An on-demand server would be ideal, as it significantly reduces the costs associated with the server.

Additionally if it is running in a FaaS infrastructure, then there isn't a need to worry about any real infrastructure. Anything that is a bit complex can be addressed with serverless or terraform (if necessary).

It does raise some concerns about how to perform monitoring and balance concerns (costing / on-demand approach).

### On Usages

In terms of project layout, the Makefile works to act as a coordinater for all the components. It is less than an ideal, but I aimed to keep the structure as simple as possible. With it I can pretty easily test some use cases with docker and a server app. The split off app/ avoids the over-reliance on serverless or AWS lock-in.
