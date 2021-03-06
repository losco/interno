/* old_db = interno18_d5 */
/* new_db = interno18_d7 */

# node
TRUNCATE TABLE interno18_d7.node;
INSERT INTO interno18_d7.node (nid, vid, type, title, uid, status, created, changed, language) SELECT DISTINCT n.nid, n.nid AS vid, 'article' AS type, n.title, n.uid, n.status, n.created, n.changed, 'und' AS language FROM interno18_d5.node n INNER JOIN interno18_d5.node_revisions nr ON n.vid = nr.vid WHERE n.type = 'story' ORDER BY n.vid DESC;

# node_revision
TRUNCATE TABLE interno18_d7.node_revision;
INSERT INTO interno18_d7.node_revision (nid, vid, uid, title, timestamp, status) SELECT DISTINCT nr.nid, nr.nid AS vid, nr.uid, nr.title, nr.timestamp, n.status FROM interno18_d5.node n INNER JOIN interno18_d5.node_revisions nr ON n.vid = nr.vid WHERE n.type = 'story' ORDER BY n.vid DESC;

# field_data_body
TRUNCATE TABLE interno18_d7.field_data_body;
INSERT INTO interno18_d7.field_data_body (entity_type, bundle, deleted, entity_id, revision_id, language, delta, body_value, body_format) SELECT DISTINCT 'node' AS entity_type, 'article' AS bundle, 0 AS deleted, nr.nid AS entity_id, nr.nid AS revision_id, 'und' AS language, 0 AS delta, nr.body AS body_value, 'filtered_html'  FROM interno18_d5.node n INNER JOIN interno18_d5.node_revisions nr ON n.vid = nr.vid WHERE n.type = 'story' ORDER BY n.vid DESC;

# field_revision_body 
TRUNCATE TABLE interno18_d7.field_revision_body;
INSERT INTO interno18_d7.field_revision_body (entity_type, bundle, deleted, entity_id, revision_id, language, delta, body_value, body_format) SELECT DISTINCT 'node' AS entity_type, 'article' AS bundle, 0 AS deleted, nr.nid AS entity_id, nr.nid AS revision_id, 'und' AS language, 0 AS delta, nr.body AS body_value, 'filtered_html'  FROM interno18_d5.node n INNER JOIN interno18_d5.node_revisions nr ON n.vid = nr.vid WHERE n.type = 'story' ORDER BY n.vid DESC;

# field_data_field_short
TRUNCATE TABLE interno18_d7.field_data_field_short;
INSERT INTO interno18_d7.field_data_field_short (entity_type, bundle, deleted, entity_id, revision_id, language, delta, field_short_value) SELECT DISTINCT 'node' AS entity_type, 'article' AS bundle, 0 AS deleted, nr.nid AS entity_id, nr.nid AS revision_id, 'und' AS language, 0 AS delta, nr.field_sommarietto_value AS field_short_value FROM interno18_d5.node n INNER JOIN interno18_d5.content_type_story nr ON n.vid = nr.vid WHERE n.type = 'story' ORDER BY n.vid DESC;

# field_revision_field_short
TRUNCATE TABLE interno18_d7.field_revision_field_short;
INSERT INTO interno18_d7.field_revision_field_short (entity_type, bundle, deleted, entity_id, revision_id, language, delta, field_short_value) SELECT DISTINCT 'node' AS entity_type, 'article' AS bundle, 0 AS deleted, nr.nid AS entity_id, nr.nid AS revision_id, 'und' AS language, 0 AS delta, nr.field_sommarietto_value AS field_short_value FROM interno18_d5.node n INNER JOIN interno18_d5.content_type_story nr ON n.vid = nr.vid WHERE n.type = 'story' ORDER BY n.vid DESC;

#taxonomy
TRUNCATE TABLE interno18_d7.taxonomy_term_data;
TRUNCATE TABLE interno18_d7.taxonomy_term_hierarchy;
TRUNCATE TABLE interno18_d7.taxonomy_index;

# vocabulary "TYPE" old_vid=4 new_vid=2
# taxonomy_term_data 
INSERT INTO interno18_d7.taxonomy_term_data (tid, vid, name, description, weight) SELECT tid, 2 AS vid, name, description, weight FROM interno18_d5.term_data WHERE vid = 4;
# taxonomy_term_hierarchy
INSERT INTO interno18_d7.taxonomy_term_hierarchy (tid, parent) SELECT th.tid, th.parent FROM interno18_d5.term_hierarchy th INNER JOIN interno18_d5.term_data td ON th.tid=td.tid WHERE td.vid = 4;
# taxonomy_index
INSERT INTO interno18_d7.taxonomy_index (nid, tid, created) SELECT tn.nid, tn.tid, n.created AS created FROM interno18_d5.term_node tn INNER JOIN interno18_d5.term_data td ON tn.tid=td.tid INNER JOIN interno18_d5.node n ON n.nid = tn.nid WHERE td.vid = 4;

