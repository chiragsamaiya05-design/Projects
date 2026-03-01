class Customer:

    cust_id = 0

    def __init__(self,name,ph):
        self.name = name
        self.ph = ph

        Customer.cust_id += 1
        self.cust_id = Customer.cust_id

    def customer_id(self):
       return {
           "Customer Id":self.cust_id,
           "Name":self.name,
           "Phone No.":self.ph
       }
               
       

class Items:
    it_list = []

    def __init__(self,items,qty,price):
        self.items = items
        self.qty = qty
        self.price = price

    def item_list(self):
        
        self.item ={
            "Items":self.items,
            "Quantity":self.qty,
            "Price":self.price
        }
        return self.item
    def disp_item(self):
        it_ls = self.item_list()
        for key ,value in it_ls.items():
            print(f"{key}:  {value}",end = " ")
        print("\ntotal price of item is :",self.qty*self.price)

    def item_calc(self):
        
        a =  self.price*self.qty
        Items.it_list.append(a)
        return self.it_list
    def item_total(self):
        self.sum = 0
        for i in self.it_list:
            self.sum += i
        return self.sum
            

class Invoice():
    def __init__(self, customer, item,disc,sgst,cgst):
        self.customer = customer
        self.item = item
        self.disc = disc/100
        self.sgst = sgst/100
        self.cgst = cgst/100

    def add_disc(self):
        self.ttl = 0
       
        self.ttl = item.item_total()
        self.dis_cal = self.ttl * self.disc
        self.add_dis = self.ttl - self.dis_cal
        return self.add_dis

    def tax_calc(self):
        
        self.total_gst = self.add_disc() *(self.cgst + self.sgst)
        self.Total = self.total_gst+self.add_disc()
        
        return self.Total
    
    def display(self):
        id_cust = self.customer.customer_id()
       
        for key , value in id_cust.items():
            print(f"{key}:{value}",)
        
        print("\nCGST that are applied on your items is :",self.cgst*100,"%")
        print("\nSGST that are applied on your items is :",self.sgst*100,"%")
        print("\n Total amount after GST  on your items is :",self.cgst*100,"%")
        print("\nTotal amount after GST and discounts",self.disc*100,"% : ",self.tax_calc())
        print()       

       
a =[]

name = input("Enter your name : ")
phone_no = input("Enter your phone number : ")
c1 = Customer(name,phone_no)
k = int(input("Enter the count of Items : "))
for it in range(k):
    items = input("Enter item name : ")
    qty = int(input("Enter Quantity of items : "))
    price = float(input("Enter price of item : "))
    item = Items(items,qty,price)
    a.append(item)
    item.disp_item()
    item.item_calc()

dis = float(input("\nEnter percentage of discount you want to give on items : "))
gst = float(input("Enter percentage of GST  you want to apply  on items : "))
I1 = Invoice(c1,a,dis,gst,gst)
print(" ")
I1.display()