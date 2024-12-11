package txt

import (
	"fmt"
	"strings"
)

func (s Service) SaveMainTable() error {
	//create query
	//execute query
	//return error
	// columns := strings.Join(s.Columns,",")
	columns := `"` + strings.Join(s.Columns, `", "`) + `"`
	setString := ""
	valuesString := ""
	conditionUpdate := ""
	for _, value := range s.Columns {
		setString += `"` + value + `"= src."` + value + `", `
		valuesString += `src."` + value + `", `
		conditionUpdate += `tgt."` + value + `" IS DISTINCT FROM src."` + value + `" OR `
	}
	//Delete last , in setString
	setString = strings.TrimSuffix(setString, ", ")
	valuesString = strings.TrimSuffix(valuesString, ", ")
	conditionUpdate = strings.TrimSuffix(conditionUpdate, "OR ")

	// WITH RankedRows AS (
	// 	SELECT *,
	// 		   ROW_NUMBER() OVER (
	// 			   PARTITION BY "`+ s.Columns[3]+`", "`+s.Columns[4]+`", "`+s.Columns[39]+`") AS rn
	// 	FROM `+ s.TableName + `
	// )

	// (
	// 	SELECT *
	// 	FROM RankedRows
	// 	WHERE rn = 1
	// 	)

	// (
	// 	SELECT DISTINCT *
	// 	 FROM ` + s.TableName + `) 

	query := `
	 WITH RankedRows AS (
	 	SELECT *,
	 	ROW_NUMBER() OVER (
	 	PARTITION BY "ID_PERSONA","ID_HOGAR","IDSINIESTRO"
		ORDER BY "ID" ASC
		) AS rn
	 	FROM `+ s.TemporaryTable + `
	 )
	
	MERGE INTO public.` + s.TableName + ` AS tgt 
	USING (
	 	SELECT *
	 	FROM RankedRows
	 	WHERE rn = 1
	) AS src 
	ON (` + s.Querys["condition_merge"] + `) WHEN MATCHED AND (` + conditionUpdate + `) THEN 
	UPDATE SET ` + setString + ` 
	WHEN NOT MATCHED AND NOT EXISTS (
	SELECT 1 
    FROM public.` + s.TableName + ` 
    WHERE "` + s.Columns[3] + `" = src."` + s.Columns[3] + `" 
      AND "` + s.Columns[4] + `" = src."` + s.Columns[4] + `" 
      AND "` + s.Columns[39] + `" = src."` + s.Columns[39] + `"
	) 
	THEN 
	INSERT(` + columns + `) VALUES(` + valuesString + `);`

	if err := s.Repo.Upsert(query); err != nil {
		return fmt.Errorf("error in SaveMainTable: %s", err.Error())
	}

	fmt.Print("Data copied in main successfully in SaveMainTable")
	return nil
}
