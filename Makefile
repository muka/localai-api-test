LOCALAI=http://localhost:8080

setup/models:
	curl ${LOCALAI}/models/apply -H "Content-Type: application/json" -d '{ "id": "model-gallery@bert-embeddings" }'  
	curl ${LOCALAI}/models/apply -H "Content-Type: application/json" -d '{ "id": "model-gallery@mistral" }'  

start/localai:
	docker compose up localai-emb localai-api caddy