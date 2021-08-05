# Ustalamy z jakiego obrazu bazowego korzystamy
FROM ubuntu:20.04

# Ustawiamy strefę czasową - konieczne jest to aby przy instalacji
# javy nie było prośby o ustawienie strefy czasowej
ENV TZ=Europe/Warsaw
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Uruchamiamy zaktualizowanie system i instalację wymaganych pakietów
RUN apt update && apt upgrade -y && \
apt install -y && \
apt install git && \
apt install python3-pip -y && \
pip3 install django -y

# Budujemy aplikację w oparciu o repozytorim gitowe i przenosimy
# zbudowaną aplikację do odpowiedniego katalogu
# Na koniec usuwamy zbędne pliki

RUN mkdir /code

COPY ./ /code

RUN cd /home/awl/PycharmProjects/kotowisko/code/venv  && \
source bin/activate && \
cd.. && \
django-admin startproject && \
cd kotowisko_app && \
django-admin starapp apps.py && \
python manage.py makemigrations && \
python manage.py migrate && \
python manage.py runserver 0.0.0.0:8080 && \
mkdir new_app && \
mv /code/kotowistko_app/apps.py /new_app && \
cd / && \
rm -r /code


# Usuwamy zbędne aplikacje - nie potrzebujemy ich bo
# już skompilowaliśmy naszą aplikację
RUN apt remove -y \
apt remove git \
python3-pip \
django\
apt clean && \
apt autoremove --purge && \
rm -rf /var/lib/apt/lists

EXPOSE 8080

# Ustalamy jaki katalog będzie domyślnym katalogiem roboczym
# po uruchomieniu kontenera, dzięki temu
WORKDIR /new_app

CMD apps.py
