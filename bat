from tkinter import *
from tkinter.filedialog import askopenfilename
from tkinter.messagebox import showerror, showinfo
from batonnage import batonnage
from PIL import Image

class defaut():
    def __init__(self, modele, dateHeure_def, nat_def, loc_carto, lieu_def, origine_def, nbr_def, photo, photo2, commentaire):
        self.modele = modele
        self.dateHeure_def = dateHeure_def
        self.nat_def = nat_def
        self.loc_carto = loc_carto
        self.lieu_def = lieu_def
        self.origine_def = origine_def
        self.nbr_def = nbr_def
        self.photo = photo
        self.photo2 = photo2
        self.commentaire = commentaire

def parcourir():
    global imageName
    imn = askopenfilename(initialdir="/images", title="sélecionnez une image",filetypes = (("png files","*.png"),("jpeg files","*.jpg"),("jpeg files", "*.jpeg")))
    if imn:
        imageName=imn
    if imageName:
        texte = imageName.split("/")
        photoEntre.config(text=".../"+texte[-1])

def parcourir2():
    global imageName2
    
    imn2 = askopenfilename(initialdir="/images", title="sélecionnez une image",filetypes = (("png files","*.png"),("jpeg files","*.jpg"),("jpeg files", "*.jpeg")))
    print(type(imn2))
    if imn2:
        imageName2=imn2
    if imageName2:
        texte = imageName2.split("/")
        photoEntre2.config(text=".../"+texte[-1])

def valider():
    global liste_def, imageName, imageName2
    photo = imageName
    print(type(photo))
    photo2 = imageName2
    if modeleEntre.get() or dateHeure_defEntre.get() or nat_defEntre.get() or loc_cartoEntre.get() or lieu_defEntre.get() or origine_defEntre.get() or nbr_defEntre.get() or commentaire:
        pn = defaut(modeleEntre.get(), dateHeure_defEntre.get(), nat_defEntre.get(), loc_cartoEntre.get(), lieu_defEntre.get(), origine_defEntre.get(), nbr_defEntre.get(), photo, photo2, commentaireEntre.get("1.0",END))
        liste_def.append(pn)
        showinfo(title="valider",message="ok")
    else:
        showerror(title="erreur", message="saisir au moins un champ")
        

def appartient(liste,val):
    for i in range(len(liste)):
        if liste [i]:
            return 1
                    
def reinitialiser():
    global imageName, imageName2
    modeleEntre.delete(0, END)
    dateHeure_defEntre.delete(0, END)
    nat_defEntre.delete(0, END)
    loc_cartoEntre.delete(0, END)
    lieu_defEntre.delete(0, END)
    origine_defEntre.delete(0, END)
    nbr_defEntre.delete(0, END)
    imageName=''
    imageName2 = Image.open('blanc.jpg')
    photoEntre.configure(text="aucune image selectionner")
    photoEntre2.configure(text="aucune image selectionner")
    commentaireEntre.delete("1.0",END)



imageName,  liste_def = '', []
imageName2 = Image.open('blanc.jpg')

fen = Tk()
fen.geometry("525x480+150+50")
fen.title("Mise en place d'un barrage dans le flux")

contenu = Canvas(fen, bg="#03224C")

fontLabel = 'arial 13 bold'
fontEntre = 'arial 11 bold'



modele = Label(contenu, text="Modèle :", font=fontLabel, fg='white', bg="#03224C")
dateHeure_def = Label(contenu, text="Date et heure:", font=fontLabel, fg='white', bg="#03224C")
nat_def = Label(contenu, text="Nature:", font=fontLabel, fg='white', bg="#03224C")
loc_carto = Label(contenu, text="localisation cartographie :", font=fontLabel, fg='white', bg="#03224C")
lieu_def = Label(contenu, text="Lieu de détection:", font=fontLabel, fg='white', bg="#03224C")
origine_def = Label(contenu, text="Origine (imputation) :", font=fontLabel, fg='white', bg="#03224C")
nbr_def = Label(contenu, text="Nombre de cas :", font=fontLabel, fg='white', bg="#03224C")
enTete = Label(contenu, text="Mise en place du barrage dans le flux", font=fontLabel, fg="#03224C", bg='white')
photo = Label(contenu, text="insérez une photo", font=fontLabel, fg='white', bg="#03224C")
photo2 = Label(contenu, text="insérez une photo", font=fontLabel, fg='white', bg="#03224C")
commentaire = Label(contenu, text="Commentaire :", font=fontLabel, fg='white', bg="#03224C")


