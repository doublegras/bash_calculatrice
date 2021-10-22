#!/bin/bash

addition="add"
soustraction="subtract"
division="divide"
multiplication="multiply"


regex="^[+-]?[0-9]+$"


# si il n'y y a pas de 1er arg ou si il ne correspond pas au regex
if [ -z $1 ] || ! [[ $1 =~ $regex ]] ; then
  # Force l'utilisateur à entrer le premier nombre entier (pos/nég)
  while ! [[ $nb1 =~ $regex ]]
  do
    echo -n "Entrez un premier nombre: "
    read nb1
  done
else
  nb1=$1
fi


# si il n'y y a pas de 2e arg ou si il ne correspond pas au regex
if [ -z $2 ] || ! [[ $2 =~ $regex ]]; then
  # Force l'utilisateur à entrer le deuxième nombre eniter (pos/nég)
  while ! [[ $nb2 =~ $regex ]]
  do
    echo -n "Entrez un deuxième nombre: "
    read nb2
  done
else
  nb2=$2
fi


# Force l'utilisateur à entrer un opérateur si il n'y en a pas ou si il ne correspond pas
if [ -z $3 ] || [[ "$3" != @($addition|$soustraction|$multiplication|$division) ]]; then
  while [[ "$op" != @($addition|$soustraction|$multiplication|$division) ]]
  do
    echo -n "Entrez un opérateur: "
    read op
  done
else
  op=$3
fi


# calculs
add() {
  echo $(( $1 + $2 ))
}

subtract() {
  echo $(( $1 - $2 ))
}

multiply() {
  echo $(( $1 * $2 ))
}

divide() {
  echo $(( $1 / $2 ))
}


# appel des fonctions
if [ "$op" == $addition ]; then
  add nb1 nb2
elif [ "$op" == $soustraction ]; then
  subtract nb1 nb2
elif [ "$op" == $multiplication ]; then
  multiply nb1 nb2
else
  divide nb1 nb2
fi

