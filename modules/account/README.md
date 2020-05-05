#### Account Wide Settings

The following sub module sets up the following components:

* IAM Role for the config service with account wide access
* S3 bucket for the config service with access from IAM role
* Optional Config Aggregator

For the config aggregator to work you will need to additionally allow
it access to your region and account. This is not included in this repo at this time
but will be updated in a later version.
