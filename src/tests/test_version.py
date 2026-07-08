from fastapi.testclient import TestClient

from src.api.main import app

client = TestClient(app)


def test_version():
    response = client.get("/api/version")
    assert response.status_code == 200
    assert response.json() == {"name": "api-cicd-workflows", "version": "1.0.0"}
