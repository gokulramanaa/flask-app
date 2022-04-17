FROM centos:latest

# suppose if we get centos error (wrt https://stackoverflow.com/a/71309215)
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*


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
