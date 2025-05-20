FROM grafana/tempo:latest

USER root
# Copy the configuration file template
COPY tempo.yaml /etc/tempo.yaml.template

# Copy the entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose the necessary ports
EXPOSE 3200
EXPOSE 4317
EXPOSE 4318

# Use the entrypoint script to substitute environment variables at container startup
ENTRYPOINT ["/entrypoint.sh"]