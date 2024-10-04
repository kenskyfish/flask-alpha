FROM python:3.12.3-slim
RUN mkdir /app
WORKDIR /app/
ADD . /app/
RUN pip install --no-cache-dir -r requirements.txt
RUN flask --app flaskr init-db
# rekey for session tokens security
RUN echo "SECRET_KEY = '$(python -c 'import secrets; print(secrets.token_hex())')'" > /app/instance/config.py
CMD ["waitress-serve", "--call", "flaskr:create_app"]