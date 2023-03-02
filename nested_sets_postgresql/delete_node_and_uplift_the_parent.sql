-- to delete a branch
-- ! find the node's left and right values
-- ! delete the node by filtering on the left value
-- ! to update the children:
--      ! update the right values in the tree to be right - 1 and left to be left - 1 where their left is between the deleted node's left and right
-- ! update the right values in the tree to be right - 2 where their right is bigger than the deleted node's right
-- ! update the left values in the tree to be left - 2 where their left is bigger than the deleted node's right

CREATE OR REPLACE  PROCEDURE delete_node_and_uplift_the_parent(
    node_id NUMERIC
)
language plpgsql
AS $$
DECLARE 
    node_left NUMERIC;
    node_right NUMERIC;
    tree_id_ VARCHAR(255);
BEGIN 
    SELECT 
        "left", 
        "right",
        nodes.tree_id 
    INTO 
        node_left, 
        node_right,
        tree_id_
    FROM nodes WHERE "id" = node_id;

    DELETE FROM nodes WHERE "left" = node_left
    AND nodes.tree_id = tree_id_;

    -- update the children
    UPDATE nodes 
    SET
        "right" = "right" - 1,
        "left" = "left" - 1
    WHERE "left" BETWEEN node_left AND node_right
    AND nodes.tree_id = tree_id_;

    UPDATE nodes SET "right" = "right" - 2 WHERE "right" > node_right AND nodes.tree_id = tree_id_;
    UPDATE nodes SET "left" = "left" - 2 WHERE "left" > node_right AND nodes.tree_id = tree_id_;
    commit;
END;$$
 


