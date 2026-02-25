def besan_chilla(per):
    ingre_dic ={
        "Beasn ":{"Quantity":0.5,"Unit":"cup"},
        "water":{"Quantity":70,"Unit":"ml"},
        "onion":{"Quantity":1,"Unit":"small "},
        "coriander":{"Quantity":5,"Unit":"leaf"} ,
        "salt + Masalas":{"Quantity":0,"Unit":"As you want"}
    }


    for item_dic,val_dic  in ingre_dic.items():
        val_dic["Quantity"]*=per
        print(f"{item_dic}: {val_dic['Quantity']} {val_dic['Unit']}")






