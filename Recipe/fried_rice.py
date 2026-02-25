def fired_rice(per):
    ingre_dic ={
        "Cooked Rice ":{"Quantity":1,"Unit":"cup"},
        "Mixed Veggies":{"Quantity":0.5,"Unit":"cup "},
        "Soya Sauce":{"Quantity":1,"Unit":"tsp "},
        "Oil":{"Quantity":1,"Unit":"tsp"} ,
        "Garam masala":{"Quantity":0.5,"Unit":"tsp"}
    }


    for item_dic,val_dic  in ingre_dic.items():
        val_dic["Quantity"]*=per
        print(f"{item_dic}: {val_dic['Quantity']} {val_dic['Unit']}")


