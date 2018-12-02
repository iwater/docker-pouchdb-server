
FROM node:10-alpine
LABEL maintainer "iwater <iwater@gmail.com>"

RUN apk --update --no-cache add bash curl g++ make python && \
	npm install --global --unsafe-perm=true pouchdb-server && \
	rm -rf /root/.[^.]* && \
	apk del g++ make python

ADD node_modules/lru-cache /usr/local/lib/node_modules/lru-cache
ADD node_modules/yallist /usr/local/lib/node_modules/yallist
ADD create-or-delete-dbs.js /usr/local/lib/node_modules/pouchdb-server/node_modules/express-pouchdb/lib/create-or-delete-dbs.js
ADD add-admin.sh /bin/add-admin
ADD add-user.sh /bin/add-user
ADD lib.sh /bin/lib.sh

RUN chmod +x /bin/add-admin /bin/add-user

WORKDIR /pouchdb

ENTRYPOINT ["pouchdb-server"]

CMD ["--host", "0.0.0.0"]
