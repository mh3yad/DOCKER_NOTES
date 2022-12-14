FROM python

WORKDIR /app

ADD requirements .

COPY . .

RUN pip install -r requirements

ENV key value

ENTRYPOINT [ "/bin/bash", "-c"]

CMD [ "python","app.py" ]