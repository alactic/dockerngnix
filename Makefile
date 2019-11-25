build:
	sudo docker build -t couchbase-custom .

activate:
	chmod +x configure.sh

run:
	sudo docker rm -f couchbase1
	sudo docker run -d  -p 9091-9093:8091-8093 -e COUCHBASE_ADMINISTRATOR_USERNAME=Administrator -e COUCHBASE_ADMINISTRATOR_PASSWORD=password -e COUCHBASE_BUCKET=default -e COUCHBASE_BUCKET_PASSWORD= --network="bridge" --name couchbase1 couchbase-custom


verify:
	sudo docker logs -f couchbase1ac

dockercompose:
	docker-compose run -d --service-ports couchbase