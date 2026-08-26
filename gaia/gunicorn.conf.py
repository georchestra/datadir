workers=1
threads=4
worker_class="gthread"
bind="0.0.0.0:5002"
accesslog="-"
access_log_format='%({x-forwarded-for}i)s %({sec-username}i)s "%(r)s" %(s)s %(b)s "%(f)s" "%(a)s"'
loglevel="info"
wsgi_app="geordash:create_app()"
