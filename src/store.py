
import os
from langchain.vectorstores import Chroma
from langchain.embeddings import OpenAIEmbeddings
from langchain.text_splitter import CharacterTextSplitter
from langchain.document_loaders import TextLoader

model_name_emb = os.environ.get('MODEL_NAME_EMB', 'text-embedding-ada-002')

# Load and process the text
loader = TextLoader('data.txt')
documents = loader.load()

text_splitter = CharacterTextSplitter(chunk_size=300, chunk_overlap=70)
texts = text_splitter.split_documents(documents)

# Embed and store the texts
# Supplying a persist_directory will store the embeddings on disk
persist_directory = 'db'

embedding = OpenAIEmbeddings(model=model_name_emb)
vectordb = Chroma.from_documents(documents=texts, embedding=embedding, persist_directory=persist_directory)

vectordb.persist()
vectordb = None
