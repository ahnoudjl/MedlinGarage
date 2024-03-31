USE medlin;

INSERT INTO marque VALUES (1, 'Renault');
INSERT INTO marque  VALUES (2, 'Peugeot');
INSERT INTO marque VALUES (3, 'Mercédès');

INSERT INTO type_vehicule VALUES (1, 'Kangoo');  
INSERT INTO type_vehicule  VALUES (2, 'Captur');
INSERT INTO type_vehicule VALUES (3, '308');
INSERT INTO type_vehicule VALUES (4, '2008');

INSERT INTO client VALUES (1,  'Mohamed1', 'Mahmoud1', 'Reims, Rue 2, 25', '656944587', 'mohamed@mail.com');
INSERT INTO client VALUES (2,  'Mohamed2', 'Mahmoud2', 'Reims, Rue 2, 25', '656945458', 'mohamed2@mail.com');
INSERT INTO client VALUES (3,  'Mohamed3', 'Mahmoud3', 'Reims, Rue 2, 25', '656494458', 'mohamed3@mail.com');
INSERT INTO client VALUES (4,  'Mohamed4', 'Mahmoud4', 'Reims, Rue 2, 25', '656944558', 'mohamed4@mail.com');

INSERT INTO vehicule VALUES ('AA-001-AA',  '2020-12-11', 1, 1, 1); -- DATE : AAAA-MM-JJ
INSERT INTO vehicule VALUES ('AA-999-AZ',  '2021-02-12',  2, 2, 3);
INSERT INTO vehicule VALUES ('AB-001-AA',  '2019-05-10',  1, 3, 2);
INSERT INTO vehicule VALUES ('ZZ-999-ZZ',  '2022-12-03',  3, 4, 4);
INSERT INTO vehicule VALUES ('AB-010-AA',  '2018-10-05',  1, 1, 2);
INSERT INTO vehicule VALUES ('ZZ-900-ZZ',  '2021-12-03',  3, 2, 4);

INSERT INTO operation VALUES (1, 'vidange', 50, 20);
INSERT INTO operation VALUES (2, 'système de freinage', 40, 20);
INSERT INTO operation VALUES (3,  'système électrique',  30, 20);
INSERT INTO operation VALUES (4,  'moteur', 60, 20);
INSERT INTO operation VALUES (5,  'distribution', 50, 20);
INSERT INTO operation VALUES (6, 'montage de pneus', 20, 20);

INSERT INTO prestation VALUES (1, 'équilibrage', 50, 20);
INSERT INTO prestation VALUES (2, 'embrayage', 40, 20);
INSERT INTO prestation VALUES (3,  'disques de frein',  30, 20);
INSERT INTO prestation VALUES (4,  'plaquettes de frein', 60, 20);

INSERT INTO piece VALUES (1, 'plaquettes de frein', 35, 20);
INSERT INTO piece VALUES (2, 'kit tambour / garniture', 150, 20);
INSERT INTO piece VALUES (3,  'disques de frein',  30, 20);
INSERT INTO piece VALUES (4,  'filtre à habitacle', 15, 20);
INSERT INTO piece VALUES (5,  'soufflet de cardan', 30, 20);
INSERT INTO piece VALUES (6,  'filtre à air ', 20, 20);
INSERT INTO piece VALUES (7,  'Batterie', 20, 20);


INSERT INTO mecanicien VALUES (1,  'Mohamed1', 'Mechnique1', 'Reims, Rue 2, 25', '6546944587', 'Mechnique@mail.com', 50);
INSERT INTO mecanicien VALUES (2,  'Mohamed2', 'Mechnique2', 'Reims, Rue 2, 25', '6456945458', 'Mechnique2@mail.com', 55);
INSERT INTO mecanicien VALUES (3,  'Mohamed3', 'Mechnique3', 'Reims, Rue 2, 25', '6564494458', 'Mechnique3@mail.com', 70);
INSERT INTO mecanicien VALUES (4,  'Mohamed4', 'Mechnique4', 'Reims, Rue 2, 25', '6546944558', 'Mechnique4@mail.com', 60);

INSERT INTO rendez_vous VALUES (1,  CURDATE(), 'AA-001-AA', 1); -- DATE : AAAA-MM-JJ
INSERT INTO rendez_vous VALUES (2,  CURDATE(), 'AA-999-AZ', 2); 
INSERT INTO rendez_vous VALUES (3,  DATE_ADD(CURDATE(),INTERVAL 2 DAY), 'AB-001-AA', 3); 
INSERT INTO rendez_vous VALUES (4,  DATE_ADD(CURDATE(),INTERVAL 3 DAY), 'ZZ-999-ZZ', 4); 

