from fastapi import FastAPI

from src.api.core.config import settings
from src.api.routers import health, version

app = FastAPI(title=settings.app_name)

app.include_router(health.router)
app.include_router(version.router)
