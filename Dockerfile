FROM composer

LABEL "name"="Laravel Nova Composer Login"
LABEL "maintainer"="Judge2020 <8601934+judge2020@users.noreply.github.com>"
LABEL "version"="1.0.0"
LABEL "repository"="https://github.com/judge2020/actions-laravel-nova-composer-login"

LABEL "com.github.actions.name"="Laravel Nova Composer Login"
LABEL "com.github.actions.description"="Use your Nova API key to authorize composer to download releases from nova.laravel.com"
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="orange"


COPY "entrypoint.sh" "/entrypoint.sh"
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
