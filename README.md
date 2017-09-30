# Terraform Example
This very contrived example uses Terraform to deploy a containerised Node.JS app.

You will need:
* An AWS account, whose credentials are stored in:
```
$HOME/.aws/credentials
```
* a private key, which can be generated through AWS, stored in:
```
$HOME/.ssh/your-private-key.pem
```

Always run `plan` first:
```
terraform plan
```

Then run:
```
terraform apply
```

If successful:

```
Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

Outputs:

public_ip = 52.56.161.210
```

Go to http://52.56.161.210:8080/
