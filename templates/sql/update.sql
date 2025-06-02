UPDATE table
SET "field" = $2,
    "field" = $3
WHERE "field" = $1
RETURNING "field"
