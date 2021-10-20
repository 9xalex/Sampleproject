FROM python:3.7

#MAINTANER Your Name "alex.tun@gmail.com"
COPY ./requirements.txt /app/requirements.txt
WORKDIR /app
COPY . /app
RUN pip install --no-cache-dir -r requirements.txt
CMD [ "python","app.py" ]