# My Azure Cloud Resumé
## Summary
This project is based on the challenge of a book called "The Cloud Resume Challenge Book" written by Forrest Brazeal. It consist on a series of guided steps to build an html-based resumé and deploy it on several Cloud providers (Azure in my case).

This project lets you gain hands-on experience. 
The book works as a guid, but not as a tutorial, thing which I like because it forces you to deep dive into docs and having a more analytical thinking when you encounter an issue.

This post will be written in a similar way as the book, I will not be giving a step-by-step tutorial, instead I will explain what I've learnt during the process and what can you expect if you try to make this challenge from 0 experience just like I did it.

<p>Table of contents:</p>
<ol>
    <li>Why I made this project?</li>
    <li>What to expect from the challenge?</li>
    <li>What will you practice in this project?</li>
    <li>Project design</li>
    <li>Project structure</li>
    <li>
        Project steps:
        <ul>
            <li>Frontend</li>
            <li>Create a CND endpoint and deploy Frontend</li>
            <li>Deploy needed infraestructure for the backend</li>
            <li>Create backend (Azure functions)</li>
        </ul>
    </li>
    <li>How to improve the project</li>
</ol>

## 1. Why I made this project?
I started this project after I got the az-900, az-104 and Terraform associated certifications.
Sometimes when you're studying for certifications and exams you have the feeling that you know concepts, but you don't know how to apply them in real life projects. This project is small, but it gives you a challenge to gain more confidence for further projects.

## 2. What to expect from this project?
You can expect to gain some hands-on experience on the cloud environment.

## 3. What will you practice in this project?
In this project (like I do it) you will practice: Azure resource like CDN, storage accounts, Azure functions, Azure CosmoDB; Terraform (what I use to deploy resources); git (all code will be saved on a GitHub respositopry), Python, HTML, CSS and JS.

## 4. Project design
Project architecture:

![image](https://github.com/isaacvergara/azure-cloud-resume/assets/65440371/b5cf126b-8e72-4934-aebb-854a54c72c50)

A client will retrieve the static website from a CND endpoint and, after it is rendered in the client browser, a JS code will trigger an Azure function, that will get the visitor's counter from a db, updates it and returns it to load it into the HTML static site.

Frontend design:
I am not a big fan of front-end development due to my lack of skills of the art of choosing the right color (why not put a black button with green text?) but the idea that I had was simple, I wanted my portfolio to look like the PDF resumé that you send to all the people you can when you try to land a job (I don't do that, obviously I got hired on the first attempt).




