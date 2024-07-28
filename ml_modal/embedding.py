from langchain_mistralai import MistralAIEmbeddings
from dotenv import load_dotenv
from langchain.text_splitter import RecursiveCharacterTextSplitter
from langchain_community.document_loaders import TextLoader
from langchain_community.vectorstores import SupabaseVectorStore
from supabase.client import Client, create_client
import os
import json

load_dotenv()

supabase_url = os.getenv("SUPABASE_URL")
supabase_key = os.getenv("SUPABASE_SERVICE_KEY")

supabase: Client = create_client(supabase_url, supabase_key)


loader = TextLoader('text_file/text.txt')
docs = loader.load()

text_splitter = RecursiveCharacterTextSplitter(chunk_size=50, chunk_overlap=2)
splits = text_splitter.split_documents(docs)

embeddings = MistralAIEmbeddings(model="mistral-embed", mistral_api_key=os.getenv('MISTRAL_AI_API'))
split_texts = [split.page_content for split in splits]
embedding_vectors = embeddings.embed_documents(split_texts)

for text, embedding in zip(split_texts, embedding_vectors):
    data = {
        "content": text,
        "embedding": embedding
    }
    response = supabase.table("handbook_docs").insert(data).execute()
    print(response)

