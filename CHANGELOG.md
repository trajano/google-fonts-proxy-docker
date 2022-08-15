# 1.1.3

* Support STATIC_URL to allow mapping without relying on request variables.  Note this replaces https://fonts.gstatic.com/s (including the /s so if you replace it you have to add the /s as well.  See README for the xample.)

# 1.1.2

* Support /icon path

# 1.1.1

* Removed debug logging

# 1.1.0

* Support /css2 path
* Use `FilterChain`
* Explicitly remove headers that may be added by Traefik
* Set `IncludesNOEXEC` just in case.
