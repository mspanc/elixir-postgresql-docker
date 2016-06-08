FROM elixir:1.2.5
ENV LANG=en_US.UTF-8
RUN apt-get update && \
  echo "LANGUAGE = en_US.UTF-8" > /etc/environment && \
  echo "LC_ALL = en_US.UTF-8" >> /etc/environment && \
  echo "LANG = en_US.UTF-8" >> /etc/environment && \
  echo "LC_TYPE = en_US.UTF-8" >> /etc/environment && \
  apt-get install postgresql postgresql-contrib locales -y && \
  /usr/sbin/locale-gen C.UTF-8 en_US.UTF-8 && \
  /usr/sbin/dpkg-reconfigure -f noninteractive locales && \
  echo "local all all              trust" > /etc/postgresql/9.4/main/pg_hba.conf && \
  echo "host  all all 127.0.0.1/32 trust" >> /etc/postgresql/9.4/main/pg_hba.conf && \
  echo "host  all all ::1/128      trust" >> /etc/postgresql/9.4/main/pg_hba.conf
