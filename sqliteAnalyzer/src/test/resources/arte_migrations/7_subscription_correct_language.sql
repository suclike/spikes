-- use subscriptions table for subscribing to cluster
DROP VIEW "SUBSCRIPTIONS";
CREATE TABLE IF NOT EXISTS "SUBSCRIPTIONS"
    (
    "_id" INTEGER,
    "SUBSCRIBE_CLUSTER_ID" INTEGER,
    "LANGUAGE_ID" INTEGER,
    PRIMARY KEY ("_id", "LANGUAGE_ID")
    );
-- create view with clusters for subscription chooser
CREATE VIEW IF NOT EXISTS "CLUSTERS_WITH_SUBSCRIPTION"
    AS SELECT DISTINCT
            CLUSTERS_WITH_VIDEO._id,
            CLUSTERS_WITH_VIDEO.TITLE,
            CLUSTERS_WITH_VIDEO.SUBTITLE,
            CLUSTERS_WITH_VIDEO.IMAGE_URL,
            CLUSTERS_WITH_VIDEO.LANGUAGE_ID,
            CLUSTERS_WITH_VIDEO.CLUSTER_ID,
            SUBSCRIPTIONS.SUBSCRIBE_CLUSTER_ID IS NOT NULL AS "IS_SUBSCRIBED"
        FROM CLUSTERS_WITH_VIDEO
            LEFT OUTER JOIN SUBSCRIPTIONS
                ON SUBSCRIPTIONS.SUBSCRIBE_CLUSTER_ID = CLUSTERS_WITH_VIDEO.CLUSTER_ID;
