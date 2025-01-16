CREATE DATABASE IF NOT EXISTS labo1_php;

USE labo1_php;

--information importante
-- > varchar distinction entre null et '', obliger de lutiliser car a se que je lit il n'a pas dimplementation de varchar2

-- table --
create table users(
user_id int not null AUTO_INCREMENT,-- >auto incrementation afin de ne pas gerer avec les ids
user_firstname varchar(50) not null,
user_lastname varchar(50) not null,
user_age int(3) not null,
user_email varchar(250) not null unique,--doit etre unique
user_adresse varchar(250) null,-- > a surveiller car il permet d'avoir ' ' comme reponse
user_password varchar(50) not null,
Constraint pk_user_id Primary key (user_id)
)

create table produit_type(-- > je voulais faire un check mais ma version de mariadb ne la supportais pas  weird
produit_type varchar(50) primary key,
)


create table produit(
produit_id int not null AUTO_INCREMENT primary key,
produit_type varchar(50) not null,
produit_fournisseur varchar(100) not null,
produit_nom  varchar(50) not null,
constraint fk_produit_type foreign key (produit_type) references produit_type(produit_type)
    ON DELETE RESTRICT-- > si une row se fait delete ne delete pas les row de la table
    ON UPDATE CASCADE-- > si une row de produit_type se fait update on update les row de cette table
)
-- un jour, nous pourrions rajouter la table fournisseur, ils pourront rajouter les produit qu'ils veulent



create table commande(-- > junction table (table associative) entre users et produit
commande_id int not null,
commande_date Date,
user_id int not null,
produit_id int not null,-- > not unique

constraint pk_commande_id primary key (commande_id),
constraint fk_user_id foreign key (user_id) references users(user_id),
constraint fk_produit_id foreign key (produit_id) references produit(produit_id)
)
-- view --
create view v_commande as 
    select
        users.user_id,
        users.user_firstname,
        users.user_lastname,
        users.user_email,
        users.user_adresse,
        produit.produit_fournisseur,
        produit.produit_id,
        produit.produit_nom,
        commande.commande_id,
        commande.commande_date
    From commande
    join users on commande.user_id=users.user_id
    join produit on commande.produit_id=produit.produit_id; 

-- procedure simple --
DELIMITER $$-- > permet de changer le endl (;) avec un autre charachter obliger pour faire des procedure
create or replace procedure p_recuperer_commande(IN v_user_id int)
    begin 
        Select * 
        from v_commande
        where user_id=v_user_id;
END$$

DELIMITER ; -- > le remet a normal
