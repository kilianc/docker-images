# boilerplate
FROM kilianciuffolo/node:0.12.7
MAINTAINER me@nailik.org

# rtail server
RUN npm install -g rtail && npm cache clean
ENV DEBUG=rtail:*
ENV DEBUG_COLOR=1
ENTRYPOINT ["rtail-server"]
CMD ["rtail-server", "--udp-host", "0.0.0.0", "--web-host", "0.0.0.0", "--web-version", "unstable"]
EXPOSE 8888
