This CloudFormation template that recreates the IAM role with the same permissions as the original "app-AST-S3-ADMIN=fGLBAZADEDPInfra@I+000" role but with the new name "app-AST-S3-LANDING=fGLBAZADEDPInfra@I+000". Here are the key features:
Key Components:

OIDC Integration: The trust policy includes the EKS OIDC provider to allow service accounts in the astronomer namespace to assume the role securely.
Managed Policies: All the same AWS managed policies from the original role:

AmazonRDSDataFullAccess
AmazonRDSFullAccess
ReadOnlyAccess
SecretsManagerReadWrite
AWSGlueConsoleFullAccess
AmazonDynamoDBReadOnlyAccess
AmazonS3ReadOnlyAccess


Inline Policies: Four custom policies matching the original role:

ChangeSecretsPolicy: Full secrets management for astronomer paths
DynamoDbTfStateEditPolicy: DynamoDB operations for Terraform state
KMSAccessPolicy: Comprehensive KMS key management
S3BucketTfStateEditPolicy: S3 bucket management for Terraform state



Important Setup Requirements:
Before deploying this template, you'll need to:

1. Get the OIDC Provider ID from your EKS cluster:
aws eks describe-cluster --name eks-astro-dev --region eu-west-1 --query "cluster.identity.oidc.issuer"

2. Ensure the OIDC Provider exists in IAM:
aws iam list-open-id-connect-providers

3. Update the parameters in the template with your specific values (account ID, region, cluster name, etc.).

The template includes proper parameterization and outputs for easy integration with other CloudFormation stacks 
or CI/CD pipelines. The role will allow secure federated access from EKS service accounts while maintaining all the 
original permissions for AWS services.