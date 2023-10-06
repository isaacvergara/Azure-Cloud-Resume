# My Azure Cloud Resumé
## Summary
This project is based on the challenge of a book called "The Cloud Resume Challenge Book" written by Forrest Brazeal. It consist on a series of guided steps to build an html-based resumé and deploy it on several Cloud providers (Azure in my case).

This project lets you gain hands-on experience with a project that you can further use as a CV or as a portfolio.

The project consists on a series of steps:
1. Create the frontend.
2. Deploy a CDN with the frontend.
3. Deploy a Cosmo DB database and an Azure Function for the backend.
4. Create the backend of the app.
5. Integrate both.

You can visit my result at www.isaacvergara.com.

## Project Design
![image](https://github.com/isaacvergara/azure-cloud-resume/assets/65440371/468e791a-404f-4621-94a7-644e564016cd)

In the project all the infraestructure will be deployed via IaC with the Terraform tool. 

The frontend will be deployed in a CDN endpoint that has as an origin the static website of an Storage account. This static website will execute a JS function that will trigger via HTTPS an Azure Function to query and update the number of times the website has been visited.

The Function app will also be linked to an App Insights to review metrics and performance of the Azure Function.

## Project implementation steps
### 1. Design static frontend
In this step you will create the frontend via HTML and CSS. You can do exactly whatever you find necessary. I did mine as if it was a printed CV.

After you design and develop your static site you should also write a js function that will call the Azure Function that will be deployed later.

### 2. Deploy the frontend
1. Deploy a storage account with the parameter "Static website enabled".
2. Upload the site to the blob container $web that will be created on the Storage account.
3. Deploy a CDN profile with an endpoint which origin will be the static site of the SA.
4. Create a CNAME registry on your DNS provider mapping to the endpoint.
5. Deploy a custom domain (the CDN will now answer to the requests made to your domain).
