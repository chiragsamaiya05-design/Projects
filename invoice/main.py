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

    def __init__(self):
        self.items = input("Enter item name : ")
        self.qty = int(input("Enter Quantity of items : "))
        self.price = float(input("Enter price of item : "))

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
            

class Invoice(Customer,Items):
    cgst= 0.025
    sgst = 0.025

    

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

       
a =[]
c1 = Customer('Chirag',9898)
k = int(input("enter : "))
for it in range(k):
    print("\n")
    item = Items()
    a.append(item)
    item.disp_item()
    item.item_calc()

dis = float(input("\nEnter percentage of discount you want to give on items : "))
gst = float(input("Enter percentage of GST  you want to apply  on items : "))
I1 = Invoice(c1,a,dis,gst,gst)
I1.display()