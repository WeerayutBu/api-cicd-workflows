.PHONY: install run test lint fmt docker-build docker-run docker-clean clean lint-ci act

install:
	pip install -r requirements.txt

run:
	uvicorn src.api.main:app --reload

test:
	pytest

lint:
	ruff check .

fmt:
	ruff format .

docker-build:
	docker build -t api-cicd-workflows .

docker-run:
	docker run -p 8000:8000 --env-file .env api-cicd-workflows

docker-clean:
	docker rm -f $$(docker ps -aq --filter ancestor=api-cicd-workflows) 2>/dev/null || true
	docker rmi -f api-cicd-workflows 2>/dev/null || true

clean:
	find . -type d -name "__pycache__" -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete

lint-ci:
	actionlint .github/workflows/ci.yml

act:
	act -j test
