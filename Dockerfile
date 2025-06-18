FROM n8nio/n8n:latest

USER root

# Install FFmpeg (using apk for Alpine Linux, which n8n's base image typically uses)
RUN apk update && apk add --no-cache ffmpeg

# Switch back to the 'node' user for security best practices
USER node