-- * update all of the right values of the nodes where the right is bigger than the parent’s left
-- * update all of the left values of the nodes where the left is bigger than the parent’s left
CREATE OR REPLACE  PROCEDURE add_child(
    perent_id NUMERIC,
    node_name VARCHAR(50)
)
language plpgsql
as $$
DECLARE 
    parent_left NUMERIC;
    tree_id VARCHAR(255);
begin
    SELECT "left", nodes.tree_id 
    INTO parent_left, tree_id FROM nodes WHERE "id" = perent_id;

    UPDATE nodes SET "right" = "right" + 2 WHERE "right" > parent_left;
    UPDATE nodes SET "left" = "left" + 2 WHERE "left" > parent_left;
    
    INSERT INTO nodes("name", "left", "right", "tree_id")
    VALUES (node_name, parent_left + 1, parent_left + 2, tree_id);
    commit;
end;$$
