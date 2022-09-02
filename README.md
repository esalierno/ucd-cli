# ucd-cli
UrbanCode Deploy cli container image



export DS_AUTH_TOKEN=696127b7-bdbc-4ab9-a09f-6108e5dcd75d 
export DS_WEB_URL=https://oraodm1.fyre.ibm.com:8443  

podman run -it --rm -e DS_AUTH_TOKEN=$DS_AUTH_TOKEN -e DS_WEB_URL=$DS_WEB_URL localhost/ucd-cli:7.2.0 --help

