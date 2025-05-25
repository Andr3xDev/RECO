#!/bin/sh

PG_CTL="/usr/local/pgsql/bin/pg_ctl"
PG_DATA="/usr/local/pgsql/data"

case "$1" in
    start)
        echo "Iniciando PostgreSQL..."
        $PG_CTL -D $PG_DATA start
        ;;
    stop)
        echo "Deteniendo PostgreSQL..."
        $PG_CTL -D $PG_DATA stop
        ;;
    restart)
        echo "Reiniciando PostgreSQL..."
        $PG_CTL -D $PG_DATA restart
        ;;
    *)
        echo "Uso: $0 {start|stop|restart}"
        exit 1
        ;;
esac

/etc/rc.d/rc.postgresql start

exit 0
