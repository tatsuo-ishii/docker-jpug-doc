docker build -t pgsql_doc_ja .
docker run --rm -v $HOME/volum:/var/volum pgsql_doc_ja

