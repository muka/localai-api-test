
import os
from langchain.vectorstores import Chroma
from langchain.embeddings import OpenAIEmbeddings
from langchain.chat_models import ChatOpenAI
from langchain.chains import RetrievalQA
from langchain.vectorstores.base import VectorStoreRetriever

model_name = os.environ.get('MODEL_NAME', 'mistral')
model_name_emb = os.environ.get('MODEL_NAME_EMB', 'text-embedding-ada-002')
persist_directory = 'db'

# Load and process the text
embedding = OpenAIEmbeddings(model=model_name_emb)

# Now we can load the persisted database from disk, and use it as normal. 
llm = ChatOpenAI(temperature=0, model_name=model_name)
vectordb = Chroma(persist_directory=persist_directory, embedding_function=embedding)
retriever = VectorStoreRetriever(vectorstore=vectordb)
qa = RetrievalQA.from_llm(llm=llm, retriever=retriever)

query = "What the topic of COP28?"
print(qa.run(query))

