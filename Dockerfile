FROM python:3.12-slim-bookworm


RUN apt-get update && apt-get install -y --no-install-recommends curl ca-certificates


ADD https://astral.sh/uv/install.sh /uv-installer.sh
RUN sh /uv-installer.sh && rm /uv-installer.sh


RUN pip install fastapi uvicorn


ENV PATH="/root/.local/bin:$PATH"


WORKDIR /app

# ✅ Copy all files (fixing the error)
COPY . /app

Expose 8000


CMD ["/root/.local/bin/uv", "run", "app.py"]
