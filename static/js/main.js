window.addEventListener('DOMContentLoaded', (event) => {
    getVisitCount();
})

const  localFunctionAPI = "http://localhost:8001/api/update_counter";
const functionAPI = "https://fapp-linux-cloudresume.azurewebsites.net/api/update_counter?code=mQccAxuYaKDSD6hIutBt_7J18Dx9-e7ekj422lJGyvHkAzFuwQG2wA=="


const getVisitCount = () => {
    fetch(localFunctionAPI).then(response => {
        return response.json()
    }).then(response => {
        console.log("Website called function API.");
        response;
        document.getElementById("counter").innerText = "This page has been visited " + response + " times :).";
    }).catch(function(error){
        console.log(error);
    });
}