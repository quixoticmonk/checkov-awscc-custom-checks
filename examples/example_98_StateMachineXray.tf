resource "awscc_stepfunctions_state_machine" "pass" {
  definition = jsonencode({
    Comment = "A Hello World example of the Amazon States Language using Pass states",
    StartAt = "Hello",
    States = {
      Hello = {
        Type     = "Pass",
        Result   = "Hello",
        Next     = "World"
      },
      World = {
        Type     = "Pass",
        Result   = "World",
        End      = true
      }
    }
  })
  
  role_arn = "arn:aws:iam::123456789012:role/service-role/StepFunctions-StateMachine-Role"
  
  tracing_configuration = {
    enabled = true
  }
  
  tags = [
    {
      key   = "Environment"
      value = "Production"
    }
  ]
}

resource "awscc_stepfunctions_state_machine" "fail" {
  definition = jsonencode({
    Comment = "A Hello World example of the Amazon States Language using Pass states",
    StartAt = "Hello",
    States = {
      Hello = {
        Type     = "Pass",
        Result   = "Hello",
        Next     = "World"
      },
      World = {
        Type     = "Pass",
        Result   = "World",
        End      = true
      }
    }
  })
  
  role_arn = "arn:aws:iam::123456789012:role/service-role/StepFunctions-StateMachine-Role"
  
  tracing_configuration = {
    enabled = false
  }
  
  tags = [
    {
      key   = "Environment"
      value = "Development"
    }
  ]
}

resource "awscc_stepfunctions_state_machine" "fail2" {
  definition = jsonencode({
    Comment = "A Hello World example of the Amazon States Language using Pass states",
    StartAt = "Hello",
    States = {
      Hello = {
        Type     = "Pass",
        Result   = "Hello",
        Next     = "World"
      },
      World = {
        Type     = "Pass",
        Result   = "World",
        End      = true
      }
    }
  })
  
  role_arn = "arn:aws:iam::123456789012:role/service-role/StepFunctions-StateMachine-Role"
  
  # No tracing_configuration specified (defaults to disabled)
  
  tags = [
    {
      key   = "Environment"
      value = "Development"
    }
  ]
}
