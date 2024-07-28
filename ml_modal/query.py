from langchain_mistralai import MistralAIEmbeddings
from dotenv import load_dotenv
from langchain.text_splitter import RecursiveCharacterTextSplitter
from langchain_community.document_loaders import TextLoader
from langchain_community.vectorstores import SupabaseVectorStore
from supabase.client import Client, create_client
import os

load_dotenv()

supabase_url = os.getenv("SUPABASE_URL")
supabase_key = os.getenv("SUPABASE_SERVICE_KEY")

supabase: Client = create_client(supabase_url, supabase_key)

loader = TextLoader('text_file/text.txt')
docs = loader.load()

text_splitter = RecursiveCharacterTextSplitter(chunk_size=200, chunk_overlap=2)
splits = text_splitter.split_documents(docs)

embeddings = MistralAIEmbeddings(model="mistral-embed", mistral_api_key=os.getenv('MISTRAL_AI_API'))
# split_texts = [split.page_content for split in splits]
# embedding_vectors = embeddings.embed_documents(split_texts)

# # Assuming you have the query_embedding as a specific document's embedding
# query_embedding = embedding_vectors[0]  # or another method to get the query embedding

# # Execute the RPC call and handle the response
# response = supabase.rpc('handbook_docs', {
#     'query_embedding': query_embedding,
#     'similarity_threshold': 0.78,
#     'match_count': 10
# }).execute()

# # Check the response
# if response.status_code != 200:
#     print(f"Error: {response.json()}")
# else:
#     data = response.json()
#     print(data)

vector_store = SupabaseVectorStore(
    embedding=embeddings,
    client=supabase,
    table_name="handbook_docs",
    query_name="match_documents",
)

query = "tag(hard)"
matched_docs = vector_store.similarity_search(query,k=2)

print(matched_docs)