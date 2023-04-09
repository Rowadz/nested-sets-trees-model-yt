-- way 1 if you don't konw the left and right
SELECT 
    descendants.name
FROM 
    nodes as descendants,
    nodes AS parent
WHERE 
    descendants."left" BETWEEN parent."left" AND parent."right" 
    AND parent."name" = 'B' -- change me!
    AND descendants.tree_id = '3ae18c17aa5f266659a9f3003bbf3b6c' -- change me!
ORDER BY descendants."left";


-- way 2 if you know the left and right
SELECT 
    descendants.name
FROM 
    nodes as descendants
WHERE 
    descendants."left" BETWEEN 1 AND 14
    AND descendants.tree_id = '3ae18c17aa5f266659a9f3003bbf3b6c' -- change me!
ORDER BY descendants."left";