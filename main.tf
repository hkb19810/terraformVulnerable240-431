# One scan target: all intentionally noncompliant modules are connected here.
# Source-scanning fixtures only. Do not deploy.
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region              = "us-east-1"
  allowed_account_ids = ["111111111111"]
}

module "bad_acm_cert_create_before_destroy" {
  source = "./modules/bad_acm_cert_create_before_destroy"
}

module "bad_alb_drop_http_headers" {
  source = "./modules/bad_alb_drop_http_headers"
}

module "bad_alb_listener_https" {
  source = "./modules/bad_alb_listener_https"
}

module "bad_ami_encryption" {
  source = "./modules/bad_ami_encryption"
}

module "bad_ami_launch_is_shared" {
  source = "./modules/bad_ami_launch_is_shared"
}

module "bad_api_gateway_deployment_create_before_destroy" {
  source = "./modules/bad_api_gateway_deployment_create_before_destroy"
}

module "bad_api_gateway_domain_name_tls" {
  source = "./modules/bad_api_gateway_domain_name_tls"
}

module "bad_api_gateway_method_settings_data_trace" {
  source = "./modules/bad_api_gateway_method_settings_data_trace"
}

module "bad_app_sync_logging" {
  source = "./modules/bad_app_sync_logging"
}

module "bad_batch_job_is_not_privileged" {
  source = "./modules/bad_batch_job_is_not_privileged"
}

module "bad_cloudfront_tls_12" {
  source = "./modules/bad_cloudfront_tls_12"
}

module "bad_cloudsearch_domain_enforce_https" {
  source = "./modules/bad_cloudsearch_domain_enforce_https"
}

module "bad_cloudsearch_domain_tls" {
  source = "./modules/bad_cloudsearch_domain_tls"
}

module "bad_dax_endpoint_tls" {
  source = "./modules/bad_dax_endpoint_tls"
}

module "bad_db_instance_backup_retention_period" {
  source = "./modules/bad_db_instance_backup_retention_period"
}

module "bad_doc_db_audit_logs" {
  source = "./modules/bad_doc_db_audit_logs"
}

module "bad_ebs_default_encryption" {
  source = "./modules/bad_ebs_default_encryption"
}

module "bad_ecs_cluster_logging_enabled" {
  source = "./modules/bad_ecs_cluster_logging_enabled"
}

module "bad_eks_node_group_remote_access" {
  source = "./modules/bad_eks_node_group_remote_access"
}

module "bad_elasticsearch_tls_policy" {
  source = "./modules/bad_elasticsearch_tls_policy"
}

module "bad_elb_cross_zone_enable" {
  source = "./modules/bad_elb_cross_zone_enable"
}

module "bad_elb_policy_uses_secure_protocols" {
  source = "./modules/bad_elb_policy_uses_secure_protocols"
}

module "bad_emr_cluster_kerberos_attributes" {
  source = "./modules/bad_emr_cluster_kerberos_attributes"
}

module "bad_glacier_vault_any_principal" {
  source = "./modules/bad_glacier_vault_any_principal"
}

module "bad_guardduty_detector_enabled" {
  source = "./modules/bad_guardduty_detector_enabled"
}

module "bad_iam_public_actions_policy" {
  source = "./modules/bad_iam_public_actions_policy"
}

module "bad_imagebuilder_distribution_configuration_encrypted" {
  source = "./modules/bad_imagebuilder_distribution_configuration_encrypted"
}

module "bad_imagebuilder_image_recipe_ebs_encrypted" {
  source = "./modules/bad_imagebuilder_image_recipe_ebs_encrypted"
}

module "bad_lambda_dlq_configured" {
  source = "./modules/bad_lambda_dlq_configured"
}

module "bad_lambda_function_url_auth" {
  source = "./modules/bad_lambda_function_url_auth"
}

module "bad_mq_broker_audit_logging" {
  source = "./modules/bad_mq_broker_audit_logging"
}

module "bad_mwaa_scheduler_logs_enabled" {
  source = "./modules/bad_mwaa_scheduler_logs_enabled"
}

module "bad_mwaa_webserver_logs_enabled" {
  source = "./modules/bad_mwaa_webserver_logs_enabled"
}

module "bad_mwaa_worker_logs_enabled" {
  source = "./modules/bad_mwaa_worker_logs_enabled"
}

module "bad_neptune_cluster_instance_public" {
  source = "./modules/bad_neptune_cluster_instance_public"
}

module "bad_neptune_cluster_logging" {
  source = "./modules/bad_neptune_cluster_logging"
}

module "bad_network_acl_unrestricted_ingress_20" {
  source = "./modules/bad_network_acl_unrestricted_ingress_20"
}

module "bad_network_acl_unrestricted_ingress_21" {
  source = "./modules/bad_network_acl_unrestricted_ingress_21"
}

module "bad_network_acl_unrestricted_ingress_22" {
  source = "./modules/bad_network_acl_unrestricted_ingress_22"
}

module "bad_network_acl_unrestricted_ingress_3389" {
  source = "./modules/bad_network_acl_unrestricted_ingress_3389"
}

module "bad_password_policy_length" {
  source = "./modules/bad_password_policy_length"
}

module "bad_password_policy_reuse" {
  source = "./modules/bad_password_policy_reuse"
}

module "bad_rds_encryption" {
  source = "./modules/bad_rds_encryption"
}

module "bad_red_shift_ssl" {
  source = "./modules/bad_red_shift_ssl"
}

module "bad_sage_maker_internet_access_disabled" {
  source = "./modules/bad_sage_maker_internet_access_disabled"
}

module "bad_security_group_unrestricted_ingress_20" {
  source = "./modules/bad_security_group_unrestricted_ingress_20"
}

module "bad_security_group_unrestricted_ingress_21" {
  source = "./modules/bad_security_group_unrestricted_ingress_21"
}

module "bad_security_group_unrestricted_ingress_22" {
  source = "./modules/bad_security_group_unrestricted_ingress_22"
}

module "bad_security_group_unrestricted_ingress_3389" {
  source = "./modules/bad_security_group_unrestricted_ingress_3389"
}

module "bad_security_group_unrestricted_ingress_any" {
  source = "./modules/bad_security_group_unrestricted_ingress_any"
}

module "bad_sns_topic_policy_any_principal" {
  source = "./modules/bad_sns_topic_policy_any_principal"
}

module "bad_sqs_queue_policy_any_principal" {
  source = "./modules/bad_sqs_queue_policy_any_principal"
}

module "bad_ssm_session_manager_document_logging" {
  source = "./modules/bad_ssm_session_manager_document_logging"
}

module "bad_subnet_public_ip" {
  source = "./modules/bad_subnet_public_ip"
}

module "bad_transfer_server_is_public" {
  source = "./modules/bad_transfer_server_is_public"
}

module "bad_vpc_endpoint_acceptance_configured" {
  source = "./modules/bad_vpc_endpoint_acceptance_configured"
}

module "bad_workspace_root_volume_encrypted" {
  source = "./modules/bad_workspace_root_volume_encrypted"
}

module "bad_workspace_user_volume_encrypted" {
  source = "./modules/bad_workspace_user_volume_encrypted"
}
