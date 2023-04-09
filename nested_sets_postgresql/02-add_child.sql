-- update all of the right values of the nodes where the right is bigger than the parent’s left  by 2
-- update all of the left values of the nodes where the left is bigger than the parent’s left  by 2
-- the new node left value will be the parent’s left + 1
-- the new node right value will be the parent’s right + 2
CREATE OR REPLACE  PROCEDURE add_child(
    perent_id NUMERIC,
    node_name VARCHAR(50)
)
language plpgsql
as $$
DECLARE 
    parent_left NUMERIC;
    tree_id_ VARCHAR(255);
begin
    SELECT "left", nodes.tree_id 
    INTO parent_left, tree_id_ FROM nodes WHERE "id" = perent_id;

    UPDATE nodes SET "right" = "right" + 2 WHERE "right" > parent_left AND nodes.tree_id = tree_id_;;
    UPDATE nodes SET "left" = "left" + 2 WHERE "left" > parent_left AND nodes.tree_id = tree_id_;;
    
    INSERT INTO nodes("name", "left", "right", "tree_id")
    VALUES (node_name, parent_left + 1, parent_left + 2, tree_id_);
    commit;
end;$$
