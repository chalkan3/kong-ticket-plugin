
#####################
## Go plugins - O2B
#####################
FROM kong:2.1.0-ubuntu as compiler
USER root
COPY . /usr/src/kong-plugin/


#####################
## Release image - kong-custom-image with O2B Plugins
#####################
FROM kong:2.1.0-ubuntu
USER root
COPY --from=compiler /usr/src/kong-plugin/scripts/*.sh /usr/local/kong-plugin/
COPY --from=compiler /usr/src/kong-plugin/plugin/ /usr/local/kong-plugin/
RUN chmod -R 777 /usr/local/kong-plugin/*.sh