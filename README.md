# opg-aws-config-service
OPG AWS Config Service: Managed by opg-org-infra &amp; Terraform

#### Purpose

This module can be called to set up aws config service per account and region
and is fully managed by terraform.

#### How it works

The main rules can be found in the support scripts folder and there is even a basic
bash script you can use to extract the rules from the website (as there doesn't seem to be
a list of rules as part of aws cli currently. These can be added as you wish
to the `rules.json` which generates the rules using a resource with a for_each loop over it
in `config-rules.tf`.

The iam role and s3 bucket are shared by all regions on the account but the rules and
recorder setup are per region (account folder and account_region respectively).

There is an example setup of how the modules would be called in the example folder.

Notice in the `locals.tf` in the example folder, we have included the full list of the standard AWS rules
that can be included in your configs. Just pick the rules that you want to use from this list.

This has been tested to integrate with the notify service but it's not in this module as
the dependencies for it are problematic on first creation.
