function updateVisitCount() {
    const fetch = require("node-fetch");
    fetch('https://0tgloih8p9.execute-api.us-east-1.amazonaws.com/Prod/status')
        .then(response => {
        return response.json()
      })
        .then(data => {
            console.log(data)
        })
    }
updateVisitCount();