FROM blang/latex:ubuntu

RUN apt-get update -y
RUN apt-get install -y biber