FROM python:3.8

WORKDIR /app
ADD ./requirements.txt /app
RUN pip install -r requirements.txt

ADD ./src/ /app

ENTRYPOINT [ "python3" ]
CMD [ "./query.py" ]