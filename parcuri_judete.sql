CREATE TABLE IF NOT EXISTS parcuri_judete(
	parcuri_fid INTEGER NOT NULL, --FK
	judete_fid INTEGER NOT NULL, --FK
	FOREIGN KEY(parcuri_fid) REFERENCES parcuri,
	FOREIGN KEY(judete_fid) REFERENCES judete,
	PRIMARY KEY(parcuri_fid, judete_fid)
);