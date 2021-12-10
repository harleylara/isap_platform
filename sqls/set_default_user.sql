SELECT id AS x FROM res_users WHERE login='default' \gset
SELECT id AS y FROM res_groups WHERE name='Internal User' \gset
DELETE FROM res_groups_users_rel WHERE uid=:x AND gid!=:y;