FROM n8nio/n8n:latest

USER root

# Install FFmpeg (using apk for Alpine Linux, which n8n's base image typically uses)
RUN apk update && apk add --no-cache ffmpeg

# Install custom n8n nodes
# Ensure the directory exists and install the package
RUN mkdir -p /home/node/.n8n/nodes && \
    npm install --prefix /home/node/.n8n/nodes --production --silent @codelytv/n8n-nodes-twitch

# Switch back to the 'node' user for security best practices
USER node