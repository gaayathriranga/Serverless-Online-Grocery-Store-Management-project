    <br/>
# Online Grocery Store

###### Prof. Dr Thomas Fankhauser | Cloud Computing  | Hochshule Heilbronn 

---

<br />
<table>
    <tbody>
        <tr>
            <td>Student(ID)</td>
           <td>Gaayathri Ranganathan (221362) </td> 
        </tr>
        <tr>
            <td>Semester-1</td>
            <td>Summer semester 2024</td>
        </tr>
        <tr>
            <td>Repository</td>
            <td><a href="https://git.it.hs-heilbronn.de/it/courses/msem/cc2/ss24/team13">https://git.it.hs-heilbronn.de/it/courses/msem/cc2/ss24/team13</a>&nbsp;</td>
        </tr>
        <tr>
            <td>Course ID</td>
            <td>172369</td>
        </tr>
        <tr>
            <td>Course Name </td>
            <td>Cloud Computing (SEM)</td>
        </tr>
    </tbody>
</table>

## Chapter 1 - Introduction
The project involves the devlopment of an online Grocery store, to provide efficient handling of customer related operation in the store.This project facilitates the manage of customer information. 

Online grocery store Page:
Online grocery store page is main page for perfoming the get and post operations on customer data.
In that we can add the customer record like customers name,which product they brought, quentity of that product and what was the price of that product. After adding this thing it calculated the total of product and submit the data in database. when any customer added into database then that customer name will be fetch in below table to showing all customer data from database.


Front-end:
For making inetrface more user-friendly,the front-end application page was design and devloped as a static website using HTML and Javascript.Thee fronttend interacts with the backend throgh API-endpoints to fetch all Customer data.

Back-end:
The backend of the application is built as a serverless application using AWS Lambda and python. The backend exposes Representational State Transfer (REST) API endpoints that handle requests from the frontend. The data is stored in DynamoDB, a cloud database service provided by AWS. The use of serverless architecture allows for automatic scaling based on demand, ensuring efficient resource allocation.


### 1.1 Application doing 

Our Application is an interface to store Customer details in the database and perform operations on that data. New employee can be submited,fetched in existing from the database. Only the Employee admin team can perform these operations. We also have an alert mechanism for Convicted employees and an Alert Email is sent to HR when a Convicted Employee is added to the database. 
The backend of the application is built as a serverless application using AWS Lambda and javascript. The backend exposes Representational State Transfer (REST) API endpoints that handle requests from the frontend. The data is stored in DynamoDB, a cloud database service provided by AWS. The use of serverless architecture allows for automatic scaling based on demand, ensuring efficient resource allocation.

### 1.2 Functionality
The function in our project application is,such as, number of customer operation interface will be seen where a list of existing customer is visalbe in the form of table.This data is achieved using GET function with Dynomodb using lambda. A form is used to add a new customer, when this form is filled then using "Add customer" button is clicked to add the customer.This button internally performs the POST operation into dynomodb using lambda.


## Chapter 2 - Architecture 
**2.1 setup of architecture**
We planned our application requirements in a simple format and looked for suitable AWS services and structured the architecture

![](AWS ARCHITURE.jpeg) 
Figure 2.1 - AWS Architecture of Online grocery Store


**2.2 AWS - Services Used**

The application uses the following AWS services:

1. **AWS Lambda:** Executing the backend python code responsible for handling REST API requests. It reads and writes data to the database. Lambda was chosen for its serverless nature, automatically scaling and eliminating the need for server management.

2. **DynamoDB**: A NoSql database, was used in storing and retrieving  data about Customer details. DynamoDB was used because it provides table ,fast and predictable performance with seamless scalability. It is a managed NoSQL database which fits well with our serverless architecture.

3. **API Gateway**: For exposing the API endpoints and to interact with the lambda backend.

4. **Identity and Authorisation Management** **(IAM)**: IAM plays a crucial role in managing access control , policies and permissions for various AWS services, including DynamoDB. It ensures that only authorized entities have the necessary permissions to interact with specific resources.

5. **Simple Storage Service** (s3): Amzon provide the bucket in which we can store our files(data) so using s3 bucket to store our front part and makeing them static configuration to hosting static website content gobally and enhancing performance,reliablity, and security as well as cost-effective.

6. **Cloudwatch logs**: CloudWatch Logs is to monitor and troubleshoot of our application and infrastructure effectively. Using log group, we gain insights into the system's behavior, identify issues.

**2.3 Application scale**