INSERT INTO tache VALUES (1,  1); 
INSERT INTO tache VALUES (1,  2); 
INSERT INTO tache VALUES (2,  3); 
INSERT INTO tache VALUES (3,  2); 
INSERT INTO tache VALUES (3,  4); 
INSERT INTO tache VALUES (4,  1); 

-- Subtract month and day mysql : https://stackoverflow.com/questions/7568072/subtract-month-and-day-mysql

INSERT INTO reparation VALUES (1, DATE_SUB((DATE_SUB(curdate(), INTERVAL 2 MONTH)), INTERVAL 4 DAY), 56454, 4, 'AA-001-AA'); -- DATE : AAAA-MM-JJ
INSERT INTO reparation VALUES (2, DATE_SUB((DATE_SUB(curdate(), INTERVAL 2 MONTH)), INTERVAL 3 DAY), 5654, 3, 'ZZ-900-ZZ');
INSERT INTO reparation VALUES (3, DATE_SUB((DATE_SUB(curdate(), INTERVAL 2 MONTH)), INTERVAL 2 DAY), 5654, 3, 'AB-010-AA');
INSERT INTO reparation VALUES (4, DATE_SUB((DATE_SUB(curdate(), INTERVAL 1 MONTH)), INTERVAL 20 DAY), 56548, 6, 'AA-999-AZ');
INSERT INTO reparation VALUES (5, DATE_SUB((DATE_SUB(curdate(), INTERVAL 1 MONTH)), INTERVAL 15 DAY), 5654, 10, 'AB-010-AA');
INSERT INTO reparation VALUES (6, DATE_SUB((DATE_SUB(curdate(), INTERVAL 1 MONTH)), INTERVAL 14 DAY), 5654, 6, 'ZZ-999-ZZ');
INSERT INTO reparation VALUES (7, DATE_SUB((DATE_SUB(curdate(), INTERVAL 1 MONTH)), INTERVAL 13 DAY), 5654, 2, 'AB-001-AA');
INSERT INTO reparation VALUES (8, DATE_SUB((DATE_SUB(curdate(), INTERVAL 1 MONTH)), INTERVAL 12 DAY), 5645454, 4, 'AA-001-AA'); -- DATE : AAAA-MM-JJ
INSERT INTO reparation VALUES (9, DATE_SUB((DATE_SUB(curdate(), INTERVAL 1 MONTH)), INTERVAL 11 DAY), 5654444, 3, 'ZZ-900-ZZ');
INSERT INTO reparation VALUES (10, DATE_SUB((DATE_SUB(curdate(), INTERVAL 1 MONTH)), INTERVAL 10 DAY), 565454, 3, 'AB-010-AA');
INSERT INTO reparation VALUES (11, DATE_SUB((DATE_SUB(curdate(), INTERVAL 1 MONTH)), INTERVAL 9 DAY), 5654855, 6, 'AA-999-AZ');
INSERT INTO reparation VALUES (12, DATE_SUB((DATE_SUB(curdate(), INTERVAL 1 MONTH)), INTERVAL 4 DAY), 5654444, 10, 'AB-010-AA');
INSERT INTO reparation VALUES (13, DATE_SUB((DATE_SUB(curdate(), INTERVAL 1 MONTH)), INTERVAL 4 DAY), 5654554, 6, 'ZZ-999-ZZ');
INSERT INTO reparation VALUES (14, DATE_SUB((DATE_SUB(curdate(), INTERVAL 1 MONTH)), INTERVAL 2 DAY), 5654474, 2, 'AB-001-AA');

INSERT INTO reparation_d_entretien VALUES ('AA-001-AA', 1, 160000, 7);
INSERT INTO reparation_d_entretien VALUES ('AA-999-AZ', 4, 180000, 5);
INSERT INTO reparation_d_entretien VALUES ('AA-001-AA', 8, 160000, 7);

 

