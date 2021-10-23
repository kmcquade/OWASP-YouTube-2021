# CloudQuery for identifying public network endpoints

You can try creating these in the [CloudQuery portal](https://app.cloudquery.io/admin/queries).

- [API Gateways](#api-gateways)
- [CloudFront Distributions](#cloudfront-distributions)
- [EC2 instances with Public IPs](#ec2-instances-with-public-ips)
- [ElasticSearch](#elasticsearch)
- [ElastiCache](#elasticache)
- [ELB Classic](#elb-classic)
- [ELBv2](#elbv2)
- [EMR](#emr)
- [Redshift](#redshift)
- [RDS](#rds)

The following resources are **not** supported today by CloudQuery, but are coming soon:
- [Elastic IPS that are not attached to EC2 Instances](#elastic-ips-that-are-not-attached-to-ec2-instances)
- [ElastiCache](#elasticache)
- [Global Accelerator](#global-accelerator)
- [Lightsail](#lightsail)
- [NeptuneDB](#neptunedb)

# Supported Today

## API Gateways

```sql
select id, hostname, ip_addresses, account_id, region from aws_api_gateway where public_ipaddress is not null
```

## CloudFront Distributions

```sql
select domain_name, account_id, arn  from aws_cloudfront_distributions
```

## EC2 instances with Public IPs

```sql
select id, public_dns_name, public_ip_address, account_id, region from aws_ec2_instances where public_ip_address is not null

```

> __Note__: this covers ECS, EKS, Beanstalk, Fargate, Batch, & NAT Instances.

## ElasticSearch

```sql
select * from aws_elasticsearch_domains where endpoint is not null or endpoints->'vpc' is not null;
```

## ELB Classic

```sql
select id, hostname, ip_addresses, account_id, region from aws_elb where public_ip_address is not null
```

## ELBv2

```sql
SELECT name, dns_name, account_id, region FROM aws_elbv2_load_balancers WHERE scheme = 'internet-facing';
```

## EMR

```sql
-- TODO
```

## Redshift

```sql
select account_id, region, id, endpoint_address, endpoint_port from aws_redshift_clusters;

```

## RDS

```sql
select id, hostname, ip_addresses, account_id, region from aws_rds_clusters where public_ip_address is not null
```

# Not supported yet

## Elastic IPs that are not attached to EC2 Instances

This resource is not supported yet. For more details on this resource, see the entry in Scott Piper's [aws_exposable_resources](https://github.com/SummitRoute/aws_exposable_resources#elastic-ip).

## ElastiCache

This resource is not supported yet. For more details on this resource, see the entry in Scott Piper's [aws_exposable_resources](https://github.com/SummitRoute/aws_exposable_resources#elasticcache).

## Global Accelerator

This resource is not supported yet. For more details on this resource, see the entry in Scott Piper's [aws_exposable_resources](https://github.com/SummitRoute/aws_exposable_resources#global-accelerator).

## Lightsail

This resource is not supported yet. For more details on this resource, see the entry in Scott Piper's [aws_exposable_resources](https://github.com/SummitRoute/aws_exposable_resources#lightsail).

## NeptuneDB

This resource is not supported yet. For more details on this resource, see the entry in Scott Piper's [aws_exposable_resources](https://github.com/SummitRoute/aws_exposable_resources#neptune).

# Prior Art

* [AWS Exposable Resources](https://github.com/SummitRoute/aws_exposable_resources#resources-that-can-be-made-public-through-network-access) by [Scott Piper](https://twitter.com/0xdabbad00)
* [aws_public_ips](https://github.com/arkadiyt/aws_public_ips) by [Arkadiy Tetelman](https://twitter.com/arkadiyt)
