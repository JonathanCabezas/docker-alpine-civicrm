# Drupal 7 + CiviCRM 5.11.0

# Auto configuration parameters :


# Compose file exemple

```

version: '3.1'

services:

  drupal:
    image: drupal
    environment:
      - DATABASE_HOST=172.17.0.1
      - DATABASE_PORT=3306
      - DATABASE_PASSWORD=password
      - PROJECT_NAME=drupal
      - SITE_EMAIL=email@test.com
      - ADMIN_USERNAME=admin
      - ADMIN_PASSWORD=password
      - ADMIN_EMAIL=admin@test.com
      - COUNTRY=France
      - TIMEZONE=Europe/Paris
    ports:
      - 8080:80
    networks:
      default:
    deploy:
      resources:
        limits:
          memory: 256M
      restart_policy:
        condition: on-failure
      mode: global

  mariadb:
    image: samirkherraz/mariadb
    environment:
      - ROOT_PASSWORD=password
      - DB_0_NAME=drupal
      - DB_0_PASS=password
      - DB_1_NAME=civicrm
      - DB_1_PASS=password
    ports:
      - 3306:3306
      - 8081:80
    volumes:
      - mariadb-data:/var/lib/mysql/
      - mariadb-config:/etc/mysql/
    networks:
      default:
    deploy:
      resources:
        limits:
          memory: 256M
      restart_policy:
        condition: on-failure
      mode: global



volumes:
    mariadb-data:
    mariadb-config:

```
