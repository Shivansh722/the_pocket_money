from langchain_mistralai import MistralAIEmbeddings
from dotenv import load_dotenv
from langchain.text_splitter import RecursiveCharacterTextSplitter
from langchain_community.document_loaders import TextLoader
from langchain_community.vectorstores import SupabaseVectorStore
from supabase.client import Client, create_client
import os
import json

# Load environment variables
load_dotenv()

# Get Supabase credentials from environment variables
supabase_url = os.getenv("SUPABASE_URL")
supabase_key = os.getenv("SUPABASE_SERVICE_KEY")

# Create a Supabase client
supabase: Client = create_client(supabase_url, supabase_key)

# Load and split the text file into chunks
loader = TextLoader('text_file/text.txt')
docs = loader.load()

text_splitter = RecursiveCharacterTextSplitter(chunk_size=200, chunk_overlap=2)
splits = text_splitter.split_documents(docs)

# Generate embeddings for the text chunks
embeddings = MistralAIEmbeddings(model="mistral-embed", mistral_api_key=os.getenv('MISTRAL_AI_API'))
split_texts = [split.page_content for split in splits]
embedding_vectors = embeddings.embed_documents(split_texts)

# Print generated embeddings
print("Generated Embeddings:")
for i, embedding in enumerate(embedding_vectors):
    print(f"Embedding {i+1}: {embedding}")

# Store embeddings in Supabase with error handling
try:
    vector_store = SupabaseVectorStore.from_documents(
        docs,
        embeddings,
        client=supabase,
        table_name="handbook_docs",
        
        chunk_size=500,
    )
    print("Embeddings stored in Supabase")
except Exception as e:
    print(f"An error occurred: {e}")
    if hasattr(e, 'response') and e.response:
        try:
            print("Error details:", e.response.json())
        except Exception as json_err:
            print("Failed to parse error details:", json_err)
