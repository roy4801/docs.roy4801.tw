# Elasticsearch

## Terms

ES 是 schemaless 的，資料格式可以隨意定，非常適合用來做全文檢索 or 查詢與資料的相關性

* cluster
    * a es cluster is composed of one or multiple nodes
* document
    * The smallest data unit in ES
        * Searchable
        * Stored in JSON
        * Each document has its own Unique ID
* document metadata
    * describe itself
    * `_index`: the name of the index to which this document belongs
    * `_type`: `_doc`
    * `_id`: ID
    * `_source`: data
    * `_version`
    * `_score` correlation

* index
    * collection of documents
    * data: document + metadata
    * mapping: name, type
    * setting: how to store (replication, shard)

* type
    * collection of documents
    * divides documents into types
    * ==will be removed in the future==
* shard
    * data in indices will be stored in shards
* index template
* mapping type

## API

### Add a single document

```
POST logs-my_app-default/_doc
{
  "@timestamp": "2099-05-06T16:21:15.000Z",
  "event": {
    "original": "192.0.2.42 - - [06/May/2099:16:21:15 +0000] \"GET /images/bg.jpg HTTP/1.0\" 200 24736"
  }
}
```

```
{
    "_index": ".ds-logs-my_app-default-2021.06.28-000001",
    "_type": "_doc",
    "_id": "sbjVW3oBJ-UWGrIG-3f5",
    "_version": 1,
    "result": "created",
    "_shards": {
        "total": 2,
        "successful": 1,
        "failed": 0
    },
    "_seq_no": 1,
    "_primary_term": 3
}
```

* PUT
    * `PUT _index/_create/ID`
    * may cause performance issues

### Add multiple documents
  * Use NDJSON

```
PUT logs-my_app-default/_bulk
{ "create": { } }
{ "@timestamp": "2099-05-07T16:24:32.000Z", "event": { "original": "192.0.2.242 - - [07/May/2020:16:24:32 -0500] \"GET /images/hm_nbg.jpg HTTP/1.0\" 304 0" } }
{ "create": { } }
{ "@timestamp": "2099-05-08T16:25:42.000Z", "event": { "original": "192.0.2.255 - - [08/May/2099:16:25:42 +0000] \"GET /favicon.ico HTTP/1.0\" 200 3638" } }

```

??? note
    ```
    {
        "took": 3,
        "errors": false,
        "items": [
            {
                "create": {
                    "_index": ".ds-logs-my_app-default-2021.06.28-000001",
                    "_type": "_doc",
                    "_id": "RrjaW3oBJ-UWGrIG7nrd",
                    "_version": 1,
                    "result": "created",
                    "_shards": {
                        "total": 2,
                        "successful": 1,
                        "failed": 0
                    },
                    "_seq_no": 2,
                    "_primary_term": 3,
                    "status": 201
                }
            },
            {
                "create": {
                    "_index": ".ds-logs-my_app-default-2021.06.28-000001",
                    "_type": "_doc",
                    "_id": "R7jaW3oBJ-UWGrIG7nrd",
                    "_version": 1,
                    "result": "created",
                    "_shards": {
                        "total": 2,
                        "successful": 1,
                        "failed": 0
                    },
                    "_seq_no": 3,
                    "_primary_term": 3,
                    "status": 201
                }
            }
        ]
    }
    ```

### Search data

```
GET logs-my_app-default/_search
{
  "query": {
    "match_all": { }
  },
  "sort": [
    {
      "@timestamp": "desc"
    }
  ]
}
```

* Get specific fields

```
GET logs-my_app-default/_search
{
  "query": {
    "match_all": { }
  },
  "fields": [
    "@timestamp"
  ],
  "_source": false,
  "sort": [
    {
      "@timestamp": "desc"
    }
  ]
}
```

* Search a range
    * time / IP range

```
GET logs-my_app-default/_search
{
  "query": {
    "range": {
      "@timestamp": {
        "gte": "2099-05-05",
        "lt": "2099-05-08"
      }
    }
  },
  "fields": [
    "@timestamp"
  ],
  "_source": false,
  "sort": [
    {
      "@timestamp": "desc"
    }
  ]
}
```

 * Aggregate data
     * to summarize data as metrics, statistics, or analytics


## `_doc` Mapping Type

!!! warning
    Deprecated

To separate collections inside an index

https://stackoverflow.com/questions/35747862/what-does-doc-represents-in-elasticsearch


## Cluster

https://godleon.github.io/blog/Elasticsearch/Elasticsearch-distributed-mechanism/
http://dog0416.blogspot.com/2017/03/elasticsearch-configuring-cluster.html
https://www.claytontan.net/2020/01/23/elasticsearch-cluster-%E5%AE%89%E8%A3%9D/

