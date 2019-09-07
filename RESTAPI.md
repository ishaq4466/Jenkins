# Rest API calls for Programatically accessing jenkins 

* Rest api calls can be used to access jenkins in programatically way, without any manual 
  intervention
* For API calling we require USERNAME, API TOKEN for the USERNAME and CRUMB 

CRUMB=$(wget -q --auth-no-challenge --user username --password Password --output-document - 'http://192.168.1.49:8080/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)')

export USERNAME="student"
export API_TOKEN="11bc44f5ff5fe1e952b13a39b4e4b33f38"
export IP="3.219.41.57:8080"
#### Getting the crumb
export CRUMB=$(wget -q --auth-no-challenge --user $USERNAME --password OmgPassword!  --output-document - 'http://3.219.41.57:8080/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)')

#export PATH_TO_JOB="job/newproject/job/first/"

export PATH_TO_JOB="job/newproject/job/test2/"

export PATH_TO_JOB="job/copyone/"

export URL="http://$USERNAME:$API_TOKEN@$IP/$PATH_TO_JOB"

### Firing a build request:
curl -I -X POST $URL/build -H "$CRUMB"

**build** is the API call

### Get job info or config of another job:

curl -X GET $URL/config.xml -H "$CRUMB" -o ./jobconfig.xml

### Create a job not in folder or creating at the root of the server: 
curl -s -X POST "http://$USERNAME:$API_TOKEN@$IP/createItem?name=copyone1" --data-binary @jobconfig.xml -H "$CRUMB" -H "Content-Type:text/xml"

we are creating **copyone1** at the root directory only

### Create a job in a folder 
curl -s -X POST "http://$USERNAME:$API_TOKEN@$IP/job/newproject/createItem?name=test2" --data-binary @jobconfig.xml -H "$CRUMB" -H "Content-Type:text/xml"

**newproject** is the folder inside which we are creating the test2 job


<!-- wget -q --auth-no-challenge --user student --password OmgPassword! --output-document - "http://3.219.41.57:8080/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)") -->






