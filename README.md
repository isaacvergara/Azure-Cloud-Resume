# azure-cloud-resume

## Summary
This project is based on the callenge of called "The Cloud Resume Challenge Book" written by Forrest Brazeal. It consist on a series of guided steps to build an html-based resumé and deploy it on several Cloud providers (Azure in my case).

This project lets you gain hands-on experience. This book works as a guide and not as a tutorial, thing which I like because it forces you to deepdive into docs.

Thanks to this project you will practice:
1. Azure CDN.
2. Azure Storage Accounts.
3. Azure Custom domains.
4. Azure functions.
5. DevOps practices.
6. Html, CSS and JS.
7. Terraform (or other IaC solutions).
8. Python. 

My goal writting this doc is to motivate other people that, like me, wanted to change their career paths into Cloud Computing.

<p>Table of contents:</p>
<ol>
    <li>Project description</li>
    <li>Project design</li>
    <li>Building the front end</li>
    <li>Building the API</li>
    <li>Front-end / back-end integration</li>
    <li>Deployment</li>
    <li>Things to improve</li>
</ol>

## 1. Project description
The project consists on deploying a static website on Azure CDN with a custom endpoint. The website content will have a resumé in a A4 sheet format.
The website will also include a counter of visitors, which will show how many times the website has been visited.
This counter will consist on an Azure Function app that will be triggered by a JS http request, the function will get, update, save and return the counters value.
The counter info will be stored in a cosmodb.

## 2. Project diagram
![image](https://github.com/isaacvergara/azure-cloud-resume/assets/65440371/d714d1c0-4988-4b91-91dc-5ec6c986bf4f)
