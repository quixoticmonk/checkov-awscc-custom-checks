resource "awscc_guardduty_detector" "pass" {
  enable = true
  organization_configuration {
    auto_enable = true
    datasources {
      s3_logs {
        auto_enable = true
      }
      kubernetes {
        audit_logs {
          auto_enable = true
        }
      }
      malware_protection {
        scan_ec2_instance_with_findings {
          auto_enable = true
        }
      }
    }
  }
}

resource "awscc_guardduty_detector" "fail_not_enabled" {
  enable = false
  organization_configuration {
    auto_enable = true
  }
}

resource "awscc_guardduty_detector" "fail_no_org_auto_enable" {
  enable = true
  organization_configuration {
    auto_enable = false
  }
}

resource "awscc_guardduty_detector" "fail_no_org_config" {
  enable = true
  # Missing organization_configuration
}