TRUNCATE TABLE interno18_d7.field_data_field_type;
INSERT INTO interno18_d7.field_data_field_type (entity_type, bundle, deleted, entity_id, revision_id, language, delta, field_type_tid) SELECT 'node' AS entity_type, 'article' AS bundle, 0 AS deleted, tn.nid AS entity_id, tn.nid AS revision_id, 'und' AS language, 0 AS delta, tn.tid AS field_type_tid FROM interno18_d5.term_node tn INNER JOIN interno18_d5.term_data td ON tn.tid=td.tid WHERE td.vid = 4;

TRUNCATE TABLE interno18_d7.field_revision_field_type;
INSERT INTO interno18_d7.field_revision_field_type (entity_type, bundle, deleted, entity_id, revision_id, language, delta, field_type_tid) SELECT 'node' AS entity_type, 'article' AS bundle, 0 AS deleted, tn.nid AS entity_id, tn.nid AS revision_id, 'und' AS language, 0 AS delta, tn.tid AS field_type_tid FROM interno18_d5.term_node tn INNER JOIN interno18_d5.term_data td ON tn.tid=td.tid WHERE td.vid = 4;

# vocabulary "LOCATION" old_vid=7 new_vid=3
# taxonomy_term_data 
INSERT INTO interno18_d7.taxonomy_term_data (tid, vid, name, description, weight) SELECT tid, 3 AS vid, name, description, weight FROM interno18_d5.term_data WHERE vid = 7;
# taxonomy_term_hierarchy
INSERT INTO interno18_d7.taxonomy_term_hierarchy (tid, parent) SELECT th.tid, th.parent FROM interno18_d5.term_hierarchy th INNER JOIN interno18_d5.term_data td ON th.tid=td.tid WHERE td.vid = 7;
# taxonomy_index
INSERT INTO interno18_d7.taxonomy_index (nid, tid, created) SELECT tn.nid, tn.tid, n.created FROM interno18_d5.term_node tn INNER JOIN interno18_d5.term_data td ON tn.tid=td.tid INNER JOIN interno18_d5.node n ON n.nid = tn.nid WHERE td.vid = 7;

TRUNCATE TABLE interno18_d7.field_data_field_location;
INSERT INTO interno18_d7.field_data_field_location (entity_type, bundle, deleted, entity_id, revision_id, language, delta, field_location_tid) SELECT 'node' AS entity_type, 'article' AS bundle, 0 AS deleted, tn.nid AS entity_id, tn.nid AS revision_id, 'und' AS language, 0 AS delta, tn.tid AS field_location_tid FROM interno18_d5.term_node tn INNER JOIN interno18_d5.term_data td ON tn.tid=td.tid WHERE td.vid = 7 GROUP BY tn.nid;

TRUNCATE TABLE interno18_d7.field_revision_field_location;
INSERT INTO interno18_d7.field_revision_field_location (entity_type, bundle, deleted, entity_id, revision_id, language, delta, field_location_tid) SELECT 'node' AS entity_type, 'article' AS bundle, 0 AS deleted, tn.nid AS entity_id, tn.nid AS revision_id, 'und' AS language, 0 AS delta, tn.tid AS field_location_tid FROM interno18_d5.term_node tn INNER JOIN interno18_d5.term_data td ON tn.tid=td.tid WHERE td.vid = 7 GROUP BY tn.nid;

# vocabulary "RUBRIC" old_vid=10 new_vid=4
SET @old_vid = 10;
SET @new_vid = 4;
# taxonomy_term_data
INSERT INTO interno18_d7.taxonomy_term_data (tid, vid, name, description, weight) SELECT tid, @new_vid AS vid, name, description, weight FROM interno18_d5.term_data WHERE vid = @old_vid;
# taxonomy_term_hierarchy
INSERT INTO interno18_d7.taxonomy_term_hierarchy (tid, parent) SELECT th.tid, th.parent FROM interno18_d5.term_hierarchy th INNER JOIN interno18_d5.term_data td ON th.tid=td.tid WHERE td.vid = @old_vid;
# taxonomy_index
INSERT INTO interno18_d7.taxonomy_index (nid, tid, created) SELECT tn.nid, tn.tid, n.created FROM interno18_d5.term_node tn INNER JOIN interno18_d5.term_data td ON tn.tid=td.tid INNER JOIN interno18_d5.node n ON n.nid = tn.nid WHERE td.vid = @old_vid;

