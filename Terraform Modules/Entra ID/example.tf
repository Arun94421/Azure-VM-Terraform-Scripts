module "entra_id_setup" {
  source = "./"  # Current directory (adjust as necessary)

  user_principal_name  = "testuser@yourdomain.com"
  user_display_name    = "Test User"
  user_mail_nickname   = "testuser"
  user_password        = "StrongPassword123"
  group_display_name   = "TestGroup"
}
