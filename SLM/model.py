from transformers import AutoModelForCausalLM, AutoTokenizer
import torch
import pandas as pd

model_name = "microsoft/Phi-3-mini-4k-instruct"

tokenizer = AutoTokenizer.from_pretrained(model_name)

model = AutoModelForCausalLM.from_pretrained(
    model_name,
    torch_dtype=torch.float32,
    device_map="auto"
)

df = pd.read_csv("C:\\Users\\chira\\Projects_intern\\SLM\\data.csv")

context = df.head(20).to_string()

question = "Which medicine has the highest sales?"

prompt = f"""
you are  a pharmacy sales analyst

dataset:
{context}

Question:{question}

Answer:
"""

inputs = tokenizer(prompt, return_tensors="pt")

output = model.generate(
    **inputs,
    max_new_tokens=100
)

print(tokenizer.decode(output[0], skip_special_tokens=True))