# C4 Structurizr

[Structurizr documentation](https://docs.structurizr.com/)

## setup

Using WSL + Ubuntu

1. install docker
   1. [Docker install instructions](https://docs.docker.com/engine/install/ubuntu/)
2. Get image
   1. ```docker pull structurizr/lite```

## run image

```docker run -it --rm -p 8080:8080 -v PATH:/usr/local/structurizr structurizr/lite```

For example, if your Structurizr data directory (where the dsl resides ) is located at /Users/mark/documents/structurizr, the command would be:
```docker run -it --rm -p 8080:8888 -v /Users/mark/documents/structurizr:/usr/local/structurizr structurizr/lite```

the browse to [127.0.0.1:8888/workspace/diagrams](127.0.0.1:8888/workspace/diagrams)

You can then sign in using the default credentials (structurizr and password), and start to create workspaces, etc.


docker run -it --rm -p 8080:8888 -v "/home/mbacon/OneDrive/OneDrive - Landis+Gyr/MyRepos/Example-Repo/docs/Project/Architecture/C4:/usr/local/structurizr" structurizr/onpremises