import pandas as pd
import random
from datetime import datetime, timedelta

medicines = [
("Paracetamol","Tablet"),
("Ibuprofen","Tablet"),
("Azithromycin","Antibiotic"),
("Amoxicillin","Antibiotic"),
("Cetirizine","Allergy"),
("Metformin","Diabetes"),
("Atorvastatin","Cholesterol"),
("Omeprazole","Gastric"),
("Aspirin","Painkiller"),
("Vitamin C","Supplement"),
("Pantoprazole","Gastric"),
("Losartan","Blood Pressure"),
("Diclofenac","Painkiller"),
("Montelukast","Allergy"),
("Glimepiride","Diabetes"),
("Ranitidine","Gastric")
]

customers = [
"Amit","Rahul","Sneha","Riya","Karan",
"Priya","Ankit","Neha","Vikas","Pooja"
]

data = []

start_date = datetime(2025,1,1)

for i in range(10000):

    order_id = 1000 + i

    date = start_date + timedelta(days=random.randint(0,90))

    customer_name = random.choice(customers)

    medicine, category = random.choice(medicines)

    price = random.randint(20,200)
    qty = random.randint(1,10)

    discount = random.randint(5,20)
    tax = random.randint(5,18)

    base_amount = price * qty

    discount_amount = base_amount * discount / 100
    amount_after_discount = base_amount - discount_amount

    tax_amount = amount_after_discount * tax / 100

    grand_total = round(amount_after_discount + tax_amount,2)

    pts = price - random.randint(5,15)
    ptr = pts - random.randint(3,8)

    data.append([
        order_id,
        date.strftime("%Y-%m-%d"),
        customer_name,
        medicine,
        category,
        price,
        qty,
        discount,
        tax,
        pts,
        ptr,
        grand_total
    ])

df = pd.DataFrame(data,columns=[
"order_id",
"date",
"customer_name",
"name",
"category",
"price",
"qty",
"discount",
"tax",
"pts",
"ptr",
"grand_total"
])

df.to_csv("medical_orders_dataset.csv",index=False)

print("CSV dataset created successfully")