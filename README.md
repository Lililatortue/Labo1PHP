# Labo1PHP
Formulaire qui permet au utilisateur de saisir des informations et calcul les taxes en respectant les exemption sur certain produits

# Formulaire
Doit permettre au client de faire des commandes 
- Il contient le nom du client 
- Il permet de rajouter des produit
- Une fois tous est commander il retourne le total


# Backend

## Produit
certain sont exmpter de la TPS->
- Vins non alcoolisés
- Produits pour bébés
- Jouets
- Voitures électriques neuves

## Calcul des taxes
un objet qui calcul le montant total


# Backend/DB

trois table

### users
enregistre les users leur information et leur mot de passe

### produit 
enregistre les produits disponible

### commande

enregistre tous les commandes fait par client est une table associative avec une primary key
