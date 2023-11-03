/*******************************************************************************
	Ce sous-programme calcule la somme de deux entiers représentés comme des
	vecteurs d'octets, puis conserve le résultat dans un vecteur d'octets.


	Entrées:
		x0: adresse du premier entier
		x1: adresse du second entier
		x2: adresse du résultat
		x3: longueur des entiers et du résultat en octets


	Sorties:
		[x2]: Résultat de la somme des entiers
		x0: débordement (0 = faux, 1 = vrai)
		bit C des codes condition: report final de l'opération

	Auteur.e.s:
*******************************************************************************/


.include "/root/SOURCES/ift209/tools/ift209.as"
.global Addition


.section ".text"




Addition:
		SAVE



		RESTORE
		ret
