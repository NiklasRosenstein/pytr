FROM python:3.11-alpine
COPY --from=ghcr.io/astral-sh/uv:0.5.21 /uv /uvx /bin/
WORKDIR /app
COPY README.md pyproject.toml uv.lock ./
COPY pytr/ ./pytr/
RUN ls -lha && uv sync --frozen
ENV PATH="$PATH:/app/.venv/bin"
