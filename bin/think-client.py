#!/usr/bin/python

import datetime
import rethinkdb as r

r.connect(host="localhost", port=28015, auth_key="AUTHKEYAUTHKEYAUTHKEY", db="DBDBDBDB").repl()
r.db('ikon').table('facts').run()
for change in r.db('DBDBDBDB').table('TABLETABLETABLE').changes().run():
    print(change[u'new_val'][u'message'],
            change[u'new_val'][u'color'],
            change[u'new_val'][u'timestamp'].time(),
            datetime.datetime.now().time())
