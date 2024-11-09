# Projeto de Streaming Local com NGINX, FFmpeg e HLS

Este projeto configura um servidor de streaming para vídeos locais utilizando NGINX com o módulo RTMP e FFmpeg. O objetivo é transmitir vídeos na rede interna via protocolo HTTP Live Streaming (HLS), permitindo acesso através de diferentes dispositivos na rede.

## Funcionalidades

- **Streaming Local**: Distribui arquivos de vídeo em formato `.m3u8` e `.ts` para reprodução via HLS.
- **Conversão Automática**: Converte arquivos de vídeo (`.mkv`) para HLS automaticamente usando FFmpeg.
- **Configuração de Segmentos**: Define a duração dos segmentos de vídeo para otimizar a transmissão na rede local.
- **Acesso pela Rede Interna**: Acessível através de dispositivos conectados na mesma rede Wi-Fi.

## Requisitos

- Docker
- FFmpeg
- NGINX com módulo RTMP

## Executando o Projeto

1. Inicie o projeto com o comando:
   ```bash
   docker-compose up -d
   ```
2. Insira um vídeo na pasta videos com o nome "input.mkv"

3. Converta o vídeo para stream utilizando o comando:
    ```bash
    docker exec -it ffmpeg_converter sh -c "cd /usr/local/bin && ./convert.sh"
    ```

4. Acesse a stream em http://localhost:8080

