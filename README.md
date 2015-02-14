# docker-jpug-doc
Docker container to create Japanese PostgreSQL documents.

How to compile Japanese docs
==================

### 1. Build docker image

```
	sudo docker build -t pgsql_doc_ja .
```

### 2. Run docker container to run regression tests with V3_4_STABLE branch head

```
	sudo docker run --rm -v $HOME/volum:/var/volum pgsql_doc_ja
```

### 3. If you are too lazy to run those command above, you can simply type:

```
	sudo ./run.sh
````

In any case you will see the compiled documents in $HOME/volum/html.
