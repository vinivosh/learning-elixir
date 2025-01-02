echo "[Discuss] Starting dev environment..." && \
  . ./~export-env.sh && \
  sudo docker compose down && \
  sudo docker compose up -d --build && \
  sleep 3 && \
  mix deps.get && \
  mix ecto.create && \
  mix ecto.migrate && \
  iex -S mix phoenix.server