INSERT INTO operation_reparation VALUES (1,  1); 
INSERT INTO operation_reparation VALUES (3,  1); 
INSERT INTO operation_reparation VALUES (2,  4); 
INSERT INTO operation_reparation VALUES (3,  6); 
INSERT INTO operation_reparation VALUES (4,  2); 
INSERT INTO operation_reparation VALUES (5,  5); 
INSERT INTO operation_reparation VALUES (6,  3); 
INSERT INTO operation_reparation VALUES (3,  7); 
INSERT INTO operation_reparation VALUES (1,  8); 
INSERT INTO operation_reparation VALUES (6,  8); 
INSERT INTO operation_reparation VALUES (3,  9); 
INSERT INTO operation_reparation VALUES (4, 10); 
INSERT INTO operation_reparation VALUES (6, 11); 
INSERT INTO operation_reparation VALUES (2,  12); 
INSERT INTO operation_reparation VALUES (1,  12); 
INSERT INTO operation_reparation VALUES (5,  13); 
INSERT INTO operation_reparation VALUES (3,  14); 
INSERT INTO operation_reparation VALUES (6,  14); 

INSERT INTO prestation_reparation VALUES (1,  1); 
INSERT INTO prestation_reparation VALUES (1,  3); 
INSERT INTO prestation_reparation VALUES (2,  4); 
INSERT INTO prestation_reparation VALUES (3,  2); 
INSERT INTO prestation_reparation VALUES (4,  2); 
INSERT INTO prestation_reparation VALUES (5,  4); 
INSERT INTO prestation_reparation VALUES (6,  3); 
INSERT INTO prestation_reparation VALUES (7,  3); 
INSERT INTO prestation_reparation VALUES (8,  1); 
INSERT INTO prestation_reparation VALUES (8,  2); 
INSERT INTO prestation_reparation VALUES (9,  3); 
INSERT INTO prestation_reparation VALUES (10,  4); 
INSERT INTO prestation_reparation VALUES (11,  2); 
INSERT INTO prestation_reparation VALUES (12,  2); 
INSERT INTO prestation_reparation VALUES (12,  1); 
INSERT INTO prestation_reparation VALUES (13,  3); 
INSERT INTO prestation_reparation VALUES (14,  3); 
INSERT INTO prestation_reparation VALUES (14,  1); 

INSERT INTO remplacement VALUES (7, 1); 
INSERT INTO remplacement VALUES (1,  1); 
INSERT INTO remplacement VALUES (3,  1); 
INSERT INTO remplacement VALUES (2,  4); 
INSERT INTO remplacement VALUES (3,  6); 
INSERT INTO remplacement VALUES (4,  2); 
INSERT INTO remplacement VALUES (5,  5); 
INSERT INTO remplacement VALUES (6,  3); 
INSERT INTO remplacement VALUES (7,  7); 
INSERT INTO remplacement VALUES (8,  1); 
INSERT INTO remplacement VALUES (8,  6); 
INSERT INTO remplacement VALUES (9,  3); 
INSERT INTO remplacement VALUES (10,  4); 
INSERT INTO remplacement VALUES (11,  6); 
INSERT INTO remplacement VALUES (12,  2); 
INSERT INTO remplacement VALUES (12,  1); 
INSERT INTO remplacement VALUES (13,  5); 
INSERT INTO remplacement VALUES (14,  3); 
INSERT INTO remplacement VALUES (14,  6); 

INSERT INTO traitement VALUES ( 1, 1) ; 
INSERT INTO traitement VALUES ( 2, 1) ; 
INSERT INTO traitement VALUES ( 1, 3) ; 
INSERT INTO traitement VALUES ( 3, 3) ; 
INSERT INTO traitement VALUES ( 4, 3) ; 
INSERT INTO traitement VALUES ( 1, 4) ; 
INSERT INTO traitement VALUES ( 2, 3) ; 
INSERT INTO traitement VALUES ( 1, 2) ; 
INSERT INTO traitement VALUES ( 3, 1) ; 
INSERT INTO traitement VALUES ( 4, 2) ; 
INSERT INTO traitement VALUES ( 8, 4) ; 
INSERT INTO traitement VALUES ( 9, 2) ; 
INSERT INTO traitement VALUES ( 9, 1) ; 
INSERT INTO traitement VALUES ( 10, 3) ; 
INSERT INTO traitement VALUES ( 11, 4) ; 
INSERT INTO traitement VALUES (11, 1) ; 
INSERT INTO traitement VALUES ( 12, 2) ; 
INSERT INTO traitement VALUES ( 12, 3) ; 
INSERT INTO traitement VALUES ( 3, 4) ; 
INSERT INTO traitement VALUES ( 14, 1) ; 
INSERT INTO traitement VALUES ( 14, 2) ;






