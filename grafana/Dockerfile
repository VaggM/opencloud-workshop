FROM grafana/grafana:12.3

COPY ./datasources_02.yaml /etc/grafana/provisioning/datasources/main.yaml

ARG POSTGRES_USER
ARG POSTGRES_PASS
ARG POSTGRES_DB

RUN sed -i "s#POSTGRES_USER#${POSTGRES_USER}#" /etc/grafana/provisioning/datasources/main.yaml
RUN sed -i "s#POSTGRES_PASS#${POSTGRES_PASS}#" /etc/grafana/provisioning/datasources/main.yaml
RUN sed -i "s#POSTGRES_DB#${POSTGRES_DB}#" /etc/grafana/provisioning/datasources/main.yaml

# Optional
EXPOSE 3000
