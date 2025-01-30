# %%
# Querying my bibtext file and another test file.  
# QUESTIONS:
# 1.) best way to format bibliographic information e.g. it doesn't think I have written any papers
# 2.) am I using chatgpt4 or what?
# 3.) any way to speed this up?
# 4.) where do the hallucinations come from?  Does the query go back to OpenAI or is it generated on my local machine?
#
# started from: https://levelup.gitconnected.com/creating-your-own-ai-powered-second-brain-a-guide-with-python-and-chatgpt-f5547ef7e136
#             and: https://github.com/jerryjliu/llama_index#-example-usage

import os
os.environ["OPENAI_API_KEY"] = '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'
import pathlib as pl

datDir = pl.Path("./tmp_personal_db_data")

from llama_index import GPTSimpleVectorIndex, SimpleDirectoryReader


# Load data from the journal text file

documents = SimpleDirectoryReader(datDir).load_data()

# Create a simple vector index
index = GPTSimpleVectorIndex.from_documents(documents)
index.save_to_disk(datDir / "generated_index.json")

# Create an infinite loop asking for user input and then breaking out of the loop when the response is empty
while True:
    query = input("Ask a question: ")
    #print(f"Got question: '{query}'")
    if not query:
        print("Goodbye")
        break

    # query the index with the question and print the result
    #print("about to query")
    result = index.query(query)
    #print(f"query returned: {result=}")
    print(result)
