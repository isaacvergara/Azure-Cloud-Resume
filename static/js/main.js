window.addEventListener('DOMContentLoaded', (event) => {
    getVisitCount();
})

const localFunctionAPI = "http://localhost:8001/api/getCounter";
const functionAPI = "https://azurecloudresume.azurewebsites.net/api/getCounter?code=0OzF4gAf0-ex7QJZREvfyWDrUAplQpytiiOlRCvY90l9AzFuI2JbJA=="

const getVisitCount = () => {
    fetch(functionAPI).then(response => {
        return response.json()
    }).then(response => {
        console.log("Website called function API.");
        response;
        document.getElementById("counter").innerText = "This page has been visited " + response + " times :).";
    }).catch(function(error){
        console.log(error);
    });
}