delete from K_AllgAdresse where AllgAdrAdressArt is null and AllgAdrName1 is null
delete from Kurse where KurzBez is null
delete from Kurse where Jahr is null
delete from Kurse where Jahr=0
delete from Kurse where Abschnitt is null
delete from Kurse where Abschnitt=0
update SchuelerLeistungsdaten set Kurs_ID=Null where Kurs_ID is not null and not exists(select Kurse.ID from Kurse where Kurse.ID=SchuelerLeistungsdaten.Kurs_ID)
delete from SchuelerTelefone where Telefonart_ID is null
update Schueler set Einschulungsart_ID=null where Einschulungsart_ID is not null
delete from SchuelerVermerke where Vermerkart_ID is null
update Schueler set PLZ=Null where PLZ is not null and not exists(select K_Ort.ID from K_Ort where K_Ort.PLZ=Schueler.PLZ)
update SchuelerErzAdr set ErzPLZ=Null where ErzPLZ is not null and not exists(select K_Ort.ID from K_Ort where K_Ort.PLZ=SchuelerErzAdr.ErzPLZ)
update Schueler set Ortsteil_ID=Null where Ortsteil_ID is not null and not exists(select K_Ortsteil.ID from K_Ortsteil where K_Ortsteil.ID=Schueler.Ortsteil_ID)
update SchuelerErzAdr set ErzOrtsteil_ID=Null where ErzOrtsteil_ID is not null and not exists(select K_Ortsteil.ID from K_Ortsteil where K_Ortsteil.ID=SchuelerErzAdr.ErzOrtsteil_ID)
delete from SchuelerLernabschnittsdaten where Jahrgang_ID is null
delete from SchuelerLernabschnittsdaten where Jahrgang_ID=0
delete from SchuelerLernabschnittsdaten where Jahr is null
delete from SchuelerLD_PSFachBem where not exists(select SchuelerLernabschnittsdaten.ID from SchuelerLernabschnittsdaten where SchuelerLD_PSFachBem.Abschnitt_ID=SchuelerLernabschnittsdaten.ID)
delete from SchuelerLeistungsdaten where not exists(select SchuelerLernabschnittsdaten.ID from SchuelerLernabschnittsdaten where SchuelerLeistungsdaten.Abschnitt_ID=SchuelerLernabschnittsdaten.ID)
update Schueler set Klasse=null where Klasse is not null and not exists(select Versetzung.ID from Versetzung where Versetzung.Klasse=Schueler.Klasse)
update SchuelerLernabschnittsdaten set Klasse=null where Klasse is not null and not exists (select Versetzung.ID from Versetzung where Versetzung.Klasse=SchuelerLernabschnittsdaten.Klasse)
update Versetzung set KlassenlehrerKrz=null where KlassenlehrerKrz is not null and not exists (select K_Lehrer.ID from K_Lehrer where K_Lehrer.Kuerzel=Versetzung.KlassenlehrerKrz)
update SchuelerLernabschnittsdaten set Fachklasse_ID=null where Fachklasse_ID is not null and Fachklasse_ID not in (select EigeneSchule_Fachklassen.ID from EigeneSchule_Fachklassen)
update Versetzung set KlassenlehrerKrz=null where KlassenlehrerKrz is not null and not exists (select K_Lehrer.ID from K_Lehrer where K_Lehrer.Kuerzel=Versetzung.KlassenlehrerKrz)
update SchuelerLernabschnittsdaten set Klassenlehrer=null where Klassenlehrer is not null and not exists (select K_Lehrer.ID from K_Lehrer where K_Lehrer.Kuerzel=SchuelerLernabschnittsdaten.Klassenlehrer)
update SchuelerLeistungsdaten set Fachlehrer=null where Fachlehrer is not null and not exists (select K_Lehrer.ID from K_Lehrer where K_Lehrer.Kuerzel=SchuelerLeistungsdaten.Fachlehrer)
delete from SchuelerSprachenfolge where Fach_ID is null
delete from SchuelerVermerke where not exists(select Schueler.ID from Schueler where Schueler.ID=SchuelerVermerke.Schueler_ID)
delete from SchuelerErzAdr where not exists(select Schueler.ID from Schueler where Schueler.ID=SchuelerErzAdr.Schueler_ID)
delete from SchuelerLernabschnittsdaten where not exists (select S.ID from Schueler S where S.ID=SchuelerLernabschnittsdaten.Schueler_ID)
delete from SchuelerAbitur where not exists (select S.ID from Schueler S where S.ID=SchuelerAbitur.Schueler_ID)
delete from SchuelerAbiFaecher where not exists (select S.ID from Schueler S where S.ID=SchuelerAbiFaecher.Schueler_ID)
delete from SchuelerBKAbschluss where not exists (select S.ID from Schueler S where S.ID=SchuelerBKAbschluss.Schueler_ID)
delete from SchuelerBKFaecher where not exists (select S.ID from Schueler S where S.ID=SchuelerBKFaecher.Schueler_ID)
delete from SchuelerSprachenfolge where not exists (select S.ID from Schueler S where S.ID=SchuelerSprachenfolge.Schueler_ID)
delete from SchuelerLeistungsdaten where Fach_ID is null
delete from SchuelerLeistungsdaten where not exists (select F.ID from EigeneSchule_Faecher F where F.ID=SchuelerLeistungsdaten.Fach_ID)
delete from SchuelerLeistungsdaten where not exists (select A.ID from SchuelerLernabschnittsdaten A where A.ID=SchuelerLeistungsdaten.Abschnitt_ID)
delete from SchuelerLD_PSFachBem where not exists (select A.ID from SchuelerLernabschnittsdaten A where A.ID=SchuelerLD_PSFachBem.Abschnitt_ID)
update Schueler set Religion_ID=Null where Religion_ID is not null and not exists(select K_Religion.ID from K_Religion where K_Religion.ID=Schueler.Religion_ID)
delete from EigeneSchule_FachTeilleistungen where not exists(select F.ID from EigeneSchule_Faecher F where F.ID=EigeneSchule_FachTeilleistungen.Fach_ID)
delete from EigeneSchule_FachTeilleistungen where not exists(select K.ID from K_Einzelleistungen K where K.ID=EigeneSchule_FachTeilleistungen.Teilleistung_ID)
