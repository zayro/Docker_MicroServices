FROM apache/airflow:2.10.1-python3.11

# Establecer el usuario airflow como root
USER root

# Establecer una clave para el usuario root
RUN echo 'root:zayro' | chpasswd

# Establecer una clave para el usuario airflow
RUN echo 'airflow:zayro' | chpasswd

# Configurar sudo para que no solicite contraseña para el usuario airflow
RUN echo 'airflow ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Copiar el archivo requirements.txt al contenedor en la carpeta dags
COPY requirements.txt /opt/airflow/requirements.txt

COPY local /opt/airflow/

COPY config/airflow.cfg /opt/airflow/

# Copiar el archivo Oracle Instant Client al contenedor
COPY instantclient-basic-linux.x64-21.17.0.0.0dbru.zip /tmp/instantclient-basic-linux.x64-21.17.0.0.0dbru.zip

# Crear el directorio para tnsnames.ora
RUN mkdir -p /opt/oracle/instantclient_21_17/network/admin

# Copiar el archivo tnsnames.ora al contenedor
COPY tnsnames.ora /opt/oracle/instantclient_21_17/network/admin/tnsnames.ora

# Instalar Oracle Instant Client y otras dependencias
RUN apt-get update && \
    apt-get install -y sudo libaio1 nano build-essential unzip iputils-ping bash

RUN unzip -o /tmp/instantclient-basic-linux.x64-21.17.0.0.0dbru.zip -d /opt/oracle && \
    rm /tmp/instantclient-basic-linux.x64-21.17.0.0.0dbru.zip && \
    echo /opt/oracle/instantclient_21_17 > /etc/ld.so.conf.d/oracle-instantclient.conf && \
    ldconfig

# Configurar la variable de entorno TNS_ADMIN
ENV TNS_ADMIN=/opt/oracle/instantclient_21_17/network/admin

ENV ORACLE_HOME=/opt/oracle/instantclient_21_17
ENV LD_LIBRARY_PATH=/opt/oracle/instantclient_21_17
ENV PATH="/opt/oracle/instantclient_21_17:${PATH}"

# Cambiar al usuario airflow para ejecutar los comandos de pip
USER airflow

# Instalar dependencias de Python usando sudo
RUN sudo python -m pip install --upgrade pip && \
    sudo python -m pip install --upgrade setuptools wheel && \
    sudo python -m pip install oracledb  && \
    sudo python -m pip install apache-airflow-providers-oracle && \
    sudo python -m pip install cx_Oracle && \
    sudo python -m pip install openpyxl
    

RUN sudo pip install --no-cache-dir -r /opt/airflow/requirements.txt

# Establecer permisos correctos para airflow.cfg
USER root
RUN chown -R airflow /opt/airflow && \
    chmod -R 774 /opt/airflow

# Instalar dependencias adicionales si es necesario
# RUN pip install <dependencias>

USER airflow
