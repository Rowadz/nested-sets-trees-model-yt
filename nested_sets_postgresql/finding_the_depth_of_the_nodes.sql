SELECT 
    node."name", 
    (COUNT(parent."name") - 1) AS depth
FROM 
    nodes AS node,
    nodes AS parent
WHERE 
    node."left" BETWEEN parent."left" AND parent."right"
    AND parent.tree_id = '3ae18c17aa5f266659a9f3003bbf3b6c'
    AND node.tree_id = '3ae18c17aa5f266659a9f3003bbf3b6c'
GROUP BY node.name, node."left"
ORDER BY node."left";


-- without gropping 
-- run this to understand what's going on
SELECT 
    node."name",
    parent."name" AS parent_name,
    parent."left" AS parent_left,
    parent."right" AS parent_right,
    node."left" AS node_left,
    node."right" AS node_right
FROM 
    nodes AS node,
    nodes AS parent
WHERE 
    node."left" BETWEEN parent."left" AND parent."right"
    AND parent.tree_id = '3ae18c17aa5f266659a9f3003bbf3b6c'
    AND node.tree_id = '3ae18c17aa5f266659a9f3003bbf3b6c'
ORDER BY node."name"


-- visualize the tree
SELECT
	CONCAT(
		REPEAT('👉', (COUNT(parent."name") - 1)::int), 
		node."name"
	) AS "name"
FROM
	nodes AS node,
	nodes AS parent
WHERE
	node."left" BETWEEN parent."left" AND parent."right"
    AND parent.tree_id = '3ae18c17aa5f266659a9f3003bbf3b6c'
    AND node.tree_id = '3ae18c17aa5f266659a9f3003bbf3b6c'
GROUP BY
	node.name,
	node."left"
ORDER BY
	node."left";