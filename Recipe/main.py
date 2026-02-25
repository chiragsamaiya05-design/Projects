from besan_chilla import besan_chilla
from dal import dal
from fried_rice import fired_rice
from paneer_burji import paneer_burji

def main():
    while(True):
        print("""
1. Besan Chilla
2. Dal
3. Fried Rice
4. Paneer Burji
5. Exit
                """)
        choice = int(input("Enter Recipe number  that you want to make :"))
        
        if choice ==1:
            person = int(input("Enter no. of persons :"))
            besan_chilla(person)
        elif choice==2:
            person = int(input("Enter no. of persons :"))
            dal(person)
        elif choice == 3:
            person = int(input("Enter no. of persons :"))
            fired_rice(person)
        elif choice == 4:
            person = int(input("Enter no. of persons :"))
            paneer_burji(person)
        elif choice == 5:
            print("Thankyou for visiting !")
            break
        else:
            print("Invalid Choice")

main()