The application scales out automatically as AWS lambda and dynamodb automatically scales out whenever we create more no. of customer data. When customer are added, lambda handles the workload concurrently.

**2.4 Data Model**

The data model of the application includes entities such details. The data model is stored in DynamoDB and follows a NoSQL structure. The attributes of the grocery related customer data is shown in Table 1.2

<table>
    <tbody>
        <tr>
            <td><strong>Attribute</strong></td>
            <td><strong>Data Type</strong></td>
        </tr>
        <tr>
            <td>Customer Name</td>
            <td>String</td>
        </tr>
        <tr>
            <td>Product Name</td>
            <td>string</td>
        </tr>
        <tr>
            <td>Quantity</td>
            <td>Number</td>
        </tr>
        <tr>
            <td>Price per Unit</td>
            <td>Number</td>
        </tr>
        <tr>
            <td>Total</td>
            <td>Number</td>
        </tr>
    </tbody>
</table>

**2.5 Application Programming Interface (API)**

The application exposes REST API endpoints to enable communication between the frontend and the backend. These endpoints handle requests for fetching customer data , and creating new customer data. The communication between the frontend and the backend occurs over HTTP protocols.

The communication between the frontend and backend is facilitated by the API Gateway, which acts as a mediator for the requests and responses.

 Table 2.2 - Api endpoints exposed by api gateway
 <table>
    <tbody>
    <tr>
            <td>Description</td>
            <td>HTTP Method</td>
            <td>Relative URL</td>
            <td>Request</td>
            <td>Sample Response</td>
        </tr>
    <tr>
            <td>Add new Customer</td>
            <td>POST</td>
            <td>/Grocery</td>
            <td>Post operation</td>
            <td>Records inserted successfully!</td>
        </tr>
        <tr>
            <td>Retrieve a Customer data</td>
            <td>GET</td>
            <td>/Grocery</td>
            <td>Get operation</td>
            <td>All customer data</td>
        </tr>
    </tbody>
</table>

**2.6 Communication between all components**

In this application's architecture, seamless communication among various AWS components ensures the smooth functioning of the system. Client interactions commence through API Gateway, acting as the gateway for requests, which then directs them to backend python code executed by AWS Lambda functions. These functions, in turn, interact with DynamoDB, a NoSQL database, for efficient storage and retrieval of grocery related customer data. Identity and Authorization Management (IAM) plays a pivotal role in maintaining secure access controls across different AWS services, including DynamoDB.With CloudWatch Logs providing insights for monitoring and troubleshooting. This orchestrated communication flow ensures the reliability, scalability, and security of the application's architecture.

## Chapter 3 -  Tooling
**3.1 Working on the application**

### How does a developer work on your application 
- step 1: git clone 
- step 2: git pull
- step 3: If the access key and Security Key is not added in the git repo then developer should add these keys in provider.tf.
- step 4: check the region, change accordingly to his current region. 
- step 5: terraform init 
- step 6: terraform plan 
- step 7: terraform apply --auto-approve
- step 8: In terminal we will have domian endpoints Url then use the url to access our application
- step 9: terraform destroy

- We put code in separeted file using which services provide which function,resorce or object so understand the code proccess in each files 
The development process of the application is facilitated by several tools and practices. The application was worked on in a local development environment in Visual Studio Code, a text editor. The following tools were installed in the local environment to enable testing parts of the application locally - 

-  **Command Line Interface for Amazon Web Services** (aws-cli) : for interacting with resources in the AWS account. An IAM user was created in the AWS portal and the access key id, secret access key and default aws region were stored in a file on disk.

-  **Git** : a version control system was used to save code changes, fetch code from the remote repository and also send code (push) to the remote repository.

-  **python language and javascript language** : python was used in implementing backend lambda function and javascript language is use for the REST api endpoints url to transfter in front-end. 

**3.2 Docker** : 
The Docker image encapsulates the necessary dependencies and environment for executing Terraform scripts. It streamlines the CI/CD process and enhances the reliability of infrastructure deployment tasks.

**3.3 Deployment Process**
Code changes in the serverless application are deployed using GitLab's CI/CD pipelines. The deployment process involves the following steps:

1. **Version Control and Collaboration**: Developers work in feature branches in the Git repository and collaborate using GitLab's version control system. Branches are created for each new feature or bug fix.


2. **Continuous Integration/Continuous Deployment (CI/CD)**: The CI/CD pipeline is triggered automatically when changes are pushed to the repository. It performs automated builds, tests, and deployments.

