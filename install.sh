export AWS_DEFAULT_PROFILE=default
export ACCOUNT_ID=$(aws sts get-caller-identity --query 'Account' | tr -d '"')
aws iam create-group --group-name SecurityAudit
aws iam create-policy --policy-name MFA-CLI-Policy --policy-document file://$(pwd)/mfa-cli-policy.json
aws iam attach-group-policy --group-name SecurityAudit --policy-arn arn:aws:iam::${ACCOUNT_ID}:policy/MFA-CLI-Policy
aws iam attach-group-policy --group-name SecurityAudit --policy-arn arn:aws:iam::aws:policy/SecurityAudit
aws iam create-user --user-name SecurityConsultant
aws iam add-user-to-group --user-name SecurityConsultant --group-name SecurityAudit
aws iam create-access-key --user-name SecurityConsultant
unset ACCOUNT_ID AWS_DEFAULT_PROFILE
