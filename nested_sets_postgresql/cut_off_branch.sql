-- to delete a branch
-- ! find the node's left and right values
-- ! create a variable that is equal to the right - left + 1
-- ! delete all of the nodes that their left and right is between the node's left and right
-- ! update the right values in the tree to be right - width where thier right is bigger the node's right
-- ! update the left values in the tree to be left - width where thier left is bigger the node's right
CREATE OR REPLACE  PROCEDURE cut_off_branch(
    node_id NUMERIC
)
language plpgsql
AS $$
DECLARE 
    node_left NUMERIC;
    node_right NUMERIC;
    width NUMERIC;
    tree_id_ VARCHAR(255);
BEGIN 
    SELECT 
        "left", 
        "right",
        "right" - "left" + 1,
        nodes.tree_id 
    INTO 
        node_left, 
        node_right,
        width,
        tree_id_
    FROM nodes WHERE "id" = node_id;

    DELETE FROM nodes WHERE "left" 
    BETWEEN node_left AND node_right 
    AND nodes.tree_id = tree_id_;

    UPDATE nodes SET "right" = "right" - width WHERE "right" > node_right AND nodes.tree_id = tree_id_;
    UPDATE nodes SET "left" = "left" - width WHERE "left" > node_right AND nodes.tree_id = tree_id_;
    commit;
END;$$
 


