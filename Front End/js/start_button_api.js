const fetch = require("node-fetch");
function updateVisitCount() {
    fetch('https://ktfk8riir9.execute-api.us-east-1.amazonaws.com/Prod/start')
        .then(response => {
            return response.json()
        })
        .then(data => {
            console.log(data)
        })
}
updateVisitCount()
