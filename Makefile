setup:
	docker-compose up -d

stop:
	docker-compose down

clean:
	find . -type f -name "*.pyc" -delete
	find . -type d -name __pycache__ | xargs rm -fr {}

.PHONY: run stop clean
