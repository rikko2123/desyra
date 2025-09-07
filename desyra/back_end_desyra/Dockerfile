#build fase
FROM python:3.12 as builder

#run aggiornamenti dei pacchetti linux
RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y locales \
    #installo compilatore di c, senza i pacchetti raccomandati
    && apt-get install -y --no-install-recommends gcc \  
    #quando compilo un programma in c mi serve questa dipendenza per far capire al compilatore dove trovare librerie e header
    pkg-config \
    default-libmysqlclient-dev \
    build-essential \
    #rimuovo file inutili che appesantiscono la build
    && rm -rf /var/lib/apt/lists/*

#set locales
RUN echo "it_IT.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen && \
    update-locale LANG=it_IT.UTF-8

WORKDIR /back_end_desyra

#creo virtual env fase di build
ENV VIRTUAL_ENV=/back_end_desyra/.venv
RUN python -m venv back_end_desyra/.venv
#metto dentro al path il percorso del vrtual env
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

COPY requirements.txt /back_end_desyra
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY .  /back_end_desyra

#stage fase
FROM python:3.12-slim

#punto virtual env su variabili d'ambiente
ENV VIRTUAL_ENV=/back_end_desyra/.venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

#copio fle compilati nella fase di build 
COPY --from=builder back_end_desyra/.venv back_end_desyra/.venv
COPY --from=builder back_end_desyra back_end_desyra 

EXPOSE 8000

WORKDIR /back_end_desyra

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]




