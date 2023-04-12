 kubectl get --raw /openapi/v2 > swagger.json
 openapi2jsonschema --kubernetes swagger.json
 rm swagger.json
