# Docker Tensorflow
# Base Image: ubuntu 
FROM ubuntu:20.04 as builder

# pip upgrade
ENV TERM xterm
RUN apt-get update && apt-get upgrade -y
RUN apt-get install python3-dev python3-pip python3-urllib3 curl -y

# upgrade pip 
RUN pip install --upgrade pip && pip install --upgrade setuptools 

# python library

# mkdir root/src
RUN mkdir -p /root/src
COPY requirements.txt /root/src

# WORKDIR
WORKDIR /root/src

# ファイルコピー
# COPY requirements.txt /root/src 
COPY src/ /root/src/ 

# python library
RUN pip install -r requirements.txt

# ステージング
COPY --from= builder /usr/local/lib/python3.8/dist-packages /usr/local/lib/python3.8/dist-packages

# port
EXPOSE 8501

# python 
CMD ["bash"]
