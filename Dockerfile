FROM jonathancabezas/drupal

ENV CIVICRM_VERSION=5.12.0 \
    TRUSTED_HOST=localhost \
    CIVICRM_DB_NAME=civicrm \
    CIVICRM_DB_USERNAME=civicrm \
    CIVICRM_DB_PASSWORD=password \
    CIVICRM_HTTPS=off


RUN mkdir -p /opt/ressources/ \
    && wget -q https://download.civicrm.org/civicrm-${CIVICRM_VERSION}-drupal.tar.gz -O /opt/ressources/civicrm.tgz \
    && wget -q https://download.civicrm.org/civicrm-${CIVICRM_VERSION}-l10n.tar.gz -O /opt/ressources/civicrm-l10n.tgz \
    && wget -q https://github.com/civicrm/org.civicrm.shoreditch/archive/v0.1-alpha31.zip -O /opt/ressources/shoreditch.zip  \
    && wget -q https://ftp.drupal.org/files/projects/betterlogin-7.x-1.5.tar.gz -O /opt/ressources/betterlogin.tar.gz \
    && wget -q https://raw.githubusercontent.com/civicrm/civicrm-drupal/7.x-master/drush/civicrm.drush.inc -O /opt/ressources/civicrm.drush.inc

ADD conf/ /


RUN set -x \
    && chmod +x /etc/cont-init.d/* \
    && chmod +x /etc/s6/services/*/* \
    && chmod +x /etc/periodic/*/*
