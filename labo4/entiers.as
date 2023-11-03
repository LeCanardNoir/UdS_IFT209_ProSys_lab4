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
		adds 	x22, xzr, xzr

Addition_byteloop:
		cbz		x3, Addition_byteloopEnd

		ldrsb 	x20, [x0], #1
		ldrsb 	x21, [x1], #1


		mov		x9, #1
		mov		x10, #0
		csel	x10, x9, x10, cs

		adcs 	x22, x20, x21
		strb  	w22, [x2], #1


		sub 	x3, x3, #1
		b.al 	Addition_byteloop

Addition_byteloopEnd:
		add		x21, x21, x10
		lsl		x20, x20, #56
		lsl		x21, x21, #56
		adcs	x22, x20, x21
		mov		x15, #1
		csel	x0, x15, xzr, vs


		RESTORE
		ret
