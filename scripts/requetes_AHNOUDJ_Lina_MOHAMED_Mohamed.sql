
USE medlin;

-- R1 : Donner la liste des clients avec leurs véhicules. 
SELECT c.Nom, c.Prenom AS nom_complet, c.Email, 
		 v.Num_matricule, m.Titre AS Marque_, t.titre type
FROM client c
JOIN vehicule v
ON v.FK_Id_Client = c.Id_Client
JOIN marque m
ON v.fk_id_marque = m.id_marque
JOIN type_vehicule t
ON v.FK_Id_Type_Vehicule = t.Id_Type_Vehicule;





-- R2 : La liste des rendez-vous clients de la journée. 
WITH rendez_vous_aujourdhui AS (
	SELECT r.*
	FROM rendez_vous r
	WHERE r.Date_rendez_vous = CURDATE()
)
 
SELECT r.Date_rendez_vous, c.Nom, c.Prenom, c.Email, 
		 v.Num_matricule, m.Titre AS Marque_, t.titre type
FROM rendez_vous_aujourdhui r 
JOIN vehicule v
ON r.FK_Num_matricule = v.Num_matricule
JOIN client c
ON v.FK_Id_Client = c.Id_Client
JOIN marque m
ON v.fk_id_marque = m.id_marque
JOIN type_vehicule t
ON v.FK_Id_Type_Vehicule = t.Id_Type_Vehicule;





-- R3 : La liste des rendez-vous clients de la semaine.
WITH rendez_vous_aujourdhui AS (
	SELECT *
	FROM rendez_vous
	WHERE Date_rendez_vous BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 7 DAY)
)
 
SELECT r.Date_rendez_vous, c.Nom, c.Prenom, c.Email, 
		 v.Num_matricule, m.Titre AS Marque_, t.titre type
FROM rendez_vous_aujourdhui r
JOIN vehicule v
ON r.FK_Num_matricule = v.Num_matricule
JOIN client c
ON v.FK_Id_Client = c.Id_Client
JOIN marque m
ON v.fk_id_marque = m.id_marque
JOIN type_vehicule t
ON v.FK_Id_Type_Vehicule = t.Id_Type_Vehicule;





-- R4: Le planning des mécaniciens
SELECT  r.Date_rendez_vous, m.Nom, m.Prenom, m.Email, 
		 v.Num_matricule, ma.Titre AS Marque_, ty.titre type
FROM mecanicien m
JOIN tache t
ON m.Id_Mecanicien = t.FK_Id_Mecanicien
JOIN rendez_vous r
ON t.FK_Id_Rendez_vous = r.Id_Rendez_vous
JOIN vehicule v
ON v.Num_matricule = r.FK_Num_matricule
JOIN marque ma
ON v.fk_id_marque = ma.id_marque
JOIN type_vehicule ty
ON v.FK_Id_Type_Vehicule = ty.Id_Type_Vehicule;





-- R5: La facturation de la réparation
WITH reparation_en_question AS (
	SELECT *
	FROM reparation 
	WHERE id_reparation = 2 -- id de la reparation en question
)

SELECT  rep.id_reparation, rep.date_reparation, (rep.nbr_heure * me.Prix_heure) AS main_doeuvre,
			op.Titre operation_, op.Prix prx_operation, op.TVA tva_operation,
			pre.Titre prestation_, pre.Prix prx_prestation, pre.TVA tva_prestation,
			pie.Titre piece_, pie.Prix prx_piece, pie.TVA tva_piece
FROM reparation_en_question rep
JOIN traitement tr 
ON tr.FK_Id_Reparation = rep.id_reparation
JOIN mecanicien me
ON me.id_mecanicien = tr.FK_Id_Mecanicien
JOIN remplacement re
ON re.FK_Id_Reparation = rep.id_reparation
JOIN piece pie
ON pie.Id_Piece = re.FK_Id_Piece
JOIN prestation_reparation pr_rep
ON pr_rep.FK_Id_Reparation = rep.id_reparation
JOIN prestation pre 
ON pre.Id_Prestation = pr_rep.FK_Id_Prestation
JOIN operation_reparation op_rep
ON op_rep.FK_Id_Reparation = rep.id_reparation
JOIN operation op
ON op.Id_Operation = op_rep.FK_Id_Operation;




-- R6: La liste des réparations faites sur un véhicule depuis un temps donné
WITH reparation_vehicule_en_question AS (
	SELECT r.*
	FROM reparation r
	WHERE r.FK_Num_matricule = 'AA-001-AA' -- id de la vehicule en question
	AND r.Date_reparation >= DATE_SUB((DATE_SUB(CURDATE(), INTERVAL 2 MONTH)), INTERVAL 4 DAY)
	)
	
SELECT r.Id_Reparation, v.Num_matricule, m.Titre AS Marque_, t.titre TYPE, 
		r.Date_reparation, r.Kilometrage, r.Nbr_heure
FROM reparation_vehicule_en_question r
JOIN vehicule v
ON v.Num_matricule = r.FK_Num_matricule
JOIN marque m
ON v.fk_id_marque = m.id_marque
JOIN type_vehicule t
ON v.FK_Id_Type_Vehicule = t.Id_Type_Vehicule;




-- R7: Le montant total de la facturation d’une réparation
WITH reparation_en_question AS (
	SELECT *
	FROM reparation 
	WHERE id_reparation = 2 -- id de la reparation en question
)

SELECT  rep.id_reparation, rep.date_reparation, 
			((rep.nbr_heure * me.Prix_heure) +
			 op.Prix  + pre.Prix + pie.Prix ) AS 'Sous Total HT',
			(op.TVA * op.Prix+pre.TVA* pre.Prix+pie.TVA * pie.Prix)/100 AS 'taux TVA Total',
			 (rep.nbr_heure * me.Prix_heure) +
			 (op.Prix + op.TVA/100 * op.Prix) +
			 (pre.Prix +  pre.TVA/100* pre.Prix)+
			 (pie.Prix + pie.TVA/100 * pie.Prix) AS 'Montant Total TTC'
FROM reparation_en_question rep
JOIN traitement tr 
ON tr.FK_Id_Reparation = rep.id_reparation
JOIN mecanicien me
ON me.id_mecanicien = tr.FK_Id_Mecanicien
JOIN remplacement re
ON re.FK_Id_Reparation = rep.id_reparation
JOIN piece pie
ON pie.Id_Piece = re.FK_Id_Piece
JOIN prestation_reparation pr_rep
ON pr_rep.FK_Id_Reparation = rep.id_reparation
JOIN prestation pre 
ON pre.Id_Prestation = pr_rep.FK_Id_Prestation
JOIN operation_reparation op_rep
ON op_rep.FK_Id_Reparation = rep.id_reparation
JOIN operation op
ON op.Id_Operation = op_rep.FK_Id_Operation;




-- R8: Liste des reparations d'entretien d'un vehicule
WITH reparations_en_question AS (
	SELECT r.*
	FROM reparation_d_entretien r
	WHERE r.FK_Num_matricule = 'AA-001-AA'
)

SELECT rep.id_reparation, rep.date_reparation, r.taux_kilometrage AS cycle_kelometrage, r.nbr_annee AS cycle_annee
FROM reparations_en_question r
JOIN reparation rep
ON rep.Id_Reparation = r.FK_Id_Reparation;
