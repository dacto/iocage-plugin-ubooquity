## HOW-TO Install

```shell
BRANCH=master
JSON=/tmp/ubooquity.json

fetch -o "$JSON" "https://raw.githubusercontent.com/dacto/iocage-plugin-ubooquity/${BRANCH}/ubooquity.json"
iocage fetch -P "$JSON" --branch "$BRANCH" -n Ubooquity
```

# iocage-plugin-ubooquity

Artifact file(s) for Ubooquity iocage plugin
