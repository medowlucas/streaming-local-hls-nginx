FROM tiangolo/nginx-rtmp

# Copiar o arquivo de configuração
COPY nginx.conf /etc/nginx/nginx.conf

# Expondo as portas necessárias
EXPOSE 80 1935
