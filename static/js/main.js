window.addEventListener('DOMContentLoaded', (event) => {
    getVisitCount();
})

const  localFunctionAPI = "http://localhost:8002/api/update_counter";
const functionAPI = ""

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