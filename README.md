# Docker OIDC Proxy

This is a OIDC proxy server that is designed to be used with Traefik as the HTTPS entry point and uses Apache HTTP with mod-auth-openidc to handle the OIDC management then forwards everything to an internal service.

## Environment variables

Most of the text are from from https://github.com/zmartzone/mod_auth_openidc/blob/master/auth_openidc.conf

`OIDC_PROVIDER_METADATA_URL` URL where OpenID Connect Provider metadata can be found.

> Google: https://accounts.google.com/.well-known/openid-configuration

`OIDC_CLIENT_ID` Client identifier used in calls to the statically configured OpenID Connect Provider.

> e.g. a0tdkv2u4oiebsztd6i46urvorkspqptu.apps.googleusercontent.com

`OIDC_CLIENT_SECRET` Client secret used in calls to the statically configured OpenID Connect Provider.

> e.g. 042db405cb8ef3f5e32445992db5d25231538946

`OIDC_REDIRECT_URI` The `redirect_uri` for this OpenID Connect client; this is a vanity URL that must ONLY point to a path on your server protected by this module AND must NOT point to any actual content that needs to be served.

The combination of this value and `SERVER_NAME` will form the `redirect_uri` that has to be set on the OpenID Provider.

> e.g. `/cb` with a `SERVER_NAME` of `trajano.net` would yield `https://trajano.net/cb`

`OIDC_CRYPTO_PASSPHRASE` Set a password for crypto purposes. If the value begins with exec: the resulting command will be executed and the
first line returned to standard output by the program will be used as the password.

For convenience, the image provides `/random_password` that generates a random password value.  However, if running with multiple replicas, this environment variable *must* be set.

`OIDC_SESSION_INACTIVITY_TIMEOUT` Interval in seconds after which the session will be invalidated when no interaction has occurred.

> e.g. `2592000` for 30 days.

`OIDC_SESSION_MAX_DURATION` Maximum duration of the application session in seconds. When set to `0`, the session duration will be set equal to the expiry time of the ID token.

`SERVER_NAME` Hostname and port that the server uses to identify itself.  This must 

`SERVICE_NAME` The name of the backend service that is being proxied.
