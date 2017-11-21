module "claim-store-api" {
  source = "git@github.com/contino/moj-module-webapp.git?ref=0.0.78"
  product = "${var.product}-${var.microservice}"
  location = "${var.location}"
  env = "${var.env}"
  asename = "${data.terraform_remote_state.core_apps_compute.ase_name[0]}"

  app_settings = {
    //    logging vars
    ROOT_APPENDER = "JSON_CONSOLE"
    REFORM_TEAM = "${var.product}"
    REFORM_SERVICE_NAME = "${var.microservice}"
    REFORM_ENVIRONMENT = "${var.env}"

    // db vars
    CLAIM_STORE_DB_HOST = "${module.claim-store-database.host_name}"
    CLAIM_STORE_DB_PORT = "${module.claim-store-database.postgresql_listen_port}"
    POSTGRES_DATABASE = "${module.claim-store-database.postgresql_database}"
    CLAIM_STORE_DB_USERNAME = "${module.claim-store-database.user_name}"
    CLAIM_STORE_DB_PASSWORD = "${module.claim-store-database.password}"
  }
}

module "claim-store-database" {
  source = "git@github.com/contino/moj-module-postgres?ref=master"
  product = "${var.product}"
  location = "West Europe"
  env = "${var.env}"
  postgresql_user = "claimstore"
  postgresql_password = "Password1" // TODO: keyvault?
}
