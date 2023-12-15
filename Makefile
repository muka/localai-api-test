LOCALAI=http://localhost:8080

setup/models: start/localai
	curl ${LOCALAI}/models/apply -H "Content-Type: application/json" -d '{ "id": "model-gallery@bert-embeddings" }'  
	curl ${LOCALAI}/models/apply -H "Content-Type: application/json" -d '{ "id": "model-gallery@mistral" }'  
	sudo cp config/*.yaml data/models/

start/localai:
	docker compose up localai-emb localai-api caddy -d

logs/localai:
	docker compose logs -f

bash:
	docker compose run --rm -it --entrypoint bash app

