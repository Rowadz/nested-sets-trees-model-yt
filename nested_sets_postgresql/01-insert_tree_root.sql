CREATE OR REPLACE PROCEDURE insert_tree_root(name VARCHAR(50))
language plpgsql
as $$
begin
    
    INSERT 
    INTO nodes("name", "left", "right", "tree_id")
    VALUES (name, 1, 2, md5(random()::text));

    commit;
end;$$

