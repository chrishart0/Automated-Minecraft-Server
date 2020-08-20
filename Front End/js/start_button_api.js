const fetch = require("node-fetch");
function updateVisitCount() {
    fetch('https://0tgloih8p9.execute-api.us-east-1.amazonaws.com/Prod/hello')
        .then(response => {
            console.log(response)
        return response.json()
      })
    }
updateVisitCount()