TRUNCATE TABLE interno18_d7.field_data_field_rubric;
INSERT INTO interno18_d7.field_data_field_rubric (entity_type, bundle, deleted, entity_id, revision_id, language, delta, field_rubric_tid) SELECT 'node' AS entity_type, 'article' AS bundle, 0 AS deleted, tn.nid AS entity_id, tn.nid AS revision_id, 'und' AS language, 0 AS delta, tn.tid AS field_rubric_tid FROM interno18_d5.term_node tn INNER JOIN interno18_d5.term_data td ON tn.tid=td.tid WHERE td.vid = @old_vid GROUP BY tn.nid;

TRUNCATE TABLE interno18_d7.field_revision_field_rubric;
INSERT INTO interno18_d7.field_revision_field_rubric (entity_type, bundle, deleted, entity_id, revision_id, language, delta, field_rubric_tid) SELECT 'node' AS entity_type, 'article' AS bundle, 0 AS deleted, tn.nid AS entity_id, tn.nid AS revision_id, 'und' AS language, 0 AS delta, tn.tid AS field_rubric_tid FROM interno18_d5.term_node tn INNER JOIN interno18_d5.term_data td ON tn.tid=td.tid WHERE td.vid = @old_vid GROUP BY tn.nid;

# vocabulary "TAGS" old_vid=5 new_vid=1
SET @old_vid = 5;
SET @new_vid = 1;
# taxonomy_term_data
INSERT INTO interno18_d7.taxonomy_term_data (tid, vid, name, description, weight) SELECT tid, @new_vid AS vid, name, description, weight FROM interno18_d5.term_data WHERE vid = @old_vid;
# taxonomy_term_hierarchy
INSERT INTO interno18_d7.taxonomy_term_hierarchy (tid, parent) SELECT th.tid, th.parent FROM interno18_d5.term_hierarchy th INNER JOIN interno18_d5.term_data td ON th.tid=td.tid WHERE td.vid = @old_vid;
# taxonomy_index
INSERT INTO interno18_d7.taxonomy_index (nid, tid, created) SELECT tn.nid, tn.tid, n.created FROM interno18_d5.term_node tn INNER JOIN interno18_d5.term_data td ON tn.tid=td.tid INNER JOIN interno18_d5.node n ON n.nid = tn.nid WHERE td.vid = @old_vid;

TRUNCATE TABLE interno18_d7.field_data_field_tags;
INSERT INTO interno18_d7.field_data_field_tags (entity_type, bundle, deleted, entity_id, revision_id, language, delta, field_tags_tid) SELECT 'node' AS entity_type, 'article' AS bundle, 0 AS deleted, tn.nid AS entity_id, tn.nid AS revision_id, 'und' AS language, 0 AS delta, tn.tid AS field_tags_tid FROM interno18_d5.term_node tn INNER JOIN interno18_d5.term_data td ON tn.tid=td.tid WHERE td.vid = @old_vid GROUP BY tn.nid;

TRUNCATE TABLE interno18_d7.field_revision_field_tags;
INSERT INTO interno18_d7.field_revision_field_tags (entity_type, bundle, deleted, entity_id, revision_id, language, delta, field_tags_tid) SELECT 'node' AS entity_type, 'article' AS bundle, 0 AS deleted, tn.nid AS entity_id, tn.nid AS revision_id, 'und' AS language, 0 AS delta, tn.tid AS field_tags_tid FROM interno18_d5.term_node tn INNER JOIN interno18_d5.term_data td ON tn.tid=td.tid WHERE td.vid = @old_vid GROUP BY tn.nid;

# url alias
TRUNCATE TABLE interno18_d7.url_alias;
INSERT INTO interno18_d7.url_alias (source, alias, language) SELECT ua.src AS source, ua.dst AS alias, 'und' AS language FROM  interno18_d5.url_alias ua WHERE  ua.dst NOT LIKE '%feed%' AND ua.dst NOT LIKE 'eventi/%' AND ua.dst NOT LIKE 'administration' AND ua.dst NOT LIKE 'utente/%';



