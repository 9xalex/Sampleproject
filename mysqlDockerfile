FROM postgres:11

# ustom initialization scripts
# #MAINTANER Your Name "alex.tun@gmail.com"
COPY ./createdb.sh /docker-entrypoint-initdb.d/createdb.sh
COPY ./dumpfile.sql /dumpfile.sql

RUN chmod +x /docker-entrypoint-initdb.d/createdb.sh