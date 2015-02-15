Docker container to create Japanese PostgreSQL documents.

How to compile Japanese docs
==================

### 1. Build docker image

```
	sudo docker build -t pgsql_doc_ja .
```

### 2. Run docker container to compile documents from jpug-doc git repository

```
	sudo docker run --rm -v $HOME/volum:/var/volum pgsql_doc_ja
```

### 3. If you are too lazy to run those command above, you can simply type:

```
	sudo ./run.sh
````

In any case you will see the compiled documents in $HOME/volum/html.

### 4. If you want to compile your local docs, type:

```
	sudo ./run.sh -p absolute_path_to_docdir -u your_uid -g your_gid
```

This will create html files under
absolute_path_to_docdir/doc/src/sgml/html using uid your_uid and gid
your_gid. You can ommit -u and/or -g option but the result html will
be owned by root (uid=0, gid=0).

Example:
sudo ./run.sh -p /home/t-ishii/work/doc-jp/jpug-doc -u 1000 -g 1000
