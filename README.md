# flask-alpha
Python 3.12.3
click==8.1.7
Flask==3.0.3
Werkzeug==3.0.4

pip install flaskr-1.0.0-py3-none-any.whl

flask --app flaskr init-db

flask --app flaskr run --debug

pytest -W ignore::DeprecationWarning

mkdir -p .venv/var/flaskr-instance
echo "SECRET_KEY = '$(python -c 'import secrets; print(secrets.token_hex())')'" > instance/config.py
cat .venv/var/flaskr-instance/config.py

root@55567cb25d2c:/app# waitress-serve --call flaskr:create_app
INFO:waitress:Serving on http://0.0.0.0:8080