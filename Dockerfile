FROM ghcr.io/ghostwriter/php:8.1

LABEL "com.github.actions.name"="StyleCI CLI"
LABEL "com.github.actions.description"="Analyze your PHP, JS and CSS code with StyleCI CLI."
LABEL "com.github.actions.icon"="check-circle"
LABEL "com.github.actions.color"="green"

ARG STYLECI_VERSION

RUN wget https://github.com/StyleCI/CLI/releases/download/${STYLECI_VERSION}/styleci.phar \
    && chmod +x styleci.phar && mv styleci.phar /usr/local/bin/styleci

RUN styleci --version

ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
