def dal(per):
    ingre_dic ={
        "Toor Dal ":{"Quantity":0.25,"Unit":"cup"},
        "water":{"Quantity":1,"Unit":"cup "},
        
        "Turmiric":{"Quantity":0.5,"Unit":"tsp"} ,
        "Salt":{"Quantity":0,"Unit":"as you want"}
    }


    for item_dic,val_dic  in ingre_dic.items():
        val_dic["Quantity"]*=per
        print(f"{item_dic}: {val_dic['Quantity']} {val_dic['Unit']}")

