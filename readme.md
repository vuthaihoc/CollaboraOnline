# WOPI Server

- From https://github.com/CollaboraOnline/richdocumentscode

# Build

    docker build --tag you/name:24.04 .

# Run

    docker run --rm --name wopi vuthaihoc/wopi:24.04

# Docker compose

    services:
      onlyoffice:
        image: vuthaihoc/wopi:24.04
        ports:
          - "9983:9983"
        restart: always
        volumes:
          - "./docs:/docs"
        command: ["--o:storage.filesystem[@allow]=true"]

Test

- [Docx](http://localhost:9983/browser/dist/cool.html?file_path=file:///docs/demo.docx&permission=readonly)
- [Pdf](http://localhost:9983/browser/dist/cool.html?file_path=file:///docs/demo.pdf&permission=readonly)