3. **Test and Deploy**: During the pipeline, the code changes are built, tested, and packaged for deployment. 

**3.4 Automation**
-  **Terraform** : an Infrastructure as Code tool, was used for automated infrastructure provisioning and management, ensuring consistent and reproducible deployments. It was used to define the AWS resources required for the application, such as API Gateway, Lambda functions, DynamoDB, and IAM policies.

-  **lambda testing** :Integrating Jest tests into GitLab CI/CD pipelines enables automated testing whenever changes are pushed to your repository, ensuring robust testing of frontend JavaScript interactions while Python handles backend logic, including AWS Lambda for API functionalities

- **CI/CD**: When code changes are deployed, GitLab CI/CD automatically applies the Terraform configuration, which creates, updates, or deletes the necessary AWS resources.


## Chapter 4 - Lessons Learned
### 4.1 - Learnings
- We have embarked on a captivating journey into the realm of cloud platforms. The evolution from those stringent measures to the seamless access of easily scalable, robust hardware through minimal lines of declarative configuration or a few intuitive clicks on cloud platforms has been a revelation.
Amidst this exploration, We delved into various AWS services, acquiring practical skills in deploying static websites, defining REST APIs,implementing Lambda functions,cloudwatch to check error log and mastering data interactions with DynamoDB for insert and fetch operations.

However, this journey wasn't without its challenges. Notably, we encountered a 403 Forbidden error(Internel server Error) during API testing, which required a nuanced approach in policy definition (as reflected in policy.tf). Additionally, grappling with CORS errors during URL automation and REST API deployment demanded innovative solutions, including a unique adjustment to the source_arn of aws_lambda_permission and the implementation of a dedicated CORS handling file in the project.After complateing the backend side most challanges we face to interact our frontend to backend beacuse our dynamic URL is genrated peoperly in json file but not apply into fron- end scripted file to solve this error we have worked more and for final sloution we apply for making url in script so it can apply properly and we successed in that.This journey has not only enriched our technical proficiency but has also provided valuable insights into troubleshooting and optimizing cloud-based infrastructures. We've accomplished the following activities:
* Deployed a static website.
* Defined a REST API 
* Implemented Lambda functions.
* Interacted with DynamoDB for CRUD operations.

## 4.2 - Challenges Faced and Solutions (complicated)

### 4.2.1 - 403 Forbidden Error for API Testing

- Encountering a 403 Forbidden error during API testing led to the realization that additional policies needed to be defined. This was addressed by adding relevant policies in iam_policy.tf.

### 4.2.2 - CORS Error Resolution

- Issue Deploying the REST API
During frontend testing, a CORS error emerged due to insufficient knowledge about cross-functional errors. The issue was addressed by learning more about CORS and implementing a specific file to handle it.
## Referance <a href="https://docs.aws.amazon.com/apigateway/latest/developerguide/how-to-cors.html">https://docs.aws.amazon.com/apigateway/latest/developerguide/how-to-cors.html
</a>

### 4.2.3 - Fetching the API_URL With script 
- First, we try the api url was fetched from the html file using a json file. First we performed echo operation to save the api url in a json file(api_url.json). This echo operation is done in the output.tf file. The api_url is saved in the json file as a key-value pair and this file is created in the frontend folder. 
From the json file, we are fetching the url into the html file using fetch operation in  tag. We are reading the json file and saving the value of the api_url key into a variable “apiUrl”. This apiUrl is made to be globally accessible and is used in code for GET, POST operation but there are main problem started because we suceesed to make dynamic apiurl which is replace in our json file correctly but when have to apply terraform again and at that time our apiurl syntax will change and it give us error.But in the end we find that it because of encording or url so it can be change at run time so we change the file formate and instead of making a "json" file we make js file(api_url.js) which is automatic genrated when we run terraform in one short and that "apiurl" will directly call in our Script.js file using "var apiurljs = apiUrl;" and we import our api_url.js file in index.html file as well so in the end in one short of applying terrform we get our desire output.overall. This is one of the challenge we faced in fetching the API_URL with script.

### 4.2.4 - Difficult to resolve
- The URL can be accessed successfully after using javascript file instead of json file.


## Chapter 5 - Conclusion
- We learned about the interaction between various AWS services and how to implement them with Terraform.
- we learned the basic fundamentals of cloud computing and creating a serverless application using Terraform.
- For our course project, we developed a serverless "Online Grocery store" application, applying the basics of cloud computing.

# Project Video
<video src="online grocery video.mp4="Project Video"></video> 
