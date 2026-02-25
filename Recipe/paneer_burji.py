def paneer_burji(per):
    ingre_dic ={
        "Paneer ":{"Quantity":100,"Unit":"gm"},
        "Onion":{"Quantity":1,"Unit":" "},
        "Green chill":{"Quantity":1,"Unit":" "},
        "Turmiric":{"Quantity":0.5,"Unit":"tsp"} ,
        "Garam masala":{"Quantity":0.5,"Unit":"tsp"}
    }


    for item_dic,val_dic  in ingre_dic.items():
        val_dic["Quantity"]*=per
        print(f"{item_dic}: {val_dic['Quantity']} {val_dic['Unit']}")
        
            


