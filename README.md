This image is based on the latest [Node.JS Alpine](https://hub.docker.com/_/node/) image, [PouchDB Server](https://github.com/pouchdb/pouchdb-server), and [levelDB](https://github.com/google/leveldb).

Run the container, binding a data directory.

```
docker run -d -p 5984:5984 -v /path/to/data:/pouchdb --hostname=pouchdb-server --name=pouchdb-server scttmthsn/docker-pouchdb-server
```

You can then browse to the admin panel at http://localhost:5984/_utils/.

## CLI Tools

To close the [admin party](http://guide.couchdb.org/draft/security.html#party) and create the first admin user, run the following.

```
docker exec -it pouchdb-server add-admin [name]
```

A password is auto-generated which should be retained (or get ready to hose your data directory).

You can also make as many regular users as you need.

```
docker exec -it pouchdb-server add-user [name]
```
