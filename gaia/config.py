from os import getenv

if getenv('REDISURL'):
    # running owscapcache from a python cli for tests
    url = getenv('REDISURL')
else:
    url="redis://user:password@host:port/dbnum"
