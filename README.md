# AWS-SecurityAudit

run install.sh

creates user SecConsultant \n
creates group SecurityAudit

creates MFA CLI policy to require MFA from the CLI \n
create prowler policy with addtional permissions for testing

attaches built-in SecurityAudit policy (arn:aws:iam::aws:policy/SecurityAudit) to SecurityAudit group
attaches MFA-CLI-Policy and Prowler-Policy to SecurityAudit group

Generates CLI access keys.  **Keys need to be copied
