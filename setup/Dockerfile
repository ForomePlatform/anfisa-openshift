FROM evgenyabrosin/python:3.7
WORKDIR /anfisa

RUN mkdir -p /anfisa/anfisa \
    && mkdir -p /anfisa/a-setup \
    && mkdir -p /data \
    && mkdir -p /anfisa/a-setup/data \
    && mkdir -p /anfisa/a-setup/logs \
    && mkdir -p /anfisa/a-setup/vault \
    && mkdir -p /anfisa/a-setup/export \
    && mkdir -p /anfisa/a-setup/ui \
    && chmod -R 777 /anfisa/a-setup
    
COPY . /anfisa/anfisa/
RUN cp -r /anfisa/anfisa/export/ /anfisa/a-setup/export/
RUN cd /anfisa/anfisa/setup/ && pip3 install -e git+https://github.com/ForomePlatform/forome_misc_tools.git#egg=forome-tools && pip3 install -r requirements.txt && pip3 install supervisor
RUN cd /anfisa/anfisa/setup && mv anfisa.json.docker /anfisa/anfisa.json && cd /anfisa/anfisa/setup/ && mv entrypoint.sh /usr/bin/entrypoint.sh && chmod +x /usr/bin/entrypoint.sh
ENV ANFISA_HOME=/anfisa/anfisa
ENV ANFISA_WORK=/anfisa/a-setup
ENV ANFISA_ROOT=/anfisa
ENV ANFISA_HTML_APP_BASE=/anfisa/app
ENV ANFISA_HTML_BASE=/anfisa
#RUN  ln -sf /proc/1/fd/1 /anfisa/a-setup/logs/anfisa.log
RUN apt-get update && apt-get install -y nginx
RUN cd /anfisa/anfisa/setup && mv default.nginx /etc/nginx/sites-available/default && mv supervisord.conf /etc/supervisord.conf && mv uwsgi.ini /anfisa/uwsgi.ini
ENTRYPOINT ["/usr/bin/entrypoint.sh", "/usr/local/bin/supervisord"]
EXPOSE 80
