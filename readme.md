### This project define the Ec2 infraestructure and installed services and applications for deploying developers applications into a containerized environment.

#### Advice: For security reasons, we recomend to use env variables for authentication procesess to AWS, you must export AWS access_key and secret_key as env variables.
-----------------------------------------------------------------------------------------------------------------------------------------------------------

#### Using env variables:
```
$ export AWS_ACCESS_KEY_ID="access_key"
$ export AWS_SECRET_ACCESS_KEY="secret_key"
$ export AWS_DEFAULT_REGION="us-west-2"
$ terraform plan
```

#### Using into hard-coded terraform configuration file .tf (not recomended):
```
provider "aws" {
  region     = "us-west-2"
  access_key = "my-access-key"
  secret_key = "my-secret-key"
}
```

#### Using into AWS credential configuration file:
```
provider "aws" {
  region                  = "us-west-2"
  shared_credentials_file = "/Users/tf_user/.aws/creds"
  profile                 = "customprofile"
}
```