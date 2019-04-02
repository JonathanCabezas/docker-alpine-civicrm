FROM jonathancabezas/drupal

ENV CIVICRM_VERSION=5.11.0 \
    TRUSTED_HOST=localhost

ADD conf/ /

RUN set -x \
    && chmod +x /etc/cont-init.d/* \
    && chmod +x /etc/s6/services/*/*
