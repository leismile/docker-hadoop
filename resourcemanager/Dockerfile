FROM leismile/hadoop-base:1.1.0-hadoop2.7.2-java8
MAINTAINER leismile <leismile@gmail.com>

HEALTHCHECK CMD curl -f http://localhost:8088/ || exit 1

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 8088

CMD ["/run.sh"]
