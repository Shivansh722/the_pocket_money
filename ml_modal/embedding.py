from dotenv import load_dotenv
from langchain_google_genai import GoogleGenerativeAIEmbeddings
from langchain.text_splitter import TextSplitter
from langchain_community.document_loaders import TextLoader
from langchain_mongodb.vectorstores import MongoDBAtlasVectorSearch
import os

load_dotenv()

class customTextSplitter(TextSplitter):
    def split_text(self,text):
        return text.strip().split("\n\n")

def store_vector(collection):
    loader = TextLoader('text_file/text.txt')
    docs = loader.load()
    
    text_splitter = customTextSplitter()
    splits = text_splitter.split_documents(docs)
    
    embeddings = GoogleGenerativeAIEmbeddings(model="models/embedding-001",google_api_key=os.getenv('GEMINI_API_KEY'))
    
    store = [] 

    for split in splits:
        store.append(split.page_content)
    
    # collection.delete_many({})
        
    MongoDBAtlasVectorSearch.from_documents(splits, embeddings, collection=collection, index_name="embeddings")
    # print(docsearch)
    print("Embeddings saved to MongoDB vector base")
    return "Embeddings saved to MongoDB vector base"


def query_vector_embedding(collection,query):
    embeddings = GoogleGenerativeAIEmbeddings(model="models/embedding-001",google_api_key=os.getenv('GEMINI_API_KEY'))

    vectorStore = MongoDBAtlasVectorSearch(collection, embeddings, index_name="vector_index")
    
    try:
        print("inside the function")
        print(query)
        docs = vectorStore.similarity_search(query, K=4)
        print("Vector Search Results:")
        print(len(docs))
        return docs
    except Exception as e:
        print("Database timeout or error:", str(e))
