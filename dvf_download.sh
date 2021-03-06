##! /bin/bash
DEFAULT_MILLESIME=2020-04

MILLESIME=${1:-$DEFAULT_MILLESIME}
if [ $MILLESIME = '2020-04' ]
then
  CQUEST_MILLESIME=202004
else
  CQUEST_MILLESIME=$MILLESIME
fi


mkdir -p data
cd data

# Téléchargement des fichiers DVF
for ANNEE in $(seq 2014 2019)
do
  if [ $ANNEE -ne 2014 ]
  then
    wget -N http://data.cquest.org/dgfip_dvf/$CQUEST_MILLESIME/valeursfoncieres-$ANNEE.txt.gz
  fi
  wget -N https://cadastre.data.gouv.fr/data/etalab-dvf/$MILLESIME/csv/$ANNEE/full.csv.gz -O $ANNEE-full.csv.gz
done
