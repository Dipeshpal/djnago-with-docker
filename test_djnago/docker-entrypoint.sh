#!/bin/bash
alias python=python3
alias pip=pip3
python manage.py migrate # Apply database migrations
python manage.py collectstatic --noinput # Collect static files
python manage.py runserver 8000

# Prepare log files and start outputting logs to stdout
touch /srv/logs/gunicorn.log
touch /srv/logs/access.log
tail -n 0 -f /srv/logs/*.log &

# Start Gunicorn processes
echo Starting Gunicorn.
exec gunicorn mysite.wsgi:application \
	--name mysite \
	--bind 0.0.0.0:8002 \
	--workers 3 \
	--log-level=info \
	--log-file=/srv/logs/gunicorn.log \
	--access-logfile=/srv/logs/access.log \
	"$@"
