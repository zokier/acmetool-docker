FROM debian:jessie

RUN apt-get update \
    && apt-get --no-install-recommends -y install anacron netcat-openbsd \
    && rm -rf /var/lib/apt/lists/*

# anacron wants to send email, but we dont care
RUN ln -s /bin/true /usr/sbin/sendmail

COPY IdenTrustCommercialRootCA1.crt /etc/ssl/certs/ca-certificates.crt

COPY anacrontab /etc/anacrontab
COPY anacron-runner.sh acmetool /usr/local/bin/
COPY reload /usr/libexec/acme/hooks/

CMD ["/usr/local/bin/anacron-runner.sh"]

