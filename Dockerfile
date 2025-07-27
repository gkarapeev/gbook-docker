ARG BASE_IMAGE=alpine:3.22
FROM ${BASE_IMAGE}

# NGINX
RUN apk add --no-cache nginx
COPY nginx.conf /etc/nginx/nginx.conf

# FE
COPY gbook-frontend/dist/gbook-frontend/browser /usr/share/nginx/html

# BE
COPY gbook-backend/dist /gbook
COPY gbook-backend/.env /gbook/.env
COPY gbook-backend/db/data.db /gbook/db/data.db

WORKDIR /gbook

CMD ["sh", "-c", "./this_project_id_285410 & nginx -g 'daemon off;'"]
