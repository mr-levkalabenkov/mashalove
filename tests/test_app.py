import pytest
from app import create_app

@pytest.fixture
def app():
    app = create_app()
    app.config.update({
        "TESTING": True,
        "SQLALCHEMY_DATABASE_URI": "sqlite:///:memory:"
    })
    return app

@pytest.fixture
def client(app):
    return app.test_client()

def test_home(client):
    response = client.get("/")
    assert response.status_code == 200