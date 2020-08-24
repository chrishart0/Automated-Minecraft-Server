//const countEl = document.getElementById('vc');

//Function to hit status API, and log result
serverStatus();
function serverStatus() {
    const fetch = require("node-fetch");
    fetch('https://0tgloih8p9.execute-api.us-east-1.amazonaws.com/Prod/status')
        .then(response => {
        return response.json()
      })
        .then(data => {
            console.log(data)
            console.log(data['message'])
            //document.getElementById('count').innerHTML = data;
        })
    }
