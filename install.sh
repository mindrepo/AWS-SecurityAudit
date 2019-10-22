export AWS_DEFAULT_PROFILE=default
export ACCOUNT_ID=$(aws sts get-caller-identity --query 'Account' | tr -d '"')
aws iam create-group --group-name SecurityAudit
aws iam create-policy --policy-name MFA-CLI-SecAuditPolicy --policy-document file://$(pwd)/mfa-cli-policy.json
aws iam create-policy --policy-name Prowler-SecAuditPolicy --policy-document file://$(pwd)/prowler-policy.json
aws iam attach-group-policy --group-name SecurityAudit --policy-arn arn:aws:iam::${ACCOUNT_ID}:policy/MFA-CLI-SecAuditPolicy
aws iam attach-group-policy --group-name SecurityAudit --policy-arn arn:aws:iam::${ACCOUNT_ID}:policy/Prowler-SecAuditPolicy
aws iam attach-group-policy --group-name SecurityAudit --policy-arn arn:aws:iam::aws:policy/SecurityAudit
aws iam attach-group-policy --group-name SecurityAudit --policy-arn arn:aws:iam::aws:policy/job-function/ViewOnlyAccess
aws iam create-user --user-name SecConsultant
aws iam add-user-to-group --user-name SecConsultant --group-name SecurityAudit
aws iam create-access-key --user-name SecConsultant
unset ACCOUNT_ID AWS_DEFAULT_PROFILE
