FROM elixir:1.2.5
ENV LANG=C.UTF-8
RUN apt-get update && \
  apt-get install postgresql postgresql-contrib locales -y && \
  /usr/sbin/locale-gen C.UTF-8 && \
  /usr/sbin/dpkg-reconfigure -f noninteractive locales && \
  echo -e "local\tall\tall\t\ttrust\nhost\tall\tall\t127.0.0.1/32\ttrust\nhost\tall\tall\t::1/128\ttrust\n" > /etc/postgresql/9.4/main/pg_hba.conf