enTete.grid(row=0, column=0, columnspan=2)
modele.grid(row=1, column=0, sticky=E)
dateHeure_def.grid(row=2, column=0, sticky=E, padx=5, pady=5)
nat_def.grid(row=3, column=0, sticky=E, padx=5, pady=5)
loc_carto.grid(row=4, column=0, sticky=E, padx=5, pady=5)
lieu_def.grid(row=5, column=0, sticky=E, padx=5, pady=5)
origine_def.grid(row=6, column=0, sticky=E, padx=5, pady=5)
nbr_def.grid(row=7, column=0, sticky=E, padx=5, pady=5)
photo.grid(row=8, column=0, sticky=E, padx=5, pady=5)
photo2.grid(row=9, column=0, sticky=E, padx=5, pady=5)
commentaire.grid(row=10, column=0, sticky=E, padx=5, pady=5)



modeleEntre = Entry(contenu, font=fontEntre, width=30)
dateHeure_defEntre = Entry(contenu, font=fontEntre, width=30)
nat_defEntre = Entry(contenu, font=fontEntre, width=30)
loc_cartoEntre = Entry(contenu, font=fontEntre, width=30)
lieu_defEntre = Entry(contenu, font=fontEntre, width=30)
origine_defEntre = Entry(contenu, font=fontEntre, width=30)
nbr_defEntre = Entry(contenu, font=fontEntre, width=30)
photoEntre = Label(contenu, text="aucune image sélectionner", font='arial 8 bold', fg="#03224C", bg='white', width=30)
photoEntre2 = Label(contenu, text="aucune image sélectionner", font='arial 8 bold', fg="#03224C", bg='white', width=30)
buttonParcourir = Button(contenu, text="Pr", command=parcourir, font='arial 8 bold', fg="#03224C", bg='white')
buttonParcourir2 = Button(contenu, text="Pr", command=parcourir2, font='arial 8 bold', fg="#03224C", bg='white')
commentaireEntre = Text(contenu, font=fontEntre, height=2, width=30)


modeleEntre.grid(row=1, column=1, padx=5, pady=5)
dateHeure_defEntre.grid(row=2, column=1, padx=5, pady=5)
nat_defEntre.grid(row=3, column=1, padx=5, pady=5)
loc_cartoEntre.grid(row=4, column=1, padx=5, pady=5)
lieu_defEntre.grid(row=5, column=1, padx=5, pady=5)
origine_defEntre.grid(row=6, column=1, padx=5, pady=5)
nbr_defEntre.grid(row=7, column=1, padx=5, pady=5)
photoEntre.grid(row=8, column=1, padx=0, pady=5)
photoEntre2.grid(row=9, column=1, padx=0, pady=5)
buttonParcourir.grid(row=8, column=2, padx=5, pady=5)
buttonParcourir2.grid(row=9, column=2, padx=5, pady=5)
commentaireEntre.grid(row=10, column=1, padx=5, pady=5, sticky=W)




b2 = Button(fen, text="Réinitialiser l'entrée", command=reinitialiser, width=18, fg="#03224C", bg='white')
b3 = Button(fen, text="suivant", command=lambda:[valider(), batonnage(fen, liste_def)], width=10, fg="#03224C", bg='white')


b2.grid(row=5, column=0, pady=5)
b3.grid(row=6, column=0, pady=5)

contenu.grid(row=0, column=0, padx=5, pady=5)

fen.mainloop()
