#!/bin/bash
# Cria o diretório /logs caso não exista
mkdir -p /logs

while true; do
  # Checa se o arquivo de entrada existe
  if [ -f /videos/input.mkv ]; then
     ffmpeg -i /videos/input.mkv -c:v libx264 -preset fast -c:a aac -strict -2 -f segment \
      -segment_time 30 -segment_format mpegts \
      -segment_list $OUTPUT_FILE -segment_list_flags +live \
      /stream/video%03d.ts 2>> $LOG_FILE
    if [ $? -eq 0 ]; then
      echo "Conversão concluída com sucesso."
    else
      echo "Erro na conversão. Verifique o log em /logs/ffmpeg_error.log"
    fi
  else
    echo "Arquivo de entrada não encontrado. Aguardando..."
  fi
  
  # Aguarda 5 segundos antes de tentar novamente
  sleep 5
done
