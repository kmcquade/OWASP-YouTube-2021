# Demo for OWASP DevSlop YouTube Talk: Cloud Security Tooling for the Sole Practitioner

Terraform for a vulnerable AWS environment that I use as the subject of my OWASP DevSlop talk, "Cloud Security Tooling for the Sole Practitioner." 

# Demo instructions

* First, set up a sandbox AWS Account that you will throw away after this tutorial.
* Create some admin credentials with access keys.
* Use `aws configure` to set up a local credentials profile with the access keys.
  * **Important**: name the profile `vulnerable-aws`.
* Install the prerequisite software (HomeBrew or LinuxBrew assumed):
  * `make install-tf`
  * `make install-checkov`

### Setup

* First, make sure you have the code for the Git Submodules, where we have the purposefully vulnerable AWS environments.

```bash
make update-submodule
```

* Next, create the Infrastructure for the purposefully vulnerable environments

```bash
make demo-iam-vulnerable
make demo-resource-exposure
make demo-sadcloud
```

* Lastly, create the Infrastructure for the Prowler demo, where we show how to run Prowler out of AWS CodeBuild as scheduled jobs.

```bash
make demo-prowler
```

# Checkov

```bash
make checkov-filtered
make checkov-enable-all
make checkov-simple-enable-all
make checkov-simple-filtered
```

# References

**Purposefully vulnerable environments**:
* [iam-vulnerable](https://github.com/BishopFox/iam-vulnerable)
* [terraform-aws-resource-exposure](https://github.com/kmcquade/terraform-aws-resource-exposure): AWS environment with vulnerable resource policies
* [Terragoat](https://github.com/bridgecrewio/terragoat/): This is not actually provisioned, we just use it for scanning Checkov.
* [SadCloud](https://github.com/nccgroup/sadcloud): Purposefully vulnerable Terraform environment


**Documentation**:
* [Checkov - .checkov.yml Config file](https://github.com/bridgecrewio/checkov#configuration-using-a-config-file) 
* [Prowler - Security Hub Integration](https://github.com/toniblyx/prowler#security-hub-integration)
* [Prowler - automated scans in single AWS account](https://github.com/toniblyx/prowler/tree/master/util/codebuild)
* [Prowler - automated scans in multiple AWS Accounts](https://github.com/toniblyx/prowler/tree/master/util/org-multi-account)

**Solutions**:
* [Domain Protect]()
