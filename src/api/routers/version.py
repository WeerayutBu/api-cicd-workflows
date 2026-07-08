from fastapi import APIRouter

from src.api.core.config import settings

router = APIRouter()


@router.get("/api/version")
def version():
    return {"name": settings.app_name, "version": settings.app_version}
