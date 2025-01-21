FROM python:3.11-alpine
COPY --from=ghcr.io/astral-sh/uv:0.5.21 /uv /uvx /bin/
RUN adduser pytr -D -u 1000
USER 1000
WORKDIR /home/pytr/
COPY --chown=1000:1000 README.md pyproject.toml uv.lock ./
COPY --chown=1000:1000  pytr/ ./pytr/
RUN uv sync --frozen
ENV PATH="$PATH:/home/pytr/.venv/bin"
CMD [ "pytr" ]
