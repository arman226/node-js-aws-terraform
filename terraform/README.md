# TERRAFORM CONFIGURATION

## SET CREDENTIALS

```bash
export TF_VAR_aws_access_key="YOUR_ACCESS_KEY"
export TF_VAR_aws_secret_key="YOUR_SECRET_KEY"
```

## SET KEY PAIR

```bash
 export TF_VAR_key_name="your_key_pair_file_name"
```

## SSH

```bash
ssh -i "your-key-pair-file-name.pem" ec2-user@your_public_dns
```
