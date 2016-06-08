FROM ubuntu:xenial
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
ENV LC_TYPE=en_US.UTF-8
RUN apt-get update && \
  apt-get install postgresql postgresql-contrib locales wget unzip -y && \
  wget -O /tmp/erlang.tar.gz https://s3.amazonaws.com/heroku-buildpack-elixir/erlang/cedar-14/OTP-18.3.tar.gz && \
  mkdir -p /usr/local/erlang && \
  tar xzvf /tmp/erlang.tar.gz -C /usr/local/erlang --strip-components=1 && \
  /usr/local/erlang/Install -minimal /usr/local/erlang && \
  ln -s -t /usr/local/bin /usr/local/erlang/bin/* && \
  rm /tmp/erlang.tar.gz && \
  wget -O /tmp/elixir.zip https://s3.amazonaws.com/s3.hex.pm/builds/elixir/v1.2.6.zip && \
  mkdir -p /usr/local/elixir && \
  cd /usr/local/elixir && \
  unzip -q /tmp/elixir.zip && \
  chmod +x /usr/local/elixir/bin/* && \
  ln -s -t /usr/local/bin /usr/local/elixir/bin/* && \
  rm /tmp/elixir.zip && \
  /usr/sbin/locale-gen en_US.UTF-8 && \
  /usr/sbin/dpkg-reconfigure -f noninteractive locales && \
  echo "local all all              trust" > /etc/postgresql/9.5/main/pg_hba.conf && \
  echo "host  all all 127.0.0.1/32 trust" >> /etc/postgresql/9.5/main/pg_hba.conf && \
  echo "host  all all ::1/128      trust" >> /etc/postgresql/9.5/main/pg_hba.conf
