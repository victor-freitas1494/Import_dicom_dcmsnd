#!/usr/env bash

#---------------------------------------------------------
# CONFIGURAÇÃO BASH IFS
IFS=$(echo -e "\n")
#---------------------------------------------------------

#---------------------------------------------------------
# CONFIGURAÇÃO CONEXÃO COM O PACS
AET="RIOGRANDE"
HOST="192.168.70.70"
PORT="11112"
#---------------------------------------------------------

#---------------------------------------------------------
# ARQUIVOS DE LOGS DE ENVIO E ERRO
ARQUIVOSND="$1"
LOGSND="/opt/send.log"
LOGERRO="/opt/erro.log"
#---------------------------------------------------------

#---------------------------------------------------------
# CAMINHO DO PROGRAMA DCMSND E DCMDUMP
DCMSND="./bin/dcmsnd"
DCMDUMP="./bin/dcmdump"
#---------------------------------------------------------

#---------------------------------------------------------
# ARQUIVO CACHE TEMPORARIO
CACHETEMP="/opt/cachetemp.cache"
#---------------------------------------------------------

#---------------------------------------------------------
# DATABASE SQLITE E DRIVE SQLITE
DRIVESQL=""
DATABASE="/opt/database.sqlite"
#---------------------------------------------------------

while read -e linha || [ -n "$linha" ]; do
    if [ -e $linha ]; then
        if grep -q $linha $LOGSND; then
            echo -e "$linha: DICOM Foi Enviado Para PACS"
        else
            date +'%Y/%m/%d' -d '20230116'
