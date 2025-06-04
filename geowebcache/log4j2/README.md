# Geowebcache log4j2

As geowebcache-webapp is a geOrchestra specific re-packaging of GeoWebcache, it uses the same log4j2 configuration as GeoWebCache.

The support for automatic setup from datadir has been removed in [PR 4460](https://github.com/georchestra/georchestra/pull/4460/files#diff-4b954ad8d6fac093e916523353bae1e0bad9ae52d527b4fb00196510cfc2bb35L23-L27).

By now, it is your responsibility to provide log4j2 files correctly.