FROM centos:latest

RUN yum -y install \
    python3-devel \
    python3-pip \
    gcc \
    vim \
    && yum clean all

COPY ./requirements.txt /app/requirements.txt
RUN python3 -m pip install --upgrade pip
RUN pip3 install -r /app/requirements.txt

WORKDIR /app

COPY . /app

ENTRYPOINT [ "python3" ]

CMD [ "app.py" ]
