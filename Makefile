LOCALAI=http://localhost:8080

setup/models/embeddings:
	curl ${LOCALAI}/models/apply -H "Content-Type: application/json" -d '{ "id": "model-gallery@bert-embeddings" }'  
	make setup/copy-config

setup/models/mistral:
	curl ${LOCALAI}/models/apply -H "Content-Type: application/json" -d '{ "id": "model-gallery@mistral" }'  
	make setup/copy-config

setup/models/mixtral:
	wget https://huggingface.co/TheBloke/Mixtral-8x7B-Instruct-v0.1-GGUF/resolve/main/mixtral-8x7b-instruct-v0.1.Q2_K.gguf \
		-O data/models/mixtral-8x7b-instruct-v0.1.Q2_K.gguf
	sudo cp config/mixtral* data/models/

setup/copy-config:
	sudo cp config/*.yaml data/models/

start/localai:
	docker compose up localai-emb localai-api caddy -d

logs/localai:
	docker compose logs -f

bash:
	docker compose run --rm -it --entrypoint bash app

