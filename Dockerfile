FROM ubuntu

WORKDIR /doc

COPY . /doc

RUN apt-get update && apt-get -y upgrade

RUN apt install -y python3-pip
RUN pip3 install virtualenv

RUN virtualenv venv
RUN . venv/bin/activate

RUN pip3 install -r requirements.txt


CMD jupyter notebook --no-browser --ip 0.0.0.0 --port 8888 --allow